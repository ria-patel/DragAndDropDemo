import 'package:app_demo/infrastructure/settings/dtos/settings.dto.dart';

class SwitchDto extends WidgetProperties {
  final String activeColor;
  final String title;
  final bool value;

  SwitchDto({
    this.activeColor = '#673AB7',
    this.title = 'Active',
    this.value = true,
  });

  factory SwitchDto.fromJson(Map<String, dynamic> json) {
    return SwitchDto(
      activeColor: json['activeColor'],
      title: json['title'],
      value: json['value'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'activeColor': activeColor,
      'title': title,
      'value': value,
    };
  }
}
