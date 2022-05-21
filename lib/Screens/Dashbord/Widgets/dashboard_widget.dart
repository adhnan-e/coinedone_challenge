import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class DashBoardWidget extends StatelessWidget {
  const DashBoardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double dashBoardSized=(MediaQuery.of(context).size.width);
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(24),
          child: Text("Dashboard", style: TextStyle(fontSize: 24)),
        ),
        SizedBox(
          width: dashBoardSized,
          height: dashBoardSized-200,
          child: Stack(
            children: [
              PieChart(
                // degreeOptions: ,
                dataMap: const {
                  "Flutter": 5,
                  "React": 3,
                  "Xamarin": 2,
                  "Ionic": 2,
                },
                animationDuration: const Duration(milliseconds: 800),
                chartLegendSpacing: 32,

                chartRadius: (MediaQuery.of(context).size.width) / 2,
                colorList: const [
                  Color.fromRGBO(223, 250, 92, 1),
                  Color.fromRGBO(129, 250, 112, 1),
                  Color.fromRGBO(255, 0, 0, 1.0),
                  Color.fromRGBO(250, 112, 248, 1.0),
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
                  Text("Total"),
                  Text("2h 40m"),
                ]),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 24),
          child: SizedBox(
              height: 50,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                physics:const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: (MediaQuery.of(context).size.width/3)-20,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 14,
                            height: 14,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  color: Colors.red,
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
                            Text("Class"),
                            Text("1h 20m"),
                          ],)
                        ],
                      ));
                },
              )),
        ),
      ],
    );
  }
}
