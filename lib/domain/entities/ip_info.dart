import 'package:equatable/equatable.dart';

class IpInfo extends Equatable {
  final String ipVersion;
  final String ipAddress;
  final String latitude;
  final String longitude;
  final String countryName;
  final String countryCode;
  final String timeZone;
  final String zipCode;
  final String cityName;
  final String regionName;

  const IpInfo({
    required this.ipVersion,
    required this.ipAddress,
    required this.latitude,
    required this.longitude,
    required this.countryName,
    required this.countryCode,
    required this.timeZone,
    required this.zipCode,
    required this.cityName,
    required this.regionName,
  });

  @override
  List<Object?> get props => [
        ipVersion,
        ipAddress,
        latitude,
        longitude,
        countryName,
        countryCode,
        timeZone,
        zipCode,
        cityName,
        regionName
      ];
}
