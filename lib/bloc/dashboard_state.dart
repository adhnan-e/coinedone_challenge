part of 'dashboard_bloc.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();
}
class DashboardLoadingState extends DashboardState {
  @override
  List<Object> get props => [];
}
class DashboardLoadedState extends DashboardState {
  final ChartData chartData;
  final String freeTimeMaxUsage;
  final DeviceUsage deviceUsage;

  const DashboardLoadedState(this.chartData, this.freeTimeMaxUsage, this.deviceUsage);


  @override
  // TODO: implement props
  List<Object?> get props => [chartData,freeTimeMaxUsage,deviceUsage];
}

class DashboardNoInternetState extends DashboardState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}