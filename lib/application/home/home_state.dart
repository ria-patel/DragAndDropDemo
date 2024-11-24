part of 'home_bloc.dart';

@CopyWith()
class HomeState extends Equatable {
  final bool isLoading;
  final bool isFailed;
  final bool isSuccessful;
  final String responseMessage;
  final bool isItemBeingDragged;
  final List<WidgetType> widgetTypeList;
  final List<Widget> widgetList;
  final List<WidgetDto> widgetDataList;
  final int selectedIndex;
  final WidgetMapper widgetMapper;
  final PropertiesMapper propertiesMapper;
  final GlobalKey<AnimatedListState> listKey;
  final String title;
  final String activeColor;
  final bool value;

  const HomeState({
    required this.isLoading,
    required this.isFailed,
    required this.isSuccessful,
    required this.responseMessage,
    required this.isItemBeingDragged,
    required this.widgetTypeList,
    required this.widgetList,
    required this.widgetDataList,
    required this.selectedIndex,
    required this.widgetMapper,
    required this.propertiesMapper,
    required this.listKey,
    required this.title,
    required this.activeColor,
    required this.value,
  });

  factory HomeState.initial() {
    return HomeState(
      isLoading: false,
      isFailed: false,
      isSuccessful: false,
      responseMessage: '',
      isItemBeingDragged: false,
      widgetTypeList: List.of(WidgetType.values.getRange(0, 3)),
      widgetList: const [],
      widgetDataList: const [],
      selectedIndex: -1,
      widgetMapper: IWidgetMapper(),
      propertiesMapper: IPropertiesMapper(),
      listKey: GlobalKey<AnimatedListState>(),
      title: '',
      activeColor: '#673AB7',
      value: false,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        isFailed,
        isSuccessful,
        responseMessage,
        isItemBeingDragged,
        widgetTypeList,
        widgetList,
        widgetDataList,
        selectedIndex,
        widgetMapper,
        propertiesMapper,
        listKey,
        title,
        activeColor,
        value,
      ];
}
