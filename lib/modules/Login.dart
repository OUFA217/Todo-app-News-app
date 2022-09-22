// ignore_for_file: prefer_const_constructors, unused_local_variable, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:projeectname/layout/Diet_app/cubit/cubit.dart';
import 'package:projeectname/layout/Diet_app/cubit/states.dart';
import 'package:projeectname/shared/components/components.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login> {
  var email = TextEditingController();

  var Password = TextEditingController();
  var formkey = GlobalKey<FormState>();

  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Dietcubit, DietStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = Dietcubit.get(context);
          return Scaffold(
            body: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 15, right: 15, top: 5),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [Colors.black, Color.fromARGB(255, 0, 108, 197)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
                  // image: DecorationImage(
                  // image: AssetImage(
                  //     'assets/Images/WhatsApp Image 2022-09-14 at 10.09.09 PM.jpeg'),
                  // fit: BoxFit.fill),

                  ),
              child: Form(
                key: formkey,
                child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        child: defultformfield(
                          Texcolor: TextStyle(color: Colors.black),
                          bord: BorderSide(color: Colors.deepOrange),
                          labelst: TextStyle(
                              color: myFocusNode.hasFocus
                                  ? Color.fromARGB(255, 4, 169, 245)
                                  : Colors.white),
                          validator: (value) =>
                              value!.isEmpty ? 'Email is required' : null,
                          controller: email,
                          type: TextInputType.emailAddress,
                          label: 'Email',
                          prefix: Icons.email,
                          onsubmit: (value) {
                            print(value);
                          },
                          changed: (value) {
                            print(value);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      defultformfield(
                        Texcolor: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.w800),
                        controller: Password,
                        type: TextInputType.visiblePassword,
                        labelst: TextStyle(
                            color: myFocusNode.hasFocus
                                ? Color.fromARGB(255, 4, 169, 245)
                                : Colors.white),
                        onsubmit: (value) {
                          print(value);
                        },
                        changed: (value) {
                          print(value);
                        },
                        label: 'Password',
                        suffix: isPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
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
                        height: 10.0,
                      ),
                      defultbutton(
                        function: () {
                          final form = formkey.currentState;
                          if (form != null && !form.validate()) {
                            Dietcubit.get(context).userlogin(
                              email: email.text,
                              password: Password.text,
                            );
                          }
                        },
                        text: 'Sign In',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
