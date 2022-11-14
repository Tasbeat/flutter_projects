import 'package:dio/dio.dart';
import 'package:mvvm_sample/models/crypto.dart';
import 'package:mvvm_sample/services/api/web_api.dart';

class CryptoApiData implements WebApi {
  @override
  Future<List<Crypto>> getInstancesOfModelList() async {
    var response = await Dio().get('https://api.coincap.io/v2/assets');

    List<Crypto> cryptoList = response.data['data']
        .map<Crypto>((jsonMapObject) => Crypto.fromMapJson(jsonMapObject))
        .toList();

    return cryptoList;
  }
}
