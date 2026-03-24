import 'package:bloc/bloc.dart';
import 'package:chatting_app_with_node_js/bloc/login/login_events.dart';
import 'package:chatting_app_with_node_js/bloc/login/login_states.dart';
import 'package:chatting_app_with_node_js/Utilis/enums.dart';
import 'package:chatting_app_with_node_js/config/URL/api_url.dart';
import 'package:chatting_app_with_node_js/data/local_storage/boxes.dart';
import 'package:chatting_app_with_node_js/data/network/network_service_api.dart';
import 'package:chatting_app_with_node_js/model/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates> {
  LoginBloc() : super(const LoginStates()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginAPI>(_onLoginApi);
  }

  void _onEmailChanged(EmailChanged event, Emitter<LoginStates> emit) {
    if (kDebugMode) {
      print("Email changed: \${event.email}");
    }
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginStates> emit) {
    if (kDebugMode) {
      print("Password changed: \${event.password}");
    }
    emit(state.copyWith(password: event.password));
  }

  Future<void> _onLoginApi(LoginAPI event, Emitter<LoginStates> emit) async {
    emit(state.copyWith(postApiStatus: PostApiStatus.loading));

    try {
      Map<String, String> data = {
        "email": state.email,
        "password": state.password,
      };

      if (kDebugMode) {
        print("Sending login request with data: \$data");
      }

      var response = await NetworkServiceApi().postData(ApiUrl.userLogin, data);

      if (kDebugMode) {
        print("Response received: \$response");
      }

      if (response.data["status"] == 200) {
        final userBox = await Hive.openBox<UserModel>('userData');
        final user = UserModel(
          email: response.data["data"]["email"],
          name: response.data["data"]["name"],
          phone: response.data["data"]["phone"],
          user_id: response.data["data"]["user_id"],
        );

        await userBox.put("currentUser", user);

        emit(state.copyWith(
          postApiStatus: PostApiStatus.success,
          message: "Login Successful 🎉",
        ));
      } else {
        emit(state.copyWith(
          postApiStatus: PostApiStatus.error,
          message: "Invalid login details. Please try again.",
        ));
      }
    } catch (e) {
      if (kDebugMode) {
        print("Login error: $e");
      }
      emit(state.copyWith(
        postApiStatus: PostApiStatus.error,
        message: "An error occurred: $e",
      ));
    }
  }
}
