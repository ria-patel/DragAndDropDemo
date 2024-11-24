// Flutter imports:
import 'package:app_demo/application/home/home_bloc.dart';
import 'package:app_demo/presentation/core/widgets/app_loader.dart';
import 'package:app_demo/presentation/core/widgets/custom_toast.dart';
import 'package:app_demo/presentation/home/widgets/middle_frame_view.dart';
import 'package:app_demo/presentation/home/widgets/widget_list_view.dart';
import 'package:app_demo/presentation/home/widgets/widget_properties_view.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:app_demo/domain/core/constants/string.constants.dart';
import 'package:app_demo/infrastructure/core/di.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeBloc..add(RetrieveSetting()),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state.responseMessage.isNotEmpty) {
            CustomToast.showToast(message: state.responseMessage);
          }
        },
        listenWhen: (previous, current) =>
            previous.responseMessage != current.responseMessage,
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: const Text(StringConstants.appName)),
            body: AppLoaderOverlay(
              isLoading: state.isLoading,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Overlay(
                  initialEntries: [
                    OverlayEntry(
                      builder: (context) => const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: WidgetListView()),
                          VerticalDivider(),
                          Expanded(child: MiddleFrameView()),
                          VerticalDivider(),
                          Expanded(child: WidgetPropertiesView()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
