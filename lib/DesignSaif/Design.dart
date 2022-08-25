// ignore_for_file: camel_case_types, prefer_const_constructors, file_names

import 'package:flutter/material.dart';

class design extends StatefulWidget {
  const design({Key? key}) : super(key: key);

  @override
  State<design> createState() => _designState();
}

class _designState extends State<design> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,

          // ignore: prefer_const_literals_to_create_immutables
          children: [
            SizedBox(
              height: 100.0,
            ),
            Text(
              'Phone Number',
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w400,
                  fontSize: 20.0),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'Your Phone number helps people connect with you.',
              style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
