import 'package:app_demo/application/home/home_bloc.dart';
import 'package:app_demo/domain/core/constants/hive.constants.dart';
import 'package:app_demo/domain/core/constants/string.constants.dart';
import 'package:app_demo/domain/core/utils/app_utils.dart';
import 'package:app_demo/infrastructure/core/di.dart';
import 'package:app_demo/infrastructure/settings/dtos/checkbox/checkbox.dto.dart';
import 'package:app_demo/infrastructure/settings/dtos/settings.dto.dart';
import 'package:app_demo/infrastructure/settings/dtos/switch/switch.dto.dart';
import 'package:app_demo/infrastructure/settings/dtos/text/text.dto.dart';
import 'package:app_demo/infrastructure/settings/dtos/widget/widget.dto.dart';
import 'package:app_demo/infrastructure/settings/enums/widget_type.enum.dart';
import 'package:app_demo/presentation/auth/widgets/label_view.dart';
import 'package:app_demo/presentation/core/widgets/custom_text_field.dart';
import 'package:app_demo/presentation/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:hive/hive.dart';

class WidgetEditorView extends StatelessWidget {
  final Widget selectedWidget;
  final WidgetDto selectedWidgetDto;

  const WidgetEditorView({
    super.key,
    required this.selectedWidget,
    required this.selectedWidgetDto,
  });

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String widgetType = selectedWidgetDto.widgetType;

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Form(
                key: _formKey,
                child: CustomTextField(
                  key: ValueKey(state.title),
                  initialValue: state.title,
                  hintText: StringConstants.enterTitle,
                  labelText: StringConstants.title,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return StringConstants.required;
                    }
                    return null;
                  },
                  onChanged: (value) {
                    homeBloc.add(AddTitle(title: value.trim()));
                  },
                ),
              ),
              const SizedBox(height: 20),
              LabelView(
                  text: widgetType == WidgetType.text.value
                      ? StringConstants.textColor
                      : StringConstants.activeColor),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.grey.shade600,
                    width: 0,
                  ),
                ),
                child: ColorPicker(
                  pickerColor: AppUtils.hexToColor(state.activeColor),
                  portraitOnly: true,
                  hexInputBar: true,
                  labelTypes: const [],
                  paletteType: PaletteType.hsv,
                  pickerAreaHeightPercent: 0.7,
                  onColorChanged: (color) {
                    String hexValue =
                        '#${color.value.toRadixString(16).substring(2).toUpperCase()}';

                    homeBloc.add(AddActiveColor(activeColor: hexValue.trim()));
                  },
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: PrimaryButton(
                      title: StringConstants.save,
                      onPressed: () {
                        WidgetProperties? widgetProperties;

                        if (widgetType == WidgetType.text.value) {
                          widgetProperties = TextDto(
                            textColor: state.activeColor,
                            title: state.title,
                          );
                        } else if (widgetType ==
                            WidgetType.checkboxListTile.value) {
                          widgetProperties = CheckboxDto(
                            activeColor: state.activeColor,
                            title: state.title,
                          );
                        } else if (widgetType ==
                            WidgetType.switchListTile.value) {
                          widgetProperties = SwitchDto(
                            activeColor: state.activeColor,
                            title: state.title,
                          );
                        }

                        FocusScope.of(context).unfocus();
                        if (_formKey.currentState!.validate()) {
                          homeBloc.add(UpdateWidget(
                            widgetDto: WidgetDto(
                              widgetType: widgetType,
                              properties: widgetProperties!,
                            ),
                          ));
                        }
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: PrimaryButton(
                      title: StringConstants.submit,
                      onPressed: () {
                        var box = Hive.box(HiveConstants.hiveBox);
                        final userId = box.get(HiveConstants.userId,defaultValue: 1231);

                        homeBloc.add(CreateSetting(
                            settingsDto: SettingsDto(
                          id: userId,
                          widgets: state.widgetDataList,
                        )));
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}
