import 'package:app_demo/application/home/home_bloc.dart';
import 'package:app_demo/domain/core/utils/app_utils.dart';
import 'package:app_demo/infrastructure/core/di.dart';
import 'package:app_demo/infrastructure/settings/dtos/checkbox/checkbox.dto.dart';
import 'package:app_demo/infrastructure/settings/dtos/switch/switch.dto.dart';
import 'package:app_demo/infrastructure/settings/dtos/text/text.dto.dart';
import 'package:app_demo/infrastructure/settings/dtos/widget/widget.dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MiddleFrameView extends StatelessWidget {
  const MiddleFrameView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final widgetList = state.widgetList;
        final widgetDataList = state.widgetDataList;

        return Container(
          height: 850,
          width: 300,
          padding: const EdgeInsets.only(top: 18),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: state.isItemBeingDragged
                  ? Colors.deepPurple
                  : Colors.grey, // Blue when dragging
              width: 6,
            ),
          ),
          child: DragTarget<Widget>(
            // ignore: deprecated_member_use
            onAccept: (data) {
              homeBloc.add(OnItemDragged(isItemBeingDragged: false));

              homeBloc.add(AddWidgetData(widget: data));
            },
            // ignore: deprecated_member_use
            onWillAccept: (data) {
              // Highlight the target
              homeBloc.add(OnItemDragged(isItemBeingDragged: true));
              return true; // Allow drop
            },
            onLeave: (data) {
              // Remove highlight when leaving
              homeBloc.add(OnItemDragged(isItemBeingDragged: false));
            },
            builder: (context, candidateData, rejectedData) {
              return AnimatedList(
                key: state.listKey,
                initialItemCount: widgetList.length,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index, animation) {
                  return _buildAnimatedItem(
                    index: index,
                    animation: animation,
                    widgetList: widgetList,
                    widgetDataList: widgetDataList,
                  );
                },
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildAnimatedItem({
    required int index,
    required Animation<double> animation,
    required List<Widget> widgetList,
    required List<WidgetDto> widgetDataList,
  }) {
    Widget item = widgetList[index];
    Widget widget = Container();
    WidgetDto widgetDto = widgetDataList[index];

    switch (item) {
      case Text _:
        final widgetData = widgetDto.properties as TextDto;

        widget = Text(
          widgetData.title,
          style: TextStyle(
            fontSize: 18,
            color: AppUtils.hexToColor(widgetData.textColor),
          ),
        );
        break;
      case CheckboxListTile _:
        final widgetData = widgetDto.properties as CheckboxDto;

        widget = AbsorbPointer(
          child: CheckboxListTile(
            value: widgetData.value,
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: AppUtils.hexToColor(widgetData.activeColor),
            checkColor: Colors.white,
            title: Text(widgetData.title),
            onChanged: (value) {},
          ),
        );
        break;
      case SwitchListTile _:
        final widgetData = widgetDto.properties as SwitchDto;

        widget = AbsorbPointer(
          child: SwitchListTile(
            value: widgetData.value,
            controlAffinity: ListTileControlAffinity.leading,
            title: Text(widgetData.title),
            activeColor: AppUtils.hexToColor(widgetData.activeColor),
            onChanged: (value) {},
          ),
        );
        break;
    }

    return SizeTransition(
      sizeFactor: animation,
      axis: Axis.vertical,
      child: GestureDetector(
        child: widget,
        onTap: () {
          homeBloc.add(OnIndexChanged(selectedIndex: index));
        },
      ),
    );
  }
}
