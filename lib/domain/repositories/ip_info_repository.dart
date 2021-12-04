import 'package:dartz/dartz.dart';
import 'package:ip2location/core/errors/failure.dart';
import 'package:ip2location/domain/entities/ip_info.dart';
import 'package:ip2location/domain/usecases/get_ip_info.dart';

abstract class IpInfoRepository {
  Future<Either<Failure, IpInfo>> getIpInfo(GetIpInfoParams params);
}
