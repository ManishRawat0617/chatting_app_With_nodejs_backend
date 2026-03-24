import 'package:chatting_app_with_node_js/bloc/login/login_bloc.dart';
import 'package:chatting_app_with_node_js/bloc/login/login_events.dart';
import 'package:chatting_app_with_node_js/bloc/login/login_states.dart';
import 'package:chatting_app_with_node_js/config/routes/routes.dart';
import 'package:chatting_app_with_node_js/view/Utilis/widget/inputField.dart';
import 'package:chatting_app_with_node_js/view/Utilis/widget/submitButton.dart';
import 'package:chatting_app_with_node_js/view/Utilis/widget/textWidget.dart';
import 'package:chatting_app_with_node_js/Utilis/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc _loginBloc;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loginBloc = LoginBloc();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final double spaceBtwTitleAndInputBox = screenHeight * 0.005;

    return BlocProvider(
      create: (_) => _loginBloc,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: BlocConsumer<LoginBloc, LoginStates>(
                listener: (context, state) {
                  if (state.postApiStatus == PostApiStatus.success) {
                    print("Login Success");
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        RoutesName.bottomNavScreen, (route) => false);
                  } else if (state.postApiStatus == PostApiStatus.error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message)),
                    );
                  }
                },
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: TextWidget(
                          title: "Whisper",
                          fontSize: 40,
                          boldness: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.1),

                      // Email Field
                      const TextWidget(
                        title: "Your email address",
                        fontSize: 20,
                        boldness: FontWeight.bold,
                      ),
                      SizedBox(height: spaceBtwTitleAndInputBox),
                      InputField(
                        hintText: "abc@email.com",
                        title: "Enter your email",
                        controller: _emailController,
                      ),
                      SizedBox(height: screenHeight * 0.03),

                      // Password Field
                      const TextWidget(
                        title: "Your password",
                        fontSize: 20,
                        boldness: FontWeight.bold,
                      ),
                      SizedBox(height: spaceBtwTitleAndInputBox),
                      InputField(
                        obscureTextBool: true,
                        hintText: "Enter your password",
                        title: "Enter your password",
                        controller: _passwordController,
                      ),
                      SizedBox(height: screenHeight * 0.07),

                      // Submit Button
                      SubmitButton(
                        title: state.postApiStatus == PostApiStatus.loading
                            ? "Loading..."
                            : "Submit",
                        ontap: state.postApiStatus == PostApiStatus.loading
                            ? null
                            : () {
                                final email = _emailController.text.trim();
                                final password =
                                    _passwordController.text.trim();

                                context
                                    .read<LoginBloc>()
                                    .add(EmailChanged(email: email));
                                context
                                    .read<LoginBloc>()
                                    .add(PasswordChanged(password: password));
                                context.read<LoginBloc>().add(const LoginAPI());
                              },
                      ),
                      SizedBox(height: screenHeight * 0.02),

                      // Signup Navigation
                      Center(
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(RoutesName.signUpScreen);
                          },
                          child: const TextWidget(
                            title: "Don't have an account? Sign Up",
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Center(
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(RoutesName.bottomNavScreen);
                          },
                          child: const TextWidget(
                            title: "home screen",
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
