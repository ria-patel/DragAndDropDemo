// Package imports:
import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'value')
enum WidgetType {
  checkboxListTile('CheckboxListTile'),
  switchListTile('SwitchListTile'),
  text('Text'),
  unknown('Unknown');

  final String value;

  const WidgetType(this.value);
}