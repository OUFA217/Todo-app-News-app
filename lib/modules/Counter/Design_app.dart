// ignore_for_file: prefer_const_constructors, camel_case_types, use_key_in_widget_constructors, file_names, avoid_print, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeectname/modules/Counter/Cubit/States.dart';
import 'package:projeectname/modules/Counter/Cubit/cubit.dart';

class Design_app extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => countercubit(),
      child: BlocConsumer<countercubit, counterstates>(
        listener: ((context, state) {}),
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Design'),
            ),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextButton(
                        onPressed: () {
                          countercubit.get(context).minus();
                        },
                        child: Text(
                          'MINUS',
                          style: TextStyle(
                              fontSize: 25.0, fontWeight: FontWeight.w900),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text('${countercubit.get(context).counter}',
                        style: TextStyle(
                            fontSize: 50.0, fontWeight: FontWeight.w900)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextButton(
                        onPressed: () {
                          countercubit.get(context).plus();
                        },
                        child: Text(
                          'PLUS',
                          style: TextStyle(
                              fontSize: 25.0, fontWeight: FontWeight.w900),
                        )),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
