// ignore_for_file: use_function_type_syntax_for_parameters, non_constant_identifier_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_is_empty, sized_box_for_whitespace, curly_braces_in_flow_control_structures, unnecessary_new, unused_element, constant_identifier_names

import 'dart:io';
import 'dart:math';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:projeectname/layout/Diet_app/cubit/cubit.dart';
import 'package:projeectname/modules/Web_View/Web_View.dart';
import 'package:projeectname/shared/Cubit/cubit.dart';

enum Gender { Male, Female }

enum BodyType { Fat, Bulky, Skinny, Fit }

Widget defultbutton({
  double width = double.maxFinite,
  bool isUppercase = true,
  double radius = 100.0,
  required VoidCallback function,
  required String text,
  context,
  token,
}) =>
    Container(
      width: width,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUppercase ? text : text,
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.white,
          Colors.white,
        ], begin: Alignment.centerLeft, end: Alignment.centerRight),
        borderRadius: BorderRadius.circular(radius),
      ),
    );
FocusNode myFocusNode = new FocusNode();

Gender dropdownValue = Gender.values[0];
Widget SelectedGender({
  Color background = Colors.transparent,
  void Function(String)? onsubmit,
  void Function(dynamic)? changed,
  VoidCallback? suffixpressed,
  VoidCallback? onTap,
  BorderSide? bord,
  bool isPassword = false,
  IconData? prefix,
  String email = 'email',
  TextStyle? Texcolor,
  IconData? suffix,
  TextStyle? labelst,
}) =>
    DropdownButton<Gender>(
      value: dropdownValue,
      onTap: onTap,
      onChanged: changed,
      style: TextStyle(
          color: myFocusNode.hasFocus
              ? Color.fromARGB(255, 4, 169, 245)
              : Colors.blue),
      hint: Text('Select Your Gender'),
      items: Gender.values.map((Gender genderr) {
        return DropdownMenuItem<Gender>(
          child: Text(genderr.toString()),
          value: genderr,
        );
      }).toList(),
    );
// List<String> Body = ['Skinny', 'Fat', 'Fit', 'Bulky'];
BodyType body = BodyType.values[0];
Widget SelectedBody({
  Color background = Colors.transparent,
  void Function(String)? onsubmit,
  void Function(dynamic)? changed,
  VoidCallback? suffixpressed,
  VoidCallback? onTap,
  BorderSide? bord,
  bool isPassword = false,
  IconData? prefix,
  String email = 'email',
  TextStyle? Texcolor,
  IconData? suffix,
  TextStyle? labelst,
}) =>
    DropdownButton<BodyType>(
      value: body,
      onTap: onTap,
      onChanged: changed,
      focusColor: Colors.white,
      dropdownColor: Colors.white,
      style: TextStyle(
          color: myFocusNode.hasFocus
              ? Color.fromARGB(255, 4, 169, 245)
              : Colors.blue),
      hint: Text('Select Your Body'),
      items: BodyType.values.map((BodyType boody) {
        return DropdownMenuItem<BodyType>(
            child: Text(boody.toString()), value: boody);
      }).toList(),
    );
Widget defultformfield(
        {required final FormFieldValidator<String> validator,
        required TextEditingController controller,
        Color background = Colors.transparent,
        required TextInputType type,
        void Function(String)? onsubmit,
        void Function(String)? changed,
        VoidCallback? suffixpressed,
        VoidCallback? onTap,
        required String label,
        BorderSide? bord,
        bool isPassword = false,
        IconData? prefix,
        String email = 'email',
        TextStyle? Texcolor,
        IconData? suffix,
        TextStyle? labelst}) =>
    TextFormField(
      validator: validator,
      controller: controller,
      obscureText: isPassword,
      onChanged: changed,
      onTap: onTap,
      onFieldSubmitted: onsubmit,
      keyboardType: type,
      style: Texcolor,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(color: Colors.white)),
        fillColor: background,
        labelStyle: labelst,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(12))),
        labelText: label,
        prefixIcon: Icon(
          prefix,
          color: Colors.white,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixpressed,
                icon: Icon(
                  suffix,
                  color: Colors.white,
                ),
              )
            : null,
        border: OutlineInputBorder(borderSide: BorderSide()),
      ),
    );
Widget defultformfields(
        {required final FormFieldValidator<String> validator,
        required TextEditingController controller,
        Color background = Colors.transparent,
        required TextInputType type,
        void Function(String)? onsubmit,
        void Function(String)? changed,
        VoidCallback? suffixpressed,
        VoidCallback? onTap,
        required String label,
        BorderSide? bord,
        bool isPassword = false,
        required IconData prefix,
        String email = 'email',
        TextStyle? Texcolor,
        IconData? suffix,
        TextStyle? labelst}) =>
    TextFormField(
      validator: validator,
      controller: controller,
      obscureText: isPassword,
      onChanged: changed,
      onTap: onTap,
      onFieldSubmitted: onsubmit,
      keyboardType: type,
      style: Texcolor,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(color: Colors.white)),
        fillColor: background,
        labelStyle: labelst,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(12))),
        labelText: label,
        prefixIcon: Icon(
          prefix,
          color: Colors.white,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixpressed,
                icon: Icon(
                  suffix,
                  color: Colors.white,
                ),
              )
            : null,
        border: OutlineInputBorder(borderSide: BorderSide()),
      ),
    );

Widget defultformfieldf(
        {required final FormFieldValidator<String> validator,
        required TextEditingController controller,
        Color background = Colors.transparent,
        required TextInputType type,
        void Function(String)? onsubmit,
        token,
        context,
        void Function(String)? changed,
        VoidCallback? suffixpressed,
        VoidCallback? onTap,
        required String label,
        BorderSide? bord,
        bool isPassword = false,
        required IconData prefix,
        TextStyle? Texcolor,
        IconData? suffix,
        TextStyle? labelst}) =>
    Container(
      child: TextFormField(
        validator: validator,
        controller: controller,
        obscureText: isPassword,
        onChanged: changed,
        onTap: onTap,
        onFieldSubmitted: onsubmit,
        keyboardType: type,
        style: Texcolor,
        // decoration: InputDecoration(
        //   fillColor: background,
        //   labelStyle: labelst,
        //   focusedBorder: OutlineInputBorder(
        //       borderSide: BorderSide(color: Color.fromARGB(255, 255, 179, 0))),
        //   labelText: label,
        //   prefixIcon: Icon(
        //     prefix,
        //     color: Color.fromARGB(255, 240, 168, 0),
        //   ),
        //   suffixIcon: suffix != null
        //       ? IconButton(
        //           onPressed: suffixpressed,
        //           icon: Icon(
        //             suffix,
        //             color: Color.fromARGB(255, 255, 174, 0),
        //           ),
        //         )
        //       : null,
        //   border: OutlineInputBorder(borderSide: BorderSide()),
        // ),
      ),
    );

Widget ImageFilter({brightness, child}) {
  return ColorFiltered(
    colorFilter: ColorFilter.matrix(ColorFilterGenerator.brightnessAdjustMatrix(
      value: brightness,
    )),
    child: child,
  );
}

Widget buildTasksItem(Map model, context) => Dismissible(
    key: Key(model['id'].toString()),
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40.0,
            child: Text('${model['time']}'),
          ),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${model['title']}'),
                Text(
                  '${model['date']}',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          IconButton(
            onPressed: () {
              appcubit
                  .get(context)
                  .updateDatabase(status: 'done', id: model['id']);
            },
            icon: Icon(Icons.check_box),
            color: Colors.green,
          ),
          IconButton(
            onPressed: () {
              appcubit.get(context).updateDatabase(
                    status: 'archived',
                    id: model['id'],
                  );
            },
            icon: Icon(Icons.archive_rounded),
            color: Colors.grey[900],
          )
        ],
      ),
    ),
    onDismissed: (Direction) {
      appcubit.get(context).DeleteDatabase(id: model['id']);
    });
Widget tasksBuilder({
  required List<Map> Tasks,
}) =>
    ConditionalBuilder(
      condition: Tasks.length > 0,
      builder: (context) => ListView.separated(
        itemBuilder: (context, index) {
          return buildTasksItem(Tasks[index], context);
        },
        separatorBuilder: (context, index) => myDivider(),
        itemCount: Tasks.length,
      ),
      fallback: (context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.menu,
              size: 100.0,
              color: Colors.grey,
            ),
            Text(
              'No Tasks Yet, Please Add Some Tasks',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
Widget buildArticleItem(data, context) => InkWell(
      onTap: () {
        Navigateto(
          context,
          WebView_screen(data['url']),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: NetworkImage('${data['urlToImage']}'),
                    fit: BoxFit.cover,
                  )),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${data['title']}',
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '${data['publishedAt']}',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );
Widget articleBuilder(list, context, {isSearch = false}) => ConditionalBuilder(
      condition: list.length > 0,
      builder: (context) => ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildArticleItem(list[index], context),
        separatorBuilder: (context, index) => myDivider(),
        itemCount: list.length,
      ),
      fallback: (context) => isSearch
          ? Container()
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
void Navigateto(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
void Navigatetoandremove(context, widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => widget), (Route) => false);
Widget Khaled(data, context) => InkWell(
      onTap: () {
        Navigateto(
          context,
          WebView_screen(data['url']),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: NetworkImage('${data['urlToImage']}'),
                    fit: BoxFit.cover,
                  )),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${data['title']}',
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '${data['publishedAt']}',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

class ColorFilterGenerator {
  static List<double> brightnessAdjustMatrix({double? value}) {
    if (value! <= 0)
      value = value * 255;
    else
      value = value * 100;

    if (value == 0)
      // ignore: curly_braces_in_flow_control_structures
      return [
        1,
        0,
        0,
        0,
        0,
        0,
        1,
        0,
        0,
        0,
        0,
        0,
        1,
        0,
        0,
        0,
        0,
        0,
        1,
        0,
      ];

    return List<double>.from(<double>[
      1,
      0,
      0,
      0,
      value,
      0,
      1,
      0,
      0,
      value,
      0,
      0,
      1,
      0,
      value,
      0,
      0,
      0,
      1,
      0
    ]).map((i) => i.toDouble()).toList();
  }
}
