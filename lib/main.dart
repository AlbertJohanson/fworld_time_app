import 'package:flutter/material.dart';
import 'package:fworld_time_app/Pages/Home.dart';
import 'package:fworld_time_app/Pages/loading.dart';
import 'package:fworld_time_app/Pages/choose-location.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes:{
    '/':(context) => Loading(),
    '/Home': (context) => Home(),
    '/location': (context) => ChooseLocation(),
  },
));


