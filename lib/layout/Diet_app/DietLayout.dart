// ignore_for_file: prefer_const_constructors, unused_local_variable, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeectname/layout/Diet_app/cubit/cubit.dart';
import 'package:projeectname/layout/Diet_app/cubit/states.dart';

class Diet_Layout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Dietcubit, DietStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = Dietcubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Be Healthy,Fitness',
                style: GoogleFonts.oswald(),
              ),
            ),
            body: Column(children: [
              Image(
                image: AssetImage("assets/Images/ezgif-1-614121f496.jpg"),
                fit: BoxFit.cover,
                height: 400.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  FloatingActionButton(
                    onPressed: () {},
                    child: Text(
                      'Start Here',
                      style: GoogleFonts.oswald(),
                    ),
                  ),
                ],
              )
            ]),
          );
        });
  }
}
