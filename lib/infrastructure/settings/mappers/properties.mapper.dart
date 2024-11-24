import 'package:app_demo/infrastructure/settings/dtos/checkbox/checkbox.dto.dart';
import 'package:app_demo/infrastructure/settings/dtos/settings.dto.dart';
import 'package:app_demo/infrastructure/settings/dtos/switch/switch.dto.dart';
import 'package:app_demo/infrastructure/settings/dtos/text/text.dto.dart';
import 'package:app_demo/infrastructure/settings/enums/widget_type.enum.dart';

abstract interface class PropertiesMapper {
  WidgetProperties toProperties(WidgetType widgetType,
      {WidgetProperties? widgetProperties});
}

class IPropertiesMapper implements PropertiesMapper {
  @override
  WidgetProperties toProperties(WidgetType widgetType,
      {WidgetProperties? widgetProperties}) {
    switch (widgetType) {
      case WidgetType.checkboxListTile:
        if (widgetProperties != null) {
          CheckboxDto checkboxDto = widgetProperties as CheckboxDto;
          return CheckboxDto(
            activeColor: checkboxDto.activeColor,
            title: checkboxDto.title,
          );
        }
        return CheckboxDto();

      case WidgetType.switchListTile:
        if (widgetProperties != null) {
          SwitchDto switchDto = widgetProperties as SwitchDto;
          return SwitchDto(
            activeColor: switchDto.activeColor,
            title: switchDto.title,
          );
        }
        return SwitchDto();
      case WidgetType.text:
        if (widgetProperties != null) {
          TextDto switchDto = widgetProperties as TextDto;
          return TextDto(
            textColor: switchDto.textColor,
            title: switchDto.title,
          );
        }
        return TextDto();
      default:
        if (widgetProperties != null) {
          TextDto switchDto = widgetProperties as TextDto;
          return TextDto(
            textColor: switchDto.textColor,
            title: switchDto.title,
          );
        }
        return TextDto();
    }
  }
}
