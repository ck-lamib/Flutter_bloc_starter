import 'package:clean_folder_str/screens/authentication/bloc/authentication_bloc.dart';
import 'package:clean_folder_str/screens/dashboard/views/dashboard_screen.dart';
import 'package:clean_folder_str/screens/login/bloc/login_bloc.dart';
import 'package:clean_folder_str/screens/login/domain/usecase/login_usecase.dart';
import 'package:clean_folder_str/utils/constants/size_config.dart';
import 'package:clean_folder_str/utils/helpers/snackbar.dart';
import 'package:clean_folder_str/utils/helpers/validators.dart';
import 'package:clean_folder_str/utils/theme/colors.dart';
import 'package:clean_folder_str/widgets/custom/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "/login-screen";
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(
        loginUseCase: RepositoryProvider.of<LoginUseCase>(context),
      ),
      child: LoginView(),
    );
  }
}

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 24,
              horizontal: 24,
            ),
            child: Form(
              key: formKey,
              child: AutofillGroup(
                onDisposeAction: AutofillContextAction.commit,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome back",
                      style: theme.textTheme.titleLarge?.copyWith(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        "Enter your email and password to login.",
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: MyAppColors.secondaryTextcolor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    CustomTextField(
                      controller: emailController,
                      hint: "bimal@gmail.com",
                      labelText: "Your email",
                      autofillHints: const [
                        AutofillHints.email,
                      ],
                      textInputAction: TextInputAction.next,
                      prefixIcon: const Icon(
                        Icons.person_4_rounded,
                      ),
                      textCapitalization: TextCapitalization.none,
                      validator: Validators.checkEmailField,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                        return CustomTextField(
                          controller: passwordController,
                          hint: "**********",
                          labelText: "Your password",
                          suffixIcon: GestureDetector(
                            onTap: () {
                              BlocProvider.of<LoginBloc>(context)
                                  .add(TogglePasswordVisibility());
                            },
                            child: state is LoginPasswordVisibilityChanged &&
                                    state.isPasswordVisible
                                ? const Icon(
                                    Icons.visibility,
                                  )
                                : const Icon(
                                    Icons.visibility_off,
                                  ),
                          ),
                          autofillHints: const [
                            AutofillHints.password,
                          ],
                          obscureText:
                              !(state is LoginPasswordVisibilityChanged &&
                                  state.isPasswordVisible),
                          textInputAction: TextInputAction.done,
                          prefixIcon: const Icon(
                            Icons.password_rounded,
                          ),
                          validator: Validators.checkPasswordField,
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {},
                          child: const Text("Forget password?")),
                    ),
                    const SizedBox(height: 20),
                    BlocConsumer<LoginBloc, LoginState>(
                      builder: (context, state) {
                        if (state is LoginLoading) {
                          return ElevatedButton(
                            onPressed: null,
                            style: theme.elevatedButtonTheme.style?.copyWith(
                              minimumSize: MaterialStateProperty.resolveWith(
                                (states) => const Size.fromHeight(50),
                              ),
                              maximumSize: MaterialStateProperty.resolveWith(
                                (states) => const Size.fromHeight(50),
                              ),
                            ),
                            child: const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                              ),
                            ),
                          );
                        } else {
                          return ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                context.read<LoginBloc>().add(
                                      LoginSubmitted(
                                        userName: emailController.text,
                                        password: passwordController.text,
                                      ),
                                    );
                              }
                            },
                            style: theme.elevatedButtonTheme.style?.copyWith(
                              minimumSize: MaterialStateProperty.resolveWith(
                                (states) => const Size.fromHeight(50),
                              ),
                            ),
                            child: const Text(
                              "Login",
                            ),
                          );
                        }
                      },
                      listener: (context, state) {
                        if (state is LoginFailure) {
                          CustomSnackBar.error(
                            context: context,
                            title: "Login",
                            message: state.error,
                          );
                        } else if (state is LoginSuccess) {
                          BlocProvider.of<AuthenticationBloc>(context)
                              .add(const AuthenticationStatusChanged());

                          Navigator.of(context).pushNamedAndRemoveUntil(
                              DashboardScreen.routeName, (route) => false);

                          CustomSnackBar.success(
                            context: context,
                            title: "Login",
                            message: "Successfully logged into the system.",
                          );
                          TextInput.finishAutofillContext();
                        }
                      },
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
