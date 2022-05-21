// To parse this JSON data, do
//
//     final dashBoardModel = dashBoardModelFromJson(jsonString);

import 'dart:convert';

List<DashBoardModel> dashBoardModelFromJson(String str) => List<DashBoardModel>.from(json.decode(str).map((x) => DashBoardModel.fromJson(x)));

String dashBoardModelToJson(List<DashBoardModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DashBoardModel {
  DashBoardModel({
    required this.chartData,
    required this.freeTimeMaxUsage,
    required this.deviceUsage,
  });

  ChartData chartData;
  String freeTimeMaxUsage;
  DeviceUsage deviceUsage;

  factory DashBoardModel.fromJson(Map<String, dynamic> json) => DashBoardModel(
    chartData: ChartData.fromJson(json["chartData"]),
    freeTimeMaxUsage: json["freeTimeMaxUsage"],
    deviceUsage: DeviceUsage.fromJson(json["deviceUsage"]),
  );

  Map<String, dynamic> toJson() => {
    "chartData": chartData.toJson(),
    "freeTimeMaxUsage": freeTimeMaxUsage,
    "deviceUsage": deviceUsage.toJson(),
  };
}

class ChartData {
  ChartData({
    required  this.totalTime,
    required  this.studyTime,
    required  this.classTime,
    required   this.freeTime,
  });

  ChartDataClassTime totalTime;
  ChartDataClassTime studyTime;
  ChartDataClassTime classTime;
  ChartDataClassTime freeTime;

  factory ChartData.fromJson(Map<String, dynamic> json) => ChartData(
    totalTime: ChartDataClassTime.fromJson(json["totalTime"]),
    studyTime: ChartDataClassTime.fromJson(json["studyTime"]),
    classTime: ChartDataClassTime.fromJson(json["classTime"]),
    freeTime: ChartDataClassTime.fromJson(json["freeTime"]),
  );

  Map<String, dynamic> toJson() => {
    "totalTime": totalTime.toJson(),
    "studyTime": studyTime.toJson(),
    "classTime": classTime.toJson(),
    "freeTime": freeTime.toJson(),
  };
}

class ChartDataClassTime {
  ChartDataClassTime({
    required  this.total,
  });

  String total;

  factory ChartDataClassTime.fromJson(Map<String, dynamic> json) => ChartDataClassTime(
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "total": total,
  };
}

class DeviceUsage {
  DeviceUsage({
    required  this.totalTime,
    required  this.studyTime,
    required  this.classTime,
    required  this.freeTime,
  });

  DeviceUsageClassTime totalTime;
  DeviceUsageClassTime studyTime;
  DeviceUsageClassTime classTime;
  DeviceUsageClassTime freeTime;

  factory DeviceUsage.fromJson(Map<String, dynamic> json) => DeviceUsage(
    totalTime: DeviceUsageClassTime.fromJson(json["totalTime"]),
    studyTime: DeviceUsageClassTime.fromJson(json["studyTime"]),
    classTime: DeviceUsageClassTime.fromJson(json["classTime"]),
    freeTime: DeviceUsageClassTime.fromJson(json["freeTime"]),
  );

  Map<String, dynamic> toJson() => {
    "totalTime": totalTime.toJson(),
    "studyTime": studyTime.toJson(),
    "classTime": classTime.toJson(),
    "freeTime": freeTime.toJson(),
  };
}

class DeviceUsageClassTime {
  DeviceUsageClassTime({
    required  this.mobile,
    required   this.laptop,
  });

  String mobile;
  String laptop;

  factory DeviceUsageClassTime.fromJson(Map<String, dynamic> json) => DeviceUsageClassTime(
    mobile: json["mobile"],
    laptop: json["laptop"],
  );

  Map<String, dynamic> toJson() => {
    "mobile": mobile,
    "laptop": laptop,
  };
}
