// ignore_for_file: unused_local_variable, prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_field

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gender_picker/gender_picker.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:projeectname/layout/Diet_app/cubit/states.dart';
import 'package:projeectname/modules/HomeDiet/Login.dart';
import 'package:projeectname/shared/components/components.dart';

import '../../layout/Diet_app/cubit/cubit.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var height = TextEditingController();
  var weight = TextEditingController();
  var email = TextEditingController();

  String? selectedGender;
  var password = TextEditingController();
  var formkey = GlobalKey<FormState>();

  bool isPassword = true;
  var name = TextEditingController();
  static String defaultDropDownValue = 'Select your Gender';

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
                  colors: [
                    Color.fromARGB(255, 0, 108, 197),
                    Colors.black,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Form(
                key: formkey,
                child: SingleChildScrollView(
                  child: Column(
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
                              value!.isEmpty ? 'Please put your name' : null,
                          controller: name,
                          type: TextInputType.name,
                          prefix: Icons.abc_outlined,
                          label: 'Name',
                          onsubmit: (value) {},
                          changed: (value) {
                            print(value);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
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
                          onsubmit: (value) {},
                          changed: (value) {
                            print(value);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        child: defultformfield(
                          validator: (value) =>
                              value!.isEmpty ? 'Password is required' : null,
                          controller: password,
                          suffix: isPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          isPassword: isPassword,
                          suffixpressed: () {
                            setState(() {
                              isPassword = !isPassword;
                            });
                          },
                          type: TextInputType.visiblePassword,
                          label: 'Password',
                          onsubmit: (value) {},
                          prefix: Icons.lock,
                          Texcolor: TextStyle(color: Colors.black),
                          bord: BorderSide(color: Colors.deepOrange),
                          labelst: TextStyle(
                              color: myFocusNode.hasFocus
                                  ? Color.fromARGB(255, 4, 169, 245)
                                  : Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        child: SelectedGender(changed: (value) {
                          setState(() {
                            dropdownValue = value;
                          });
                        }),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        child: SelectedBody(
                          changed: (value) {
                            setState(() {
                              body = value;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        child: defultformfield(
                          validator: (value) =>
                              value!.isEmpty ? 'Height is Required' : null,
                          controller: height,
                          onsubmit: (value) {},
                          type: TextInputType.number,
                          label: 'Height',
                          prefix: Icons.height_outlined,
                          Texcolor: TextStyle(color: Colors.black),
                          bord: BorderSide(color: Colors.deepOrange),
                          labelst: TextStyle(
                              color: myFocusNode.hasFocus
                                  ? Color.fromARGB(255, 4, 169, 245)
                                  : Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        child: defultformfield(
                          validator: (value) =>
                              value!.isEmpty ? 'Weight is Required' : null,
                          controller: weight,
                          onsubmit: (value) {},
                          type: TextInputType.number,
                          label: 'Weight',
                          prefix: Icons.line_weight_outlined,
                          Texcolor: TextStyle(color: Colors.black),
                          bord: BorderSide(color: Colors.deepOrange),
                          labelst: TextStyle(
                              color: myFocusNode.hasFocus
                                  ? Color.fromARGB(255, 4, 169, 245)
                                  : Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      defultbutton(
                        function: () {
                          final form = formkey.currentState;
                          if (form != null && form.validate()) {
                            Dietcubit.get(context).SignUp(
                              context,
                              username: name.text,
                              email: email.text,
                              password: password.text,
                              gender: dropdownValue.name,
                              height: int.parse(height.text),
                              weight: int.parse(weight.text),
                            );
                          }
                        },
                        text: 'Register',
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
