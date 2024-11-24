import 'package:app_demo/application/home/home_bloc.dart';
import 'package:app_demo/presentation/home/widgets/widget_editor_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WidgetPropertiesView extends StatelessWidget {
  const WidgetPropertiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final widgetList = state.widgetList;
        final widgetDataList = state.widgetDataList;
        final selectedIndex = state.selectedIndex;

        return widgetList.isNotEmpty && selectedIndex != -1
            ? WidgetEditorView(
                selectedWidget: widgetList[selectedIndex],
                selectedWidgetDto: widgetDataList[selectedIndex],
              )
            : const SizedBox();
      },
    );
  }
}
