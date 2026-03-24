import 'package:chatting_app_with_node_js/Utilis/enums.dart';
import 'package:chatting_app_with_node_js/bloc/signup/signup_bloc.dart';
import 'package:chatting_app_with_node_js/bloc/signup/signup_event.dart';
import 'package:chatting_app_with_node_js/bloc/signup/signup_states.dart';
import 'package:chatting_app_with_node_js/config/routes/routes.dart';
import 'package:chatting_app_with_node_js/view/Utilis/widget/inputField.dart';
import 'package:chatting_app_with_node_js/view/Utilis/widget/submitButton.dart';
import 'package:chatting_app_with_node_js/view/Utilis/widget/textWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late SignupBloc _signupBloc;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _signupBloc = SignupBloc();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final double spaceBetween = screenHeight * 0.02;

    return BlocProvider(
      create: (context) => SignupBloc(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Sign Up")),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: BlocConsumer<SignupBloc, SignupState>(
                listener: (context, state) {
                  if (state.postApiStatus == PostApiStatus.success) {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        RoutesName.loginScreen, (route) => false);
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
                      SizedBox(height: screenHeight * 0.05),
                      const TextWidget(
                        title: "Your email address",
                        fontSize: 20,
                        boldness: FontWeight.bold,
                      ),
                      InputField(
                        hintText: "abc@email.com",
                        title: "Enter your email",
                        controller: _emailController,
                      ),
                      SizedBox(height: spaceBetween),
                      const TextWidget(
                        title: "Your name",
                        fontSize: 20,
                        boldness: FontWeight.bold,
                      ),
                      InputField(
                        hintText: "John Doe",
                        title: "Enter your name",
                        controller: _nameController,
                      ),
                      SizedBox(height: spaceBetween),
                      const TextWidget(
                        title: "Your password",
                        fontSize: 20,
                        boldness: FontWeight.bold,
                      ),
                      InputField(
                        obscureTextBool: true,
                        hintText: "••••••••",
                        title: "Enter your password",
                        controller: _passwordController,
                      ),
                      SizedBox(height: spaceBetween),
                      const TextWidget(
                        title: "Your phone number",
                        fontSize: 20,
                        boldness: FontWeight.bold,
                      ),
                      InputField(
                        hintText: "+1234567890",
                        title: "Enter your phone number",
                        controller: _phoneController,
                      ),
                      SizedBox(height: screenHeight * 0.05),
                      SubmitButton(
                        title: state.postApiStatus == PostApiStatus.loading
                            ? "Loading..."
                            : "Submit",
                        ontap: state.postApiStatus == PostApiStatus.loading
                            ? null
                            : () {
                                context.read<SignupBloc>().add(SignupSubmitted(
                                      _emailController.text,
                                      _nameController.text,
                                      _passwordController.text,
                                      _phoneController.text,
                                    ));
                              },
                      ),
                      SizedBox(height: spaceBetween),
                      Center(
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(RoutesName.loginScreen);
                          },
                          child: const TextWidget(
                            title: "Already have an account? Login",
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
