part of 'ip_info_cubit.dart';

@immutable
abstract class IpInfoState {}

class IpInfoInitial extends IpInfoState {}

class IpInfoLoading extends IpInfoState {}

class IpInfoLoaded extends IpInfoState {
  final IpInfo ipInfo;

  IpInfoLoaded(this.ipInfo);
}

class IpInfoFailed extends IpInfoState {}
