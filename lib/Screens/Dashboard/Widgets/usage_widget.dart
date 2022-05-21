import 'package:coinedone_challenge/Constants/my_colors.dart';
import 'package:coinedone_challenge/Constants/my_functions.dart';
import 'package:coinedone_challenge/Widgets/linear_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Models/dashboard_model.dart';

class UsageWidget extends StatelessWidget {
   UsageWidget({Key? key, required this.chartData, required this.maxTime}) : super(key: key);
  final ChartData chartData;
  final String maxTime;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding:  EdgeInsets.all(24.0),
          child:  Text("Free-time Usage",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
        ),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Row(children: [
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              const Text("Used",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600)),
              Text(durationToString(int.parse(chartData.freeTime.total)),style: const TextStyle(fontSize: 24,fontWeight: FontWeight.w700,color: MyColors.usedColors)),
            ],)),
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text("Max",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600)),
                Text(durationToString(int.parse(maxTime)),style: const TextStyle(fontSize: 24,fontWeight: FontWeight.w700)),
              ],)),
          ],),
        ),
         Padding(
           padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
           child: LinearBar(percent: (double.parse(((int.parse(chartData.freeTime.total)/int.parse(maxTime)*100)/100).toString())), ),
         ),
        DecoratedBox(
          decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                 color: MyColors.extendTextColors,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          child: SizedBox(
              height: 40,
              width: MediaQuery.of(context).size.width-40,
              child:const Center(child: Text("Extend Free-time",style: TextStyle(color: MyColors.extendTextColors,fontSize: 14,fontWeight: FontWeight.w600)))),
        ),
        const Padding(
          padding:  EdgeInsets.all(24.0),
          child:  Text("Change Time Restrictions",style: TextStyle(color: MyColors.changeTextColors,fontSize: 14,fontWeight: FontWeight.w400)),
        ),
      ],
    );
  }
}
