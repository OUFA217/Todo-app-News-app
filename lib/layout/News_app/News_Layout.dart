// ignore_for_file: override_on_non_overriding_member, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeectname/layout/News_app/cubit/cubit.dart';
import 'package:projeectname/layout/News_app/cubit/states.dart';
import 'package:projeectname/modules/News%20App/Search/Search.dart';

import 'package:projeectname/shared/Cubit/cubit.dart';
import 'package:projeectname/shared/components/components.dart';
import 'package:projeectname/shared/network/remote/dio_helper.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newscubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = newscubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('News App'),
            actions: [
              IconButton(
                onPressed: () {
                  Navigateto(
                    context,
                    SearchScreen(),
                  );
                },
                icon: Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {
                  appcubit.get(context).changeappmode();
                },
                icon: Icon(Icons.brightness_4_outlined),
              ),
            ],
          ),
          body: cubit.Screens[cubit.currentindex],
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomitems,
            currentIndex: cubit.currentindex,
            onTap: (index) {
              cubit.changebottomnavindex(index);
            },
          ),
        );
      },
    );
  }
}
