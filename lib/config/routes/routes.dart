import 'package:flutter/material.dart';
import 'package:i_collab/pages/home.dart';
import 'package:i_collab/pages/profile.dart';

Map<String, WidgetBuilder> getApplicationsRoutes() {
  return <String, WidgetBuilder>{
    'home': (BuildContext context) => HomePage(),
    'profile': (BuildContext context) => ProfilePage()
  };
}