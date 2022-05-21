import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DevicesWidget extends StatelessWidget {
  const DevicesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: Text("By Devices",
              style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF201F1E),
                  fontWeight: FontWeight.w700)),
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
                      children: [
                        Text("Adi’s Phone",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w600)),
                        Text("40m",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF3D7FE0),
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
                        Text("Adi’s Laptop",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w600)),
                        Text("1h 30m",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF3D7FE0),
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
