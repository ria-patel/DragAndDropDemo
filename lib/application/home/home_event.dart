part of 'home_bloc.dart';

abstract class HomeEvent {}

class CreateSetting extends HomeEvent {
  final SettingsDto settingsDto;

  CreateSetting({required this.settingsDto});
}

class RetrieveSetting extends HomeEvent {
  RetrieveSetting();
}

class OnItemDragged extends HomeEvent {
  final bool isItemBeingDragged;

  OnItemDragged({required this.isItemBeingDragged});
}

class AddWidgetData extends HomeEvent {
  final Widget widget;

  AddWidgetData({required this.widget});
}

class OnIndexChanged extends HomeEvent {
  final int selectedIndex;

  OnIndexChanged({required this.selectedIndex});
}

class AddTitle extends HomeEvent {
  final String title;

  AddTitle({required this.title});
}

class AddActiveColor extends HomeEvent {
  final String activeColor;

  AddActiveColor({required this.activeColor});
}

class AddValue extends HomeEvent {
  final bool value;

  AddValue({required this.value});
}

class UpdateWidget extends HomeEvent {
  final WidgetDto widgetDto;

  UpdateWidget({required this.widgetDto});
}
