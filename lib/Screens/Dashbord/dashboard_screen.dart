import 'package:coinedone_challenge/Screens/Dashbord/Widgets/dashboard_widget.dart';
import 'package:coinedone_challenge/Screens/Dashbord/Widgets/devices_widget.dart';
import 'package:coinedone_challenge/Screens/Dashbord/Widgets/usage_widget.dart';
import 'package:flutter/material.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: const Text("Michael",style: TextStyle(color: Colors.black,fontSize: 14,),),
        actions: [Image.asset("assets/settings.png")],
      ),
      body: SingleChildScrollView(
        child: Column(children:  [
          DashBoardWidget(),
          Divider(),
          UsageWidget(),
          Divider(),
          DevicesWidget(),
        ]),
      ),
    );
  }
}
