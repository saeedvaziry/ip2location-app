import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:ip2location/core/errors/failure.dart';
import 'package:ip2location/core/usecases/usecase.dart';
import 'package:ip2location/domain/entities/ip_info.dart';
import 'package:ip2location/domain/repositories/ip_info_repository.dart';

class GetIpInfo extends UseCase<IpInfo, GetIpInfoParams> {
  final IpInfoRepository repository;

  GetIpInfo(this.repository);

  @override
  Future<Either<Failure, IpInfo>> call(GetIpInfoParams params) async {
    return await repository.getIpInfo(params);
  }
}

class GetIpInfoParams extends Equatable {
  final String ipAddress;

  const GetIpInfoParams({required this.ipAddress});

  @override
  List<Object?> get props => [];
}
