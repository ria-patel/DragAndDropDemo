// Package imports:
// ignore_for_file: depend_on_referenced_packages

// Package imports:
import 'package:app_demo/domain/core/constants/hive.constants.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:app_demo/domain/auth/auth.repository.dart';

part 'login_bloc.g.dart';
part 'login_event.dart';
part 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository _authRepository;

  LoginBloc(this._authRepository) : super(LoginState.initial()) {
    on<OnPressLogin>((event, emit) async {
      emit(
        state.copyWith(
          isLoading: true,
          isFailed: false,
          isSuccessful: false,
          responseMessage: '',
        ),
      );

      final result = await _authRepository.loginUser(
        email: state.email.trim(),
        password: state.password.trim(),
      );
      result.fold(
          (l) => emit(
                state.copyWith(
                  responseMessage: l,
                  isFailed: true,
                  isLoading: false,
                ),
              ), (r) {
        var box = Hive.box(HiveConstants.hiveBox);
        box.put(HiveConstants.userId, r.userId);

        emit(
          state.copyWith(
            responseMessage: 'Welcome back, ${r.name}',
            isSuccessful: true,
            isLoading: false,
          ),
        );
      });
    });
    on<AddEmail>((event, emit) {
      emit(state.copyWith(email: event.email));
    });
    on<AddPassword>((event, emit) {
      emit(state.copyWith(password: event.password));
    });
    on<ChangePasswordVisibility>((event, emit) {
      emit(state.copyWith(showPassword: !state.showPassword));
    });
  }
}
