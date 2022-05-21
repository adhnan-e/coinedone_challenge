import 'package:coinedone_challenge/Widgets/linear_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UsageWidget extends StatelessWidget {
  const UsageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding:  EdgeInsets.all(24.0),
          child:  Text("Free-time Usage"),
        ),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Row(children: [
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text("Max"),
              Text("2h"),
            ],)),
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
              Text("Used"),
              Text("30m"),
            ],)),
          ],),
        ),
         Padding(
           padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
           child: LinearBar(percent: 0.6, ),
         ),
        DecoratedBox(
          decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                 color:const Color(0xFF2F80ED),
              ),
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          child: SizedBox(
              height: 40,
              width: MediaQuery.of(context).size.width-40,
              child:const Center(child: Text("Extend Free-time"))),
        ),
        const Padding(
          padding:  EdgeInsets.all(24.0),
          child:  Text("Change Time Restrictions"),
        ),
      ],
    );
  }
}
