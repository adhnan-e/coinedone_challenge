import '/Constants/my_colors.dart';
import '/Constants/my_functions.dart';
import 'package:flutter/material.dart';

import '../../../Models/dashboard_model.dart';

class DevicesWidget extends StatelessWidget {
  const DevicesWidget({Key? key, required this.deviceUsage}) : super(key: key);
  final  DeviceUsage deviceUsage;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: Text("By Devices",
              style: TextStyle(
                  fontSize: 18,
                  color: MyColors.grayColors,
                  fontWeight: FontWeight.w600)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: SizedBox(
            height: 70,
            child: Row(
              children: [
                Expanded(flex: 1, child: Image.asset("assets/phone.png")),
                Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        const Text("Adi’s Phone",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w600)),
                        Text(durationToString(int.parse(deviceUsage.totalTime.mobile)),
                            style: const TextStyle(
                              fontSize: 18,
                              color: MyColors.deviceTextColors,
                            )),
                      ],
                    )),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: SizedBox(
            height: 70,
            child: Row(
              children: [
                Expanded(flex: 1, child: Image.asset("assets/laptop.png")),
                Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Adi’s Laptop",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w600)),
                        Text(durationToString(int.parse(deviceUsage.totalTime.laptop)),
                            style: const TextStyle(
                              fontSize: 18,
                              color: MyColors.deviceTextColors,
                            )),
                      ],
                    )),
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            "See All Devices",
            style: TextStyle(fontSize: 14, color: Color(0xFF2B73DE)),
          ),
        )
      ],
    );
  }
}
