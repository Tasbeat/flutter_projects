import 'package:flutter/material.dart';
import 'package:mvvm_sample/models/crypto.dart';
import 'package:mvvm_sample/services/api/crypto_api/crypto_api_data.dart';

class CoinlistViewmodel extends ChangeNotifier {
  final CryptoApiData cryptoApiData = CryptoApiData();
  List<Crypto> cryptoList = [];

  void loadData() async {
    cryptoList = await cryptoApiData.getInstancesOfModelList();
    notifyListeners();
  }
}
