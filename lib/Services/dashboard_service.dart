import 'package:coinedone_challenge/Constants/global.dart';
import 'package:http/http.dart';

import '../Models/dashboard_model.dart';
class DashboardService {
  Future<DashBoardModel> getDashboardData() async {
    final response = await get(Uri.parse(Global.screenTime));
    final dashBoardModel = dashBoardModelFromJson(response.body);
    print("dfvdfcvvbdfvb ${response.body}");
    print("dfvdfcvvbdfvb ${dashBoardModel[0].freeTimeMaxUsage}");
    return dashBoardModel[0];
  }
}