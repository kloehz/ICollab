import 'package:flutter/material.dart';
import 'package:i_collab/config/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ICollab',
      initialRoute: 'home',
      routes: getApplicationsRoutes(),
    );
  }
}