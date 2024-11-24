import 'package:app_demo/infrastructure/settings/dtos/checkbox/checkbox.dto.dart';
import 'package:app_demo/infrastructure/settings/dtos/settings.dto.dart';
import 'package:app_demo/infrastructure/settings/dtos/switch/switch.dto.dart';
import 'package:app_demo/infrastructure/settings/dtos/text/text.dto.dart';
import 'package:app_demo/infrastructure/settings/enums/widget_type.enum.dart';
import 'package:app_demo/infrastructure/settings/mappers/enum.mapper.dart';

class WidgetDto {
  final String widgetType;
  final WidgetProperties properties;

  WidgetDto({
    required this.widgetType,
    required this.properties,
  });

  factory WidgetDto.fromJson(Map<String, dynamic> json) {
    late WidgetProperties properties;
    switch (EnumMapper.stringToEnum(json['widgetType'])) {
      case WidgetType.text:
        properties = TextDto.fromJson(json['properties']);
        break;
      case WidgetType.checkboxListTile:
        properties = CheckboxDto.fromJson(json['properties']);
        break;
      case WidgetType.switchListTile:
        properties = SwitchDto.fromJson(json['properties']);
        break;
      default:
        throw Exception('Unknown widget type: ${json['widgetType']}');
    }

    return WidgetDto(
      widgetType: json['widgetType'],
      properties: properties,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'widgetType': widgetType,
      'properties': properties.toJson(),
    };
  }
}
