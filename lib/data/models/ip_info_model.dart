import 'package:ip2location/domain/entities/ip_info.dart';

class IpInfoModel extends IpInfo {
  const IpInfoModel({
    required String ipVersion,
    required String ipAddress,
    required String latitude,
    required String longitude,
    required String countryName,
    required String countryCode,
    required String timeZone,
    required String zipCode,
    required String cityName,
    required String regionName,
  }) : super(
          ipVersion: ipVersion,
          ipAddress: ipAddress,
          latitude: latitude,
          longitude: longitude,
          countryName: countryName,
          countryCode: countryCode,
          timeZone: timeZone,
          zipCode: zipCode,
          cityName: cityName,
          regionName: regionName,
        );

  factory IpInfoModel.fromJson(Map<String, dynamic> json) {
    return IpInfoModel(
      ipVersion: json["ipVersion"].toString(),
      ipAddress: json["ipAddress"].toString(),
      latitude: json["latitude"].toString(),
      longitude: json["longitude"].toString(),
      countryName: json["countryName"].toString(),
      countryCode: json["countryCode"].toString(),
      timeZone: json["timeZone"].toString(),
      zipCode: json["zipCode"].toString(),
      cityName: json["cityName"].toString(),
      regionName: json["regionName"].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ipVersion': ipVersion,
      'ipAddress': ipAddress,
      'latitude': latitude,
      'longitude': longitude,
      'countryName': countryName,
      'countryCode': countryCode,
      'timeZone': timeZone,
      'zipCode': zipCode,
      'cityName': cityName,
      'regionName': regionName,
    };
  }
}
