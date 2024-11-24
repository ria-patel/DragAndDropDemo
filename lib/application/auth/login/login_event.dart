part of 'login_bloc.dart';

abstract class LoginEvent {}

class OnPressLogin extends LoginEvent {
  OnPressLogin();
}

class AddPassword extends LoginEvent {
  final String password;

  AddPassword({required this.password});
}

class AddEmail extends LoginEvent {
  final String email;

  AddEmail({required this.email});
}

class ChangePasswordVisibility extends LoginEvent {
  ChangePasswordVisibility();
}
