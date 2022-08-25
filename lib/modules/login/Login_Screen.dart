// ignore_for_file: file_names, prefer_const_constructors, duplicate_ignore, non_constant_identifier_names, must_be_immutable, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_print, override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:projeectname/shared/components/components.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailcontroller = TextEditingController();

  var Passwordcontroller = TextEditingController();

  var formkey = GlobalKey<FormState>();

  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  // ignore: prefer_const_constructors

                  Text(
                    'Login ',
                    style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  defultformfield(
                    controller: emailcontroller,
                    type: TextInputType.emailAddress,
                    onsubmit: (value) {
                      print(value);
                    },
                    changed: (value) {
                      print(value);
                    },
                    label: 'Email',
                    validator: (value) =>
                        value!.isEmpty ? 'Email is required' : null,
                    prefix: Icons.email,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  defultformfield(
                    controller: Passwordcontroller,
                    type: TextInputType.visiblePassword,
                    onsubmit: (value) {
                      print(value);
                    },
                    changed: (value) {
                      print(value);
                    },
                    label: 'Password',
                    suffix:
                        isPassword ? Icons.visibility : Icons.visibility_off,
                    isPassword: isPassword,
                    suffixpressed: () {
                      setState(() {
                        isPassword = !isPassword;
                      });
                    },
                    validator: (value) =>
                        value!.isEmpty ? 'Password is required' : null,
                    prefix: Icons.lock,
                  ),

                  SizedBox(
                    height: 20.0,
                  ),

                  SizedBox(
                    height: 8.0,
                  ),
                  defultbutton(
                    function: () {
                      final form = formkey.currentState;
                      if (form != null && !form.validate()) {
                        print(emailcontroller.text);
                      }
                    },
                    text: 'Login',
                  ),
                  SizedBox(
                    height: 8.0,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text('Register now'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
