import 'package:app_demo/domain/core/utils/app_utils.dart';
import 'package:app_demo/infrastructure/settings/dtos/checkbox/checkbox.dto.dart';
import 'package:app_demo/infrastructure/settings/dtos/switch/switch.dto.dart';
import 'package:app_demo/infrastructure/settings/dtos/text/text.dto.dart';
import 'package:app_demo/infrastructure/settings/dtos/widget/widget.dto.dart';
import 'package:app_demo/infrastructure/settings/enums/widget_type.enum.dart';
import 'package:app_demo/infrastructure/settings/mappers/enum.mapper.dart';
import 'package:flutter/material.dart';

abstract interface class WidgetMapper {
  Widget toWidget(WidgetType widgetType);

  WidgetType toWidgetType(Widget widget);

  List<Widget> generateWidgetList(List<WidgetDto> widgetDataList);
}

class IWidgetMapper implements WidgetMapper {
  @override
  Widget toWidget(WidgetType widgetType) {
    switch (widgetType) {
      case WidgetType.checkboxListTile:
        return CheckboxListTile(
          value: true,
          onChanged: (value) {},
        );
      case WidgetType.switchListTile:
        return SwitchListTile(
          value: true,
          onChanged: (value) {},
        );
      case WidgetType.text:
        return const Text('Sample Text');
      default:
        return const ListTile();
    }
  }

  @override
  WidgetType toWidgetType(Widget widget) {
    if (widget is CheckboxListTile) {
      return WidgetType.checkboxListTile;
    } else if (widget is SwitchListTile) {
      return WidgetType.switchListTile;
    } else if (widget is Text) {
      return WidgetType.text;
    } else {
      return WidgetType.unknown;
    }
  }

  @override
  List<Widget> generateWidgetList(List<WidgetDto> widgetDataList) {
    List<Widget> widgets = [];

    for (int i = 0; i < widgetDataList.length; i++) {
      WidgetDto widget = widgetDataList[i];

      WidgetType widgetType = EnumMapper.stringToEnum(widget.widgetType);

      if (widgetType == WidgetType.checkboxListTile) {
        CheckboxDto widgetProperties = widget.properties as CheckboxDto;
        widgets.add(CheckboxListTile(
          value: widgetProperties.value,
          controlAffinity: ListTileControlAffinity.leading,
          activeColor: AppUtils.hexToColor(widgetProperties.activeColor),
          checkColor: Colors.white,
          title: Text(widgetProperties.title),
          onChanged: (value) {},
        ));
      }
      if (widgetType == WidgetType.switchListTile) {
        SwitchDto widgetProperties = widget.properties as SwitchDto;
        widgets.add(SwitchListTile(
          value: widgetProperties.value,
          controlAffinity: ListTileControlAffinity.leading,
          activeColor: AppUtils.hexToColor(widgetProperties.activeColor),
          title: Text(widgetProperties.title),
          onChanged: (value) {},
        ));
      }
      if (widgetType == WidgetType.text) {
        TextDto widgetProperties = widget.properties as TextDto;
        widgets.add(Text(
          widgetProperties.title,
          style: TextStyle(
            color: AppUtils.hexToColor(widgetProperties.textColor),
          ),
        ));
      }
    }
    return widgets;
  }
}
