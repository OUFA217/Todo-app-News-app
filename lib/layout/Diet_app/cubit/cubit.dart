// ignore_for_file: prefer_const_constructors

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeectname/layout/Diet_app/cubit/states.dart';
import 'package:projeectname/modules/HomeDiet/DietHome.dart';
import 'package:projeectname/shared/components/components.dart';
import 'package:projeectname/shared/network/remote/dio_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dietcubit extends Cubit<DietStates> {
  Dietcubit() : super(initialDietStates());
  static Dietcubit get(context) => BlocProvider.of(context);

  void userlogin({
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
      DietHome.setString("Token", value.data['token'])
          .then((value) => Navigatetoandremove(Dietcubit, DietHomeLayout()));
      emit(LoginSuccefully());
    }).catchError((error) {
      emit(LoginError(error.toString()));
    });
  }
}
