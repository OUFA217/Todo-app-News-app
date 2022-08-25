// ignore_for_file: camel_case_types, unnecessary_import

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeectname/modules/design/Cubit/States.dart';
import 'package:projeectname/shared/network/remote/dio_helper.dart';

class countercubit extends Cubit<counterstates> {
  countercubit() : super(counterinitialstate());
  static countercubit get(context) => BlocProvider.of(context);
  int counter = 1;
  void minus() {
    counter--;
    DioHelper.getdata(
      url: 'posts',
      query: {
        'Profile': 'Khaled',
      },
    );
    emit(counterMinus(counter));
  }

  void plus() {
    counter++;
    emit(counterPlus(counter));
  }
}
