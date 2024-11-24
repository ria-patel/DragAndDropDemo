import 'package:app_demo/infrastructure/settings/dtos/widget/widget.dto.dart';

class SettingsDto {
  final int id;
  final List<WidgetDto> widgets;

  SettingsDto({
    required this.id,
    required this.widgets,
  });

  factory SettingsDto.fromJson(Map<String, dynamic> json) {
    return SettingsDto(
      id: json['id'],
      widgets: (json['widgets'] as List<dynamic>?)
              ?.map((e) => WidgetDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      // widgets: List<WidgetDto>.from(
      //   json['widgets'].map((widget) => WidgetDto.fromJson(widget)),
      // ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'widgets': widgets.map((widget) => widget.toJson()).toList(),
    };
  }
}

abstract class WidgetProperties {
  Map<String, dynamic> toJson();
}
