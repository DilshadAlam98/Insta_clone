import 'package:flutter/material.dart';
import 'package:own_projeccts/bloc/auth_bloc.dart';
import 'package:own_projeccts/widget/insta_button.dart';
import 'package:own_projeccts/widget/insta_input_field.dart';

import 'signup_screen.dart';

class RegisterUserScreen extends StatefulWidget {
  const RegisterUserScreen({Key? key}) : super(key: key);

  @override
  State<RegisterUserScreen> createState() => _RegisterUserScreenState();
}

class _RegisterUserScreenState extends State<RegisterUserScreen> {
  final authBloc = AuthBloc();
  String _email = '';
  String _password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/Instagram Logo.png",
              width: 182,
              height: 50,
            ),
            const SizedBox(
              height: 39,
            ),
            InstaInputField(
              onChanged: (value) {
                _email = value;
              },
              hintText: "email",
            ),
            const SizedBox(
              height: 12,
            ),
            InstaInputField(
              onChanged: (value) {
                _password = value;
              },
              hintText: "Password",
            ),
            const SizedBox(
              height: 12,
            ),
            StreamBuilder<bool>(
                stream: authBloc.isLoading,
                builder: (context, snapshot) {
                  if (snapshot.data == true) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return InstaButton(
                      onPressed: () async {
                        final isSignedUp = await authBloc.signUpUser(
                            email: _email, password: _password);
                        if (isSignedUp) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignupScreen(isFromLogin: false),
                              ));
                        }
                      },
                      child: const Text(
                        "Sign UP",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18),
                      ));
                }),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    authBloc.dispose();
    super.dispose();
  }
}
