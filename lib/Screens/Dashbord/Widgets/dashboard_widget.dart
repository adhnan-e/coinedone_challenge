import 'package:coinedone_challenge/Constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../../Constants/my_functions.dart';
import '../../../Models/dashboard_model.dart';

class DashBoardWidget extends StatelessWidget {
  const DashBoardWidget({Key? key, required this.chartData}) : super(key: key);
  final ChartData chartData;
  @override
  Widget build(BuildContext context) {
    double dashBoardSized=(MediaQuery.of(context).size.width);
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(24),
          child: Text("Dashboard", style:TextStyle(fontSize: 24,fontWeight: FontWeight.w700)),
        ),
        SizedBox(
          width: dashBoardSized,
          height: dashBoardSized-200,
          child: Stack(
            children: [
              PieChart(
                // degreeOptions: ,
                dataMap:  {
                  "Class": double.parse(chartData.classTime.total.toString()),
                  "Study": double.parse(chartData.studyTime.total.toString()),
                  "Free-time": double.parse(chartData.classTime.total.toString()),
                },
                animationDuration: const Duration(milliseconds: 800),
                chartLegendSpacing: 32,

                chartRadius: (MediaQuery.of(context).size.width) / 2,
                colorList: const [
                 MyColors.classColors,
                 MyColors.studyColors,
                 MyColors.freeTimeColors
                 ],
                degreeOptions:const DegreeOptions(initialAngle: 0,totalDegrees: 360),
                initialAngleInDegree: 0,
                chartType: ChartType.ring,
                ringStrokeWidth: 14,

                legendOptions: const LegendOptions(

                  showLegends: false,
                ),
                chartValuesOptions: const ChartValuesOptions(

                  showChartValueBackground: false,
                  showChartValues: false,
                  showChartValuesInPercentage: false,
                  showChartValuesOutside: false,
                  decimalPlaces: 1,
                ),
              ),
              SizedBox.expand(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  const Text("Total",style:TextStyle(fontSize: 20,fontWeight: FontWeight.w700)),
                  Text(durationToString(int.parse(chartData.totalTime.total.toString())),style:const TextStyle(fontSize: 27,fontWeight: FontWeight.w400)),
                ]),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 24),
          child: SizedBox(
              height: 50,
              child: ListView(
                shrinkWrap: true,
                physics:const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                      width: (MediaQuery.of(context).size.width/3)-20,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 14,
                            height: 14,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  color: MyColors.classColors,
                                  border: Border.all(
                                    color: Colors.white,
                                  ),
                                  borderRadius:
                                  const BorderRadius.all(Radius.circular(90))),
                            ),
                          ),
                          const SizedBox(width: 5,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Class",style:TextStyle(fontSize: 14,fontWeight: FontWeight.w400)),
                               Text(durationToString(int.parse(chartData.classTime.total)),style:const TextStyle(fontSize: 14,fontWeight: FontWeight.w700)),
                            ],)
                        ],
                      )),
                  SizedBox(
                      width: (MediaQuery.of(context).size.width/3)-20,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 14,
                            height: 14,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  color: MyColors.studyColors,
                                  border: Border.all(
                                    color: Colors.white,
                                  ),
                                  borderRadius:
                                  const BorderRadius.all(Radius.circular(90))),
                            ),
                          ),
                          const SizedBox(width: 5,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                             const Text("Study",style:TextStyle(fontSize: 14,fontWeight: FontWeight.w400)),
                              Text(durationToString(int.parse(chartData.studyTime.total)),style:const TextStyle(fontSize: 14,fontWeight: FontWeight.w700)),
                            ],)
                        ],
                      )),
                  SizedBox(
                      width: (MediaQuery.of(context).size.width/3)-20,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 14,
                            height: 14,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  color: MyColors.freeTimeColors,
                                  border: Border.all(
                                    color: Colors.white,
                                  ),
                                  borderRadius:
                                  const BorderRadius.all(Radius.circular(90))),
                            ),
                          ),
                          const SizedBox(width: 5,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Free-time",style:TextStyle(fontSize: 14,fontWeight: FontWeight.w400)),
                              Text(durationToString(int.parse(chartData.freeTime.total)),style:const TextStyle(fontSize: 14,fontWeight: FontWeight.w700)),
                            ],)
                        ],
                      )),
                ],
              )),
        ),
      ],
    );
  }
}
