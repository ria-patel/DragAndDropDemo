// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LoginStateCWProxy {
  LoginState isLoading(bool isLoading);

  LoginState isFailed(bool isFailed);

  LoginState isSuccessful(bool isSuccessful);

  LoginState showPassword(bool showPassword);

  LoginState email(String email);

  LoginState password(String password);

  LoginState responseMessage(String responseMessage);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LoginState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LoginState(...).copyWith(id: 12, name: "My name")
  /// ````
  LoginState call({
    bool? isLoading,
    bool? isFailed,
    bool? isSuccessful,
    bool? showPassword,
    String? email,
    String? password,
    String? responseMessage,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLoginState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLoginState.copyWith.fieldName(...)`
class _$LoginStateCWProxyImpl implements _$LoginStateCWProxy {
  const _$LoginStateCWProxyImpl(this._value);

  final LoginState _value;

  @override
  LoginState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  LoginState isFailed(bool isFailed) => this(isFailed: isFailed);

  @override
  LoginState isSuccessful(bool isSuccessful) =>
      this(isSuccessful: isSuccessful);

  @override
  LoginState showPassword(bool showPassword) =>
      this(showPassword: showPassword);

  @override
  LoginState email(String email) => this(email: email);

  @override
  LoginState password(String password) => this(password: password);

  @override
  LoginState responseMessage(String responseMessage) =>
      this(responseMessage: responseMessage);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LoginState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LoginState(...).copyWith(id: 12, name: "My name")
  /// ````
  LoginState call({
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? isFailed = const $CopyWithPlaceholder(),
    Object? isSuccessful = const $CopyWithPlaceholder(),
    Object? showPassword = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
    Object? responseMessage = const $CopyWithPlaceholder(),
  }) {
    return LoginState(
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
      isFailed: isFailed == const $CopyWithPlaceholder() || isFailed == null
          ? _value.isFailed
          // ignore: cast_nullable_to_non_nullable
          : isFailed as bool,
      isSuccessful:
          isSuccessful == const $CopyWithPlaceholder() || isSuccessful == null
              ? _value.isSuccessful
              // ignore: cast_nullable_to_non_nullable
              : isSuccessful as bool,
      showPassword:
          showPassword == const $CopyWithPlaceholder() || showPassword == null
              ? _value.showPassword
              // ignore: cast_nullable_to_non_nullable
              : showPassword as bool,
      email: email == const $CopyWithPlaceholder() || email == null
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String,
      password: password == const $CopyWithPlaceholder() || password == null
          ? _value.password
          // ignore: cast_nullable_to_non_nullable
          : password as String,
      responseMessage: responseMessage == const $CopyWithPlaceholder() ||
              responseMessage == null
          ? _value.responseMessage
          // ignore: cast_nullable_to_non_nullable
          : responseMessage as String,
    );
  }
}

extension $LoginStateCopyWith on LoginState {
  /// Returns a callable class that can be used as follows: `instanceOfLoginState.copyWith(...)` or like so:`instanceOfLoginState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LoginStateCWProxy get copyWith => _$LoginStateCWProxyImpl(this);
}
