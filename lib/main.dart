import 'package:coinedone_challenge/Screens/Dashboard/dashboard_screen.dart';
import 'package:coinedone_challenge/Services/dashboard_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Services/connectivity_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coinedone challenge',
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
