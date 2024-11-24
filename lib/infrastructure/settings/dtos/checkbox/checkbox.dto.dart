
import 'package:app_demo/infrastructure/settings/dtos/settings.dto.dart';

class CheckboxDto extends WidgetProperties {
  final String activeColor;
  final String title;
  final bool value;

  CheckboxDto({
    this.activeColor = '#673AB7',
    this.title = 'I agree to the terms & conditions and privacy policy.',
    this.value = true,
  });

  factory CheckboxDto.fromJson(Map<String, dynamic> json) {
    return CheckboxDto(
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
