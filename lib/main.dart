import 'package:coinedone_challenge/Screens/Dashbord/dashboard_screen.dart';
import 'package:coinedone_challenge/Services/dashboard_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Services/connectivity_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiRepositoryProvider(
          providers: [
            RepositoryProvider(
              create: (context) => DashboardService(),
            ),
            RepositoryProvider(
              create: (context) => ConnectivityService(),
            )
          ], child: const DashBoardScreen()),
    );
  }
}
