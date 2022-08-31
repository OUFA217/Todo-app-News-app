// ignore_for_file: prefer_const_constructors, unused_import, use_key_in_widget_constructors,, deprecated_member_use, unused_local_variable, prefer_const_literals_to_create_immutables
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:projeectname/BlocObServer.dart';
import 'package:projeectname/DesignSaif/Design.dart';
import 'package:projeectname/layout/Diet_app/DietLayout.dart';
import 'package:projeectname/layout/Diet_app/cubit/cubit.dart';
import 'package:projeectname/layout/Diet_app/cubit/states.dart';
import 'package:projeectname/layout/News_app/News_Layout.dart';
import 'package:projeectname/layout/News_app/cubit/cubit.dart';
import 'package:projeectname/layout/Todo_app/Home_Layout.dart';

import 'package:projeectname/modules/login/Login_Screen.dart';
import 'package:projeectname/modules/messanger/MessangerScreen.dart';
import 'package:projeectname/shared/Cubit/cubit.dart';
import 'package:projeectname/shared/Cubit/states.dart';
import 'package:projeectname/shared/network/local/Cache_helper.dart';
import 'package:projeectname/shared/network/remote/dio_helper.dart';

void main() {
  BlocOverrides.runZoned(
    () async {
      //بيتأكد ان كل حاجه خلصت فالميثود وبعدين يرن
      WidgetsFlutterBinding.ensureInitialized();
      DioHelper.init();
      await cacheHelper.init();
      bool? isdark = cacheHelper.getboolean(key: 'isdark');
      isdark = false;

      runApp(MyApp(isdark));
      // Use cubits...
    },
    blocObserver: MyBlocObserver(),
  );
}

//class MyApp
//stateless dol 2 widget flutter kolhm
//stateful
class MyApp extends StatelessWidget {
  final bool isdark;
  MyApp(this.isdark);

  // AWL 7AGA astd3y constructor 3lshan y2om tany 7aga el bulid
  //3lshan hya asasya fe el app hya elly btbny el app
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider(
        //   create: (context) => newscubit()
        //     ..getBusniess()
        //     ..getSports()
        //     ..getScience()
        //     ..getProfile(),
        // ),
        BlocProvider(
          create: (context) => Dietcubit(),
          // create: (BuildContext context) =>
          //     appcubit()..changeappmode(fromshared: isdark),
        ),
      ],
      child: BlocConsumer<Dietcubit, DietStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
              home: Diet_Layout(),
              theme: ThemeData(
                primarySwatch: Colors.deepOrange,
                scaffoldBackgroundColor: HexColor('333739'),
                appBarTheme: AppBarTheme(
                    titleSpacing: 20.0,
                    iconTheme: IconThemeData(color: Colors.white),
                    backwardsCompatibility: false,
                    backgroundColor: HexColor('000000'),
                    elevation: 0.0,
                    titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: HexColor('000000'),
                      statusBarIconBrightness: Brightness.light,
                    )),
                floatingActionButtonTheme: FloatingActionButtonThemeData(
                  backgroundColor: Colors.deepOrange,
                ),
                //   primarySwatch: Colors.deepOrange,
                //   scaffoldBackgroundColor: Colors.white,
                //   appBarTheme: AppBarTheme(
                //       titleSpacing: 20.0,
                //       iconTheme: IconThemeData(color: Colors.black),
                //       backwardsCompatibility: false,
                //       backgroundColor: Colors.black,
                //       elevation: 0.0,
                //       titleTextStyle: TextStyle(
                //         color: Colors.black,
                //         fontSize: 20.0,
                //         fontWeight: FontWeight.bold,
                //       ),
                //       systemOverlayStyle: SystemUiOverlayStyle(
                //         statusBarColor: Colors.black,
                //         statusBarIconBrightness: Brightness.dark,
                //       )),
                //   floatingActionButtonTheme: FloatingActionButtonThemeData(
                //     backgroundColor: Colors.deepOrange,
                //   ),
                //   bottomNavigationBarTheme: BottomNavigationBarThemeData(
                //       type: BottomNavigationBarType.fixed,
                //       selectedItemColor: Colors.deepOrange,
                //       elevation: 20.0),
                //   textTheme: TextTheme(
                //     bodyText1: TextStyle(
                //       fontSize: 18.0,
                //       fontWeight: FontWeight.w600,
                //       color: Colors.black,
                //     ),
                //   ),
                // ),
                // darkTheme: ThemeData(
                //   primarySwatch: Colors.deepOrange,
                //   scaffoldBackgroundColor: HexColor('333739'),
                //   appBarTheme: AppBarTheme(
                //       titleSpacing: 20.0,
                //       iconTheme: IconThemeData(color: Colors.white),
                //       backwardsCompatibility: false,
                //       backgroundColor: HexColor('000000'),
                //       elevation: 0.0,
                //       titleTextStyle: TextStyle(
                //         color: Colors.white,
                //         fontSize: 20.0,
                //         fontWeight: FontWeight.bold,
                //       ),
                //       systemOverlayStyle: SystemUiOverlayStyle(
                //         statusBarColor: HexColor('000000'),
                //         statusBarIconBrightness: Brightness.dark,
                //       )),
                //   floatingActionButtonTheme: FloatingActionButtonThemeData(
                //     backgroundColor: Colors.deepOrange,
                //   ),
                //   bottomNavigationBarTheme: BottomNavigationBarThemeData(
                //     type: BottomNavigationBarType.fixed,
                //     selectedItemColor: Colors.deepOrange,
                //     unselectedItemColor: Colors.grey,
                //     elevation: 20.0,
                //     backgroundColor: HexColor('333739'),
                //   ),
                //   textTheme: TextTheme(
                //     bodyText1: TextStyle(
                //       fontSize: 18.0,
                //       fontWeight: FontWeight.w600,
                //       color: Colors.white,
                //     ),
                //   ),
                // ),
                // themeMode: ThemeMode.dark,
              ),
              debugShowCheckedModeBanner: false);
        },
      ),
    );
  }
}
