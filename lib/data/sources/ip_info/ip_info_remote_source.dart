import 'dart:convert';
import 'package:ip2location/data/models/ip_info_model.dart';
import 'package:ip2location/domain/usecases/get_ip_info.dart';
import 'package:http/http.dart' as http;

class IpInfoRemoteSource {
  Future<IpInfoModel> getIpInfo(GetIpInfoParams params) async {
    var url = Uri.https('freeipapi.com', '/api/json', {'ip': params.ipAddress});
    final res = await http.get(url);
    final jsonData = json.decode(res.body);
    return IpInfoModel.fromJson(jsonData);
  }
}
