import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeectname/layout/News_app/cubit/cubit.dart';
import 'package:projeectname/layout/News_app/cubit/states.dart';
import 'package:projeectname/shared/components/components.dart';

class profile_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newscubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = newscubit.get(context).Profile;
          return articleBuilder(list, context);
        });
  }
}
