import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mvvm_sample/models/crypto.dart';
import 'package:mvvm_sample/services/api/fake_api.dart';
import 'package:mvvm_sample/services/api/web_api.dart';

class CryptoListViewModel extends ChangeNotifier {
  final WebApi cryptoApiData = GetIt.I.get<WebApi>();
  List<Crypto> cryptoList = [];

  void loadData() async {
    cryptoList = await cryptoApiData.getInstancesList() as List<Crypto>;
    notifyListeners();
  }
}
