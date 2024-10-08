import 'package:dooc_app/core/helpers/exetention.dart';
import 'package:dooc_app/core/widget/toast.dart';
import 'package:dooc_app/feature/auth/login/logic/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/themeing/styles.dart';
import '../../../../../core/widget/app_button.dart';
import '../../../../../core/widget/app_text_form_field.dart';
import '../../../../../core/widget/password_validation.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscureText = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          toast(text: state.model.message!, color: Colors.green);
          context.pushNamedAndRemoveUntil(Routes.homeScreen,
              predicate: (route) => true);
        }
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Column(
            children: [
              verticalSpacing(36),
              AppTextFormField(
                controller: emailController,
                hintText: "Email",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid email';
                  }
                },
              ),
              verticalSpacing(18),
              AppTextFormField(
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter a valid password';
                  }
                },
                hintText: "Password",
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      isObscureText = !isObscureText;
                    });
                  },
                  child: Icon(
                    isObscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
                isSecureText: isObscureText,
              ),
              verticalSpacing(24),
              PasswordValidation(
                passwordController: passwordController,
              ),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Text(
                  "Forgot Password?",
                  style: TextStyles.font13BlueW400,
                ),
              ),
              verticalSpacing(40),
              state is LoginLoading
                  ? const CircularProgressIndicator()
                  : AppTextButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<LoginCubit>().userLogin(
                              emailController.text, passwordController.text);
                        }
                      },
                      buttonText: 'Login',
                      buttonTextStyle: TextStyles.font16WhiteW600),
            ],
          ),
        );
      },
    );
  }
}
