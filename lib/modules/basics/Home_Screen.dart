// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables, file_names, unused_import, use_key_in_widget_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: Icon(
          Icons.menu,
        ),
        title: Text('Mat3am Kayfny'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notification_important,
            ),
            onPressed: notifi,
          ),
          IconButton(
              icon: Text("Hello"),
              onPressed: () {
                print("hello World");
              }),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              width: 200.0,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image(
                    image: NetworkImage(
                        'https://scontent.fcai19-4.fna.fbcdn.net/v/t1.6435-9/201409941_543615666647413_7458948330103282609_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=09cbfe&_nc_eui2=AeHJZiZpvtF_MSa8qnic-54vRUNGuF9pcw5FQ0a4X2lzDgj3bo3KuuB7JJSfWshIOhdFxeVV_MkGtqNvMywutrxn&_nc_ohc=ECqQaix3H68AX9QWwd5&_nc_ht=scontent.fcai19-4.fna&oh=00_AT-oZqLsr6M8muGh1Jo16m4de0zLxlg38abpmMlspAZ04g&oe=62546DC6'),
                    height: 200.0,
                    width: 200.0,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.black.withOpacity(.5),
                    child: Text(
                      'Khaled',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void notifi() {
    print('notifi pressed');
  }
}
