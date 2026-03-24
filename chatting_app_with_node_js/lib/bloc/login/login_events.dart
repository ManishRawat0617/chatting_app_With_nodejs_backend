import 'package:equatable/equatable.dart';

/// Base class for all login-related events.
abstract class LoginEvents extends Equatable {
  const LoginEvents();

  @override
  List<Object> get props => [];
}

/// Event triggered when the user updates their email.
class EmailChanged extends LoginEvents {
  final String email;

  const EmailChanged({required this.email});

  @override
  List<Object> get props => [email];
}

/// Event triggered when the user updates their password.
class PasswordChanged extends LoginEvents {
  final String password;

  const PasswordChanged({required this.password});

  @override
  List<Object> get props => [password];
}

/// Event triggered when the user submits the login request.
class LoginAPI extends LoginEvents {
  const LoginAPI(); // Ensuring a proper const constructor
}
