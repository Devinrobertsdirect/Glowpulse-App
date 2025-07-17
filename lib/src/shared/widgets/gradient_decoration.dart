import 'package:flutter/material.dart';

BoxDecoration getGradientDecoration (BuildContext context){
  return BoxDecoration(
    gradient: LinearGradient(
      colors: [Theme.of(context).primaryColor,
        Theme.of(context).secondaryHeaderColor],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  );
}