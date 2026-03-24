import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chatting_app_with_node_js/Utilis/enums.dart';
import 'package:chatting_app_with_node_js/bloc/signup/signup_event.dart';
import 'package:chatting_app_with_node_js/bloc/signup/signup_states.dart';
import 'package:chatting_app_with_node_js/config/URL/api_url.dart';
import 'package:chatting_app_with_node_js/data/network/network_service_api.dart';
import 'package:flutter/foundation.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(const SignupState()) {
    on<SignupSubmitted>(_onSignupSubmit);
  }

  Future<void> _onSignupSubmit(
      SignupSubmitted event, Emitter<SignupState> emit) async {
    emit(state.copyWith(postApiStatus: PostApiStatus.loading));

    try {
      Map<String, String> data = {
        "email": event.email,
        "name": event.name,
        "phone": event.phone,
        "password": event.password
      };

      if (kDebugMode) {
        print("Sending signup request with data: $data");
      }
      // Simulate an API call (replace this with actual API logic)
      // await Future.delayed(const Duration(seconds: 2));
      var response =
          await NetworkServiceApi().postData(ApiUrl.userRegister, data);

      // // Assuming a successful signup (mock response)
      // bool signupSuccess = event.email.isNotEmpty && event.password.isNotEmpty;

      if (response.data["status"] == 200) {
        emit(state.copyWith(
          email: event.email,
          name: event.name,
          phone: event.phone,
          password: event.password,
          postApiStatus: PostApiStatus.success,
          message: "Signup Successful 🎉",
        ));
      } else {
        emit(state.copyWith(
          postApiStatus: PostApiStatus.error,
          message: "Invalid signup details. Please try again.",
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        postApiStatus: PostApiStatus.error,
        message: "An error occurred: $e",
      ));
    }
  }
}
