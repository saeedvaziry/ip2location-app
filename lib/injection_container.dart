import 'package:get_it/get_it.dart';
import 'package:ip2location/data/repositories/ip_info_repository_impl.dart';
import 'package:ip2location/data/sources/ip_info/ip_info_remote_source.dart';
import 'package:ip2location/domain/repositories/ip_info_repository.dart';
import 'package:ip2location/domain/usecases/get_ip_info.dart';
import 'package:ip2location/presentation/home/cubit/ip_info_cubit.dart';

final GetIt serviceLocator = GetIt.instance;

Future<void> init() async {
  //! Features - Home
  initHomeFeatures();
}

void initHomeFeatures() async {
  //! bloc
  serviceLocator.registerFactory(() => IpInfoCubit(serviceLocator()));

  //! UseCase
  serviceLocator.registerLazySingleton(() => GetIpInfo(serviceLocator()));

  //! Repository
  serviceLocator.registerLazySingleton<IpInfoRepository>(
    () => IpInfoRepositoryImpl(
      serviceLocator(),
    ),
  );

  //! Data Sources
  serviceLocator.registerLazySingleton<IpInfoRemoteSource>(
    () => IpInfoRemoteSource(),
  );
}
