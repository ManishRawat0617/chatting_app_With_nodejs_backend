import 'package:equatable/equatable.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}

class SignupSubmitted extends SignupEvent {
  final String email;
  final String password;
  final String name;
  final String phone;

  const SignupSubmitted(this.email, this.password, this.name, this.phone);

  @override
  List<Object> get props => [email, password, name, phone];
}
