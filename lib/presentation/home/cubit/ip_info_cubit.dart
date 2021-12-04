import 'package:bloc/bloc.dart';
import 'package:ip2location/domain/entities/ip_info.dart';
import 'package:ip2location/domain/usecases/get_ip_info.dart';
import 'package:meta/meta.dart';

part 'ip_info_state.dart';

class IpInfoCubit extends Cubit<IpInfoState> {
  final GetIpInfo _getIpInfo;

  IpInfoCubit(
    this._getIpInfo,
  ) : super(IpInfoInitial());

  Future<void> getIpInfo(String ipAddress) async {
    emit(IpInfoLoading());

    final ipInfoEither =
        await _getIpInfo(GetIpInfoParams(ipAddress: ipAddress));
    ipInfoEither.fold(
      (failure) {
        emit(IpInfoFailed());
      },
      (model) {
        emit(IpInfoLoaded(model));
      },
    );
  }
}
