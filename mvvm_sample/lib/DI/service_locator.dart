import 'package:get_it/get_it.dart';
import 'package:mvvm_sample/services/api/crypto_api/crypto_fake_api_data.dart';
import 'package:mvvm_sample/services/api/crypto_api/crypto_real_api_data.dart';
import 'package:mvvm_sample/services/api/fake_api.dart';
import 'package:mvvm_sample/services/api/web_api.dart';
import 'package:mvvm_sample/view_models/cryptolist_view_model.dart';

void initServiceLocator() {
  GetIt.I.registerSingleton<WebApi>(CryptoRealApiData());
  GetIt.I.registerSingleton<FakeApi>(CryptoFakeApiData());
  GetIt.I.registerFactory<CryptoListViewModel>(() => CryptoListViewModel());
}
