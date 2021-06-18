import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Home.dart';
import 'Login.dart';
import 'RouteGenerator.dart';
import 'dart:io';

final ThemeData temaIOS = ThemeData(
    primaryColor: Colors.grey[200],
    accentColor: Color(0xff25D366)
);

final ThemeData temaPadrao = ThemeData(
  primaryColor: Color(0xff075E54),
  accentColor: Color(0xff25D366),
);

void main(){
  runApp(MaterialApp(
    home: Login(),
    theme: ThemeData(
      primaryColor:Color(0xff075E54),
      accentColor: Color (0xff25D366)

    ),
    //Recurso rotas avançadas
    initialRoute:"/",
    onGenerateRoute: RouteGenerator.generateRoute,

  debugShowCheckedModeBanner: false,
  ));
  }



