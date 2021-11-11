//@dart=2.9
import 'package:farmacia/app/view/remedio_details.dart';
import 'package:farmacia/app/view/remedio_form.dart';
import 'package:farmacia/app/view/remedio_list.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  static const HOME = '/';
  static const REMEDIOS_FORM = 'remedios-form';
  static const REMEDIOS_DETAILS = 'remedios-details';

  //const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      routes: {
       HOME : (context) => RemediosList(),
       REMEDIOS_FORM: (context) => RemedioForm(),
       REMEDIOS_DETAILS: (context) => RemedioDetails()

      },
    );
  }
}
