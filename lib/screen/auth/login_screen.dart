import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:own_projeccts/screen/auth/register_user_screen.dart';
import 'package:own_projeccts/screen/dashboard/home/home_screen.dart';
import 'package:own_projeccts/utils/app_colors.dart';
import 'package:own_projeccts/widget/insta_button.dart';
import 'package:own_projeccts/widget/insta_input_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
            const InstaInputField(
              hintText: "user name or Email",
            ),
            const SizedBox(
              height: 12,
            ),
            const InstaInputField(
              hintText: "Password",
            ),
            Container(
              margin: const EdgeInsets.only(top: 15, bottom: 25),
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text("Forget Password?"),
              ),
            ),
            InstaButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ));
                },
                child: const Text(
                  "Log in",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                )),
            const SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/Icon.png",
                  height: 20,
                  width: 20,
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Log in with Facebook",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ))
              ],
            ),
            dividerWithOrText(),
            RichText(
              text: TextSpan(
                // style: TextStyle(color: Colors.black, fontSize: 36),
                children: <TextSpan>[
                  const TextSpan(
                      text: 'Dont\'t have an account? ',
                      style: TextStyle(
                          color: grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w400)),
                  TextSpan(
                      text: "Sign up",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterUserScreen(),
                              ));
                        },
                      style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                          fontWeight: FontWeight.w400)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget dividerWithOrText() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Row(children: const [
        Expanded(child: Divider()),
        Text("OR"),
        Expanded(child: Divider()),
      ]),
    );
  }
}
