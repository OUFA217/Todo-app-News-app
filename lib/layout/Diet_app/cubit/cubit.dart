// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, avoid_types_as_parameter_names, use_function_type_syntax_for_parameters
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeectname/layout/Diet_app/cubit/states.dart';
import 'package:projeectname/modules/HomeDiet/DietHome.dart';
import 'package:projeectname/modules/HomeDiet/Register.dart';
import 'package:projeectname/shared/components/components.dart';
import 'package:projeectname/shared/network/remote/dio_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum BodyType { FIT, SKINNY, FAT, BULKY }

enum Gender { Male, Female }

class Dietcubit extends Cubit<DietStates> {
  Dietcubit() : super(initialDietStates());
  static Dietcubit get(context) => BlocProvider.of(context);

  Future<void> userlogin(
    context, {
    String? email,
    String? password,
  }) async {
    await DioHelper.postLogin(
      url: 'diet_app/auth/logIn',
      data: {
        'email': email,
        'password': password,
      },
      query: {'Content-Type': 'application/json'},
    ).then((value) async {
      SharedPreferences DietHome = await SharedPreferences.getInstance();
      DietHome.setString("token", value.data['token'])
          .then((value) => Navigatetoandremove(context, DietHomeLayout()));
      emit(LoginSuccefully());
    }).catchError((error) {
      print(LoginError(error.toString()));
      emit(LoginError(error.toString()));
    });
    emit(LoginSuccefully());
  }

// name: dict
//     email: dict
//     password: dict
//     gender : Gender
//     height: int
//     weight :int
//     body: BodyType
  Future<void> SignUp(context,
      {String? username,
      String? email,
      String? password,
      String? gender,
      int? weight,
      int? height,
      String? body}) async {
    await DioHelper.createUser(
      url: 'diet_app/auth/createAccount',
      query: {'Content-Type': 'application/json'},
      data: {
        'username': username,
        'email': email,
        'password': password,
        'gender': gender,
        'height': height,
        'weight': weight,
        'body': body,
      },
    ).then((value) async {
      SharedPreferences DietHome = await SharedPreferences.getInstance();
      DietHome.setString("token", value.data['token'])
          .then((value) => Navigatetoandremove(context, DietHomeLayout()));
      emit(RegisterSuccefully());
    }).catchError((error) {
      print(Registererror(error.toString()));
      emit(Registererror(error.toString()));
    });
  }
}
