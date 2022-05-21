import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:coinedone_challenge/Services/connectivity_service.dart';
import 'package:coinedone_challenge/Services/dashboard_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../Models/dashboard_model.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final DashboardService _dashboardService;
  final ConnectivityService _connectivityService;
  DashboardBloc(this._dashboardService,this._connectivityService) : super(DashboardLoadingState()) {
    _connectivityService.connectivityStream.stream.listen((event) {
      if(event==ConnectivityResult.none){
        add(NoInternetEvent());
      }else{
        add(LoadApiEvent());
      }
    });

    on<DashboardEvent>((event, emit) async{
    final data =await _dashboardService.getDashboardData();
    emit(DashboardLoadedState(data.chartData,data.freeTimeMaxUsage,data.deviceUsage));
    });
    on<NoInternetEvent>((event,emit){
      emit(DashboardNoInternetState());
    });
  }
}
