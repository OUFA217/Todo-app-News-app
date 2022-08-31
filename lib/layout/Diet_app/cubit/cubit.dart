import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeectname/layout/Diet_app/cubit/states.dart';

class Dietcubit extends Cubit<DietStates> {
  Dietcubit() : super(initialDietStates());
  static Dietcubit get(context) => BlocProvider.of(context);
}
