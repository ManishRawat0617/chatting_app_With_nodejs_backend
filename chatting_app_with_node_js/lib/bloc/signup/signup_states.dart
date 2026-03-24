import 'package:chatting_app_with_node_js/Utilis/enums.dart';
import 'package:equatable/equatable.dart';

class SignupState extends Equatable {
  final String email;
  final String password;
  final String name;
  final String phone;
  final String message;
  final PostApiStatus postApiStatus;

  const SignupState({
    this.email = "",
    this.name = "",
    this.phone = "",
    this.password = "",
    this.message = "",
    this.postApiStatus = PostApiStatus.initial,
  });

  SignupState copyWith({
    String? email,
    String? password,
    String? name,
    String? phone,
    String? message,
    PostApiStatus? postApiStatus,
  }) {
    return SignupState(
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      message: message ?? this.message,
      postApiStatus: postApiStatus ?? this.postApiStatus,
    );
  }

  @override
  List<Object> get props => [
        email,
        password,
        name,
        phone,
        message,
        postApiStatus,
      ];
}
