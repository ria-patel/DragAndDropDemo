// Package imports:
import 'package:app_demo/infrastructure/settings/dtos/settings.dto.dart';
import 'package:app_demo/infrastructure/settings/dtos/text/text.dto.dart';
import 'package:app_demo/infrastructure/settings/dtos/widget/widget.dto.dart';
import 'package:app_demo/infrastructure/settings/enums/widget_type.enum.dart';
import 'package:app_demo/infrastructure/settings/mappers/enum.mapper.dart';
import 'package:app_demo/infrastructure/settings/mappers/properties.mapper.dart';
import 'package:app_demo/infrastructure/settings/mappers/widget.mapper.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:app_demo/domain/settings/settings.repository.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.g.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final SettingsRepository _settingsRepository;

  HomeBloc(
    this._settingsRepository,
  ) : super(HomeState.initial()) {
    on<CreateSetting>((event, emit) async {
      emit(
        state.copyWith(
          isLoading: true,
          isFailed: false,
          isSuccessful: false,
          responseMessage: '',
        ),
      );
      final result = await _settingsRepository.createSetting(event.settingsDto);
      result.fold(
        (l) {
          emit(
            state.copyWith(
              isFailed: true,
              isLoading: false,
              responseMessage: l,
            ),
          );
        },
        (r) {
          emit(
            state.copyWith(
              isSuccessful: true,
              isLoading: false,
              responseMessage: 'Added successfully!',
            ),
          );
        },
      );
    });
    on<RetrieveSetting>((event, emit) async {
      emit(
        state.copyWith(
          isLoading: true,
          isFailed: false,
          isSuccessful: false,
          responseMessage: '',
        ),
      );
      final result = await _settingsRepository.retrieveSetting();
      result.fold(
        (l) {
          emit(
            state.copyWith(
              isFailed: true,
              isLoading: false,
              responseMessage: l,
            ),
          );
        },
        (r) {
          List<Widget> widgetList = [
            ...state.widgetMapper.generateWidgetList(r.widgets)
          ];

          emit(
            state.copyWith(
              isSuccessful: true,
              isLoading: false,
              widgetDataList: [...r.widgets],
              widgetList: [...widgetList],
              listKey: GlobalKey<AnimatedListState>(),
            ),
          );
        },
      );
    });
    on<OnItemDragged>((event, emit) {
      emit(state.copyWith(isItemBeingDragged: event.isItemBeingDragged));
    });
    on<AddWidgetData>((event, emit) {
      WidgetType widgetType = state.widgetMapper.toWidgetType(event.widget);

      List<WidgetDto> widgetDataList = [...state.widgetDataList];
      List<Widget> widgetList = [...state.widgetList];
      List<WidgetType> widgetTypeList = [...state.widgetTypeList];

      widgetDataList.add(WidgetDto(
        widgetType: widgetType.value,
        properties: state.propertiesMapper.toProperties(widgetType),
      ));

      widgetList.add(event.widget);

      state.listKey.currentState
          ?.insertItem(widgetList.length - 1); // Trigger animation

      widgetTypeList.removeWhere((element) => element == widgetType);

      emit(state.copyWith(
        widgetDataList: [...widgetDataList],
        widgetList: [...widgetList],
        widgetTypeList: [...widgetTypeList],
      ));
    });
    on<OnIndexChanged>((event, emit) {
      WidgetDto widgetDto = state.widgetDataList[event.selectedIndex];
      String widgetTypeStr = widgetDto.widgetType;
      WidgetType widgetType = EnumMapper.stringToEnum(widgetTypeStr);
      WidgetProperties widgetProperties = state.propertiesMapper.toProperties(
        widgetType,
        widgetProperties: widgetDto.properties,
      );

      bool isText = widgetProperties is TextDto;

      emit(state.copyWith(
        selectedIndex: event.selectedIndex,
        title: widgetProperties.toJson()['title'],
        value: isText ? false : widgetProperties.toJson()['value'],
        activeColor: isText
            ? widgetProperties.toJson()['textColor']
            : widgetProperties.toJson()['activeColor'],
      ));
    });
    on<AddTitle>((event, emit) {
      emit(state.copyWith(title: event.title));
    });
    on<AddActiveColor>((event, emit) {
      emit(state.copyWith(activeColor: event.activeColor));
    });
    on<AddValue>((event, emit) {
      emit(state.copyWith(value: event.value));
    });
    on<UpdateWidget>((event, emit) {
      List<WidgetDto> widgetDataList = [...state.widgetDataList];

      widgetDataList[state.selectedIndex] = event.widgetDto;

      emit(state.copyWith(widgetDataList: [...widgetDataList]));
    });
  }
}
