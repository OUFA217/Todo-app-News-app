// ignore_for_file: camel_case_types, unnecessary_import, non_constant_identifier_names, avoid_print, dead_code, unused_local_variable, unnecessary_string_interpolations, empty_statements, curly_braces_in_flow_control_structures

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeectname/modules/Todo%20App/ArcheivedTasks/ArchievedTasks.dart';
import 'package:projeectname/modules/Todo%20App/DoneTasks/DoneTasks.dart';
import 'package:projeectname/modules/Todo%20App/NewTasks/NewTasks.dart';

import 'package:projeectname/shared/Cubit/states.dart';
import 'package:projeectname/shared/network/local/Cache_helper.dart';
import 'package:sqflite/sqflite.dart';

class appcubit extends Cubit<appstates> {
  appcubit() : super(appinitialstate());
  static appcubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  var ScaffoldKey = GlobalKey<ScaffoldState>();
  var FormKey = GlobalKey<FormState>();
  var titlecontroller = TextEditingController();
  var timecontroller = TextEditingController();
  var datecontroller = TextEditingController();

  List<Widget> Screens = [
    NewTasks(),
    DoneTasks(),
    ArchivedTasks(),
  ];
  List<String> Title = [
    'New Tasks',
    'Done Tasks',
    'Archived Tasks',
  ];
  void changeindex(int index) {
    currentIndex = index;
    emit(appchangebottomnavbarstate());
  }

  Database? database;
  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archivedTasks = [];

  void createDatabase() async {
    await openDatabase('todo.db', version: 1,
        onCreate: (database, version) async {
      print('database created');
      database
          .execute(
              'CREATE TABLE Tasks(id INTEGER PRIMARY KEY,title TEXT,date TEXT,time TEXT, status TEXT )')
          .then((value) {
        print('Created Table');
      }).catchError((error) {
        print('Failed to Create Table${error.toString()}');
      });
    }, onOpen: (database) {
      getdatafromDatabase(database);
      print('Database Opened');
    }).then((value) {
      database = value;

      emit(appcreatedatabase());
    });
  }

  insertDatabase({
    required String title,
    required String time,
    required String date,
  }) async {
    await database!.transaction((txn) async {
      txn
          .rawInsert(
        'INSERT INTO Tasks(title, date, time, status) VALUES("$title","$date","$time","new")',
      )
          .then((value) {
        print('$value Data is inserted');
        emit(appinsertdatabase());
        getdatafromDatabase(database);
      }).catchError((error) {
        print('Data inserted has a mistake ${error.toString()}');
      });
    });
  }

  Future<List<Map>> getdatafromDatabase(database) async {
    newTasks = [];
    archivedTasks = [];
    doneTasks = [];
    emit(appgetdatabaseloadingstate());
    return await database!.rawQuery('Select * From Tasks').then((value) {
      value.forEach((element) {
        if (element['status'] == 'new')
          newTasks.add(element);
        else if (element['status'] == 'done')
          doneTasks.add(element);
        else
          archivedTasks.add(element);
      });
      emit(appgetdatabase());
    });
    print('Tasks');
  }

  bool isBottomSheetDown = false;
  IconData? defultIcon = Icons.edit;
  void changebottmomsheet({required bool isShow, required IconData icon}) {
    isBottomSheetDown = isShow;
    defultIcon = icon;
    emit(appchangebottomsheetstate());
  }

  void DeleteDatabase({
    @required int? id,
  }) async {
    database!.rawDelete('DELETE FROM Tasks WHERE id = ?', [id]).then((value) {
      getdatafromDatabase(database);
      emit(appDeleteDatabase());
    });
  }

  void updateDatabase({
    @required String? status,
    @required int? id,
  }) async {
    database!.rawUpdate(
      'UPDATE Tasks SET status = ? WHERE id = ?',
      ['$status', id],
    ).then((value) {
      getdatafromDatabase(database);
      emit(appUpdateDatabase());
    });
  }

  bool isdark = false;
  ThemeMode? appmode = ThemeMode.dark;
  void changeappmode({bool? fromshared}) {
    if (fromshared != null) {
      isdark = fromshared;

      emit(appchangemodestate());
    } else {
      isdark = !isdark;

      cacheHelper.putboolean(key: 'isdark', value: isdark).then((value) {
        emit(appchangemodestate());
      });
    }
  }
}
