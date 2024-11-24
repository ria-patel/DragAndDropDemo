// Flutter imports:
import 'package:app_demo/infrastructure/core/di.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:app_demo/application/auth/login/login_bloc.dart';
import 'package:app_demo/domain/core/constants/string.constants.dart';
import 'package:app_demo/domain/core/services/navigation/app_router.gr.dart';
import 'package:app_demo/presentation/auth/widgets/label_view.dart';
import 'package:app_demo/presentation/core/widgets/custom_text_field.dart';
import 'package:app_demo/presentation/core/widgets/custom_toast.dart';
import 'package:app_demo/presentation/core/widgets/primary_button.dart';

class LoginView extends StatelessWidget {
  final bool isFromMobile;
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  const LoginView({
    super.key,
    this.isFromMobile = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (logContext, state) {
        if(state.responseMessage.isNotEmpty){
        if (state.isFailed) {
          CustomToast.showToast(
            message: state.responseMessage,
            isFromMobile: isFromMobile,
          );
        }
        if (state.isSuccessful) {
          CustomToast.showToast(
            message: state.responseMessage,
            isFromMobile: isFromMobile,
          );
          context.router.replaceAll([const HomeRoute()]);
        }
      }
      },
      listenWhen: (previous, current) =>
          previous.isFailed != current.isFailed ||
          previous.isSuccessful != current.isSuccessful,
      builder: (context, state) {
        return Container(
          width: 500,
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey),
          ),
          child: AutofillGroup(
            child: Form(
              key: _formKey,
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                children: [
                  const LabelView(text: StringConstants.email),
                  CustomTextField(
                    keyboardType: TextInputType.emailAddress,
                    hintText: StringConstants.enterEmail,
                    textInputAction: TextInputAction.next,
                    autoFillHints: kIsWeb ? const [AutofillHints.username] : [],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return StringConstants.required;
                      } else if (!EmailValidator.validate(value.trim())) {
                        return StringConstants.invalidEmail;
                      }
                      return null;
                    },
                    onChanged: (value) {
                      loginBloc.add(AddEmail(email: value));
                    },
                  ),
                  const SizedBox(height: 16),
                  const LabelView(text: StringConstants.password),
                  CustomTextField(
                    obscureText: !state.showPassword,
                    hintText: StringConstants.enterPassword,
                    textInputAction: TextInputAction.done,
                    autoFillHints: kIsWeb ? const [AutofillHints.password] : [],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return StringConstants.required;
                      }
                      return null;
                    },
                    onChanged: (value) {
                      loginBloc
                          .add(AddPassword(password: value));
                    },
                    suffixIcon: IconButton(
                      icon: Icon(
                        state.showPassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        size: 22,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        loginBloc.add(ChangePasswordVisibility());
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  PrimaryButton(
                    title: StringConstants.login,
                    width: double.maxFinite,
                    onPressed: () {
                      TextInput.finishAutofillContext();
                      FocusScope.of(context).unfocus();
                      if (_formKey.currentState!.validate()) {
                        loginBloc.add(OnPressLogin());
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
