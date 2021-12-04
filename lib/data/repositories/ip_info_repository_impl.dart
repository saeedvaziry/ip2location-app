import 'package:dartz/dartz.dart';
import 'package:ip2location/core/errors/failure.dart';
import 'package:ip2location/data/sources/ip_info/ip_info_remote_source.dart';
import 'package:ip2location/domain/entities/ip_info.dart';
import 'package:ip2location/domain/repositories/ip_info_repository.dart';
import 'package:ip2location/domain/usecases/get_ip_info.dart';

class IpInfoRepositoryImpl extends IpInfoRepository {
  final IpInfoRemoteSource ipInfoRemoteSource;

  IpInfoRepositoryImpl(this.ipInfoRemoteSource);

  @override
  Future<Either<Failure, IpInfo>> getIpInfo(GetIpInfoParams params) async {
    final result = await ipInfoRemoteSource.getIpInfo(params);
    return Right(result);
  }
}
