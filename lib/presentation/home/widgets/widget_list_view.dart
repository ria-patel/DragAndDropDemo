import 'package:app_demo/application/home/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WidgetListView extends StatelessWidget {
  const WidgetListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final widgetTypeList = state.widgetTypeList;

        return ListView.builder(
          itemCount: widgetTypeList.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return MouseRegion(
              cursor: SystemMouseCursors.grab,
              child: Draggable<Widget>(
                data: state.widgetMapper.toWidget(widgetTypeList[index]),
                feedback: Material(
                  child: SizedBox(
                    width: 300,
                    child: ListTile(
                      title: Text(widgetTypeList[index].value),
                      tileColor: Colors.deepPurple.shade50,
                    ),
                  ),
                ),
                child: ListTile(
                  title: Text(widgetTypeList[index].value),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
