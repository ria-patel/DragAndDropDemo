import 'package:app_demo/infrastructure/settings/dtos/settings.dto.dart';

class TextDto extends WidgetProperties {
  final String title;
  final String textColor;

  TextDto({
    this.title = 'Sample Text',
    this.textColor = '#000000',
  });

  factory TextDto.fromJson(Map<String, dynamic> json) {
    return TextDto(
      title: json['title'],
      textColor: json['textColor'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'textColor': textColor,
    };
  }
}
