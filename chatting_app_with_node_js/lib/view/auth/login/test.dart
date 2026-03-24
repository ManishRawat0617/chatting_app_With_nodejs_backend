// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'login_bloc.dart';
// import 'login_event.dart';
// import 'login_state.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => LoginBloc(),
//       child: Scaffold(
//         appBar: AppBar(title: const Text("Login")),
//         body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: BlocConsumer<LoginBloc, LoginState>(
//             listener: (context, state) {
//               if (state.isSuccess) {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(content: Text("Login Successful!")),
//                 );
//               } else if (state.isFailure) {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text(state.errorMessage)),
//                 );
//               }
//             },
//             builder: (context, state) {
//               return Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   TextField(
//                     controller: _emailController,
//                     decoration: const InputDecoration(
//                       labelText: "Email",
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   TextField(
//                     controller: _passwordController,
//                     obscureText: true,
//                     decoration: const InputDecoration(
//                       labelText: "Password",
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   state.isSubmitting
//                       ? const CircularProgressIndicator()
//                       : ElevatedButton(
//                           onPressed: () {
//                             final email = _emailController.text.trim();
//                             final password = _passwordController.text.trim();
//                             context.read<LoginBloc>().add(LoginSubmitted(email, password));
//                           },
//                           child: const Text("Login"),
//                         ),
//                 ],
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
