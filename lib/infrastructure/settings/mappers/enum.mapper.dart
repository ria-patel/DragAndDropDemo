import 'package:app_demo/infrastructure/settings/enums/widget_type.enum.dart';

class EnumMapper {
  static String enumToString(WidgetType widgetType) {
    return widgetType.value;
  }

  static WidgetType stringToEnum(String widgetType) {
    return WidgetType.values
        .firstWhere((element) => widgetType == element.value);
  }
}
