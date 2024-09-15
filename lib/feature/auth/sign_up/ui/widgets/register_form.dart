import 'package:dooc_app/core/helpers/exetention.dart';
import 'package:dooc_app/core/widget/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/themeing/styles.dart';
import '../../../../../core/widget/app_button.dart';
import '../../../../../core/widget/app_text_form_field.dart';
import '../../../../../core/widget/password_validation.dart';
import '../../logic/register_cubit.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool isObscureText = true;
  bool isObscureTextConf = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          toast(text: state.model.message!, color: Colors.green);
          context.pushNamedAndRemoveUntil(Routes.homeScreen,
              predicate: (route) => true);
        }else if (state is RegisterError) {
          toast(text: state.errorMessage, color: Colors.red);

        }
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Column(
            children: [
              verticalSpacing(20),
              AppTextFormField(
                controller: nameController,
                hintText: "Name",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid name';
                  }
                },
              ),
              verticalSpacing(10),
              AppTextFormField(
                controller: emailController,
                hintText: "Email",
                textInputType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid email';
                  }
                },
              ),
              verticalSpacing(10),
              AppTextFormField(
                controller: phoneController,
                textInputType: TextInputType.phone,
                hintText: "Phone Number",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid phone';
                  }
                },
              ),
              verticalSpacing(10),
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
              verticalSpacing(10),
              AppTextFormField(
                controller: passwordConfirmationController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter a valid password';
                  }
                },
                hintText: "Password Confirmation",
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      isObscureTextConf = !isObscureTextConf;
                    });
                  },
                  child: Icon(
                    isObscureTextConf ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
                isSecureText: isObscureText,
              ),
              verticalSpacing(10),
              PasswordValidation(
                passwordController: passwordController,
              ),
              verticalSpacing(20),
              state is RegisterLoading
                  ? const CircularProgressIndicator()
                  : AppTextButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<RegisterCubit>().userRegister(
                            emailController.text,   // email
                            passwordController.text, // password
                            nameController.text,     // name
                            phoneController.text,    // phone
                            passwordConfirmationController.text, // password confirmation
                          );

                        }
                      },
                      buttonText: 'Sign up',
                      buttonTextStyle: TextStyles.font16WhiteW600),
            ],
          ),
        );
      },
    );
  }
}
