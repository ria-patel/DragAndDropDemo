part of 'login_bloc.dart';

@CopyWith()
class LoginState extends Equatable {
  final bool isLoading;
  final bool isFailed;
  final bool isSuccessful;
  final bool showPassword;
  final String email;
  final String password;
  final String responseMessage;

  const LoginState({
    required this.isLoading,
    required this.isFailed,
    required this.isSuccessful,
    required this.showPassword,
    required this.email,
    required this.password,
    required this.responseMessage,
  });

  factory LoginState.initial() {
    return const LoginState(
      isLoading: false,
      isFailed: false,
      isSuccessful: false,
      showPassword: false,
      email: '',
      password: '',
      responseMessage: '',
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        isFailed,
        isSuccessful,
        showPassword,
        email,
        password,
        responseMessage,
      ];
}

