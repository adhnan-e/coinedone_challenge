import 'package:coinedone_challenge/Screens/Dashbord/Widgets/dashboard_widget.dart';
import 'package:coinedone_challenge/Screens/Dashbord/Widgets/devices_widget.dart';
import 'package:coinedone_challenge/Screens/Dashbord/Widgets/usage_widget.dart';
import 'package:coinedone_challenge/Services/connectivity_service.dart';
import 'package:coinedone_challenge/Services/dashboard_service.dart';
import 'package:coinedone_challenge/bloc/dashboard_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          DashboardBloc(
              RepositoryProvider.of<DashboardService>(context),
              RepositoryProvider.of<ConnectivityService>(context),
          )..add(LoadApiEvent()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.all(6.0),
            child: DecoratedBox(
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      colors: [
                        Color(0x0de330bc),
                        Color(0xF0FFFBA3),
                      ],
                      begin: FractionalOffset(0.0, 0.0),
                      end: FractionalOffset(0.9, 0.9),
                      tileMode: TileMode.decal),
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(90))),
            ),
          ),
          title: const Text(
            "Michael",
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
          actions: [Image.asset("assets/settings.png")],
        ),
        body: BlocBuilder<DashboardBloc, DashboardState>(
          builder: (context, state) {
            if(state is DashboardNoInternetState){
              return const Center(child: Text("No Internet :("),);
            }
            if(state is DashboardLoadingState){
              return const Center(child: CircularProgressIndicator(),);
            }

            if(state is DashboardLoadedState){
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(children:  [
                  DashBoardWidget(chartData: state.chartData,),
                  const Divider(),
                  UsageWidget( chartData: state.chartData,maxTime: state.freeTimeMaxUsage),
                  const Divider(),
                  DevicesWidget(deviceUsage: state.deviceUsage),
                ]),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
