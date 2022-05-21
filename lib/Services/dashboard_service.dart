import 'package:coinedone_challenge/Constants/global.dart';
import 'package:http/http.dart';

import '../Models/dashboard_model.dart';
class DashboardService {
  Future<DashBoardModel> getDashboardData() async {
    final response = await get(Uri.parse(Global.screenTime));
    final dashBoardModel = dashBoardModelFromJson(response.body);
    return dashBoardModel[0];
  }
}