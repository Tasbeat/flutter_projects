import 'package:mvvm_sample/models/crypto.dart';
import 'package:mvvm_sample/services/api/fake_api.dart';

class CryptoFakeApiData implements FakeApi {
  @override
  Future<List<Crypto>> getInstancesList() async {
    var fakeCryptosList = [
      Crypto('bitcoin', 'Bitcoin', 'BTC', 5.8101017227475851, 19506.65,
          374115740920.84, 1),
      Crypto('ethereum', 'ethereum', 'BTC', 5.8101017227475851, 19506.65,
          374115740920.84, 2),
      Crypto('tether', 'tether', 'BTC', 5.8101017227475851, 19506.65,
          374115740920.84, 3),
      Crypto('binance-coin', 'binance-coin', 'BTC', 5.8101017227475851,
          19506.65, 374115740920.84, 4),
      Crypto('bitcoin', 'Bitcoin', 'BTC', 5.8101017227475851, 19506.65,
          374115740920.84, 1),
      Crypto('ethereum', 'ethereum', 'BTC', 5.8101017227475851, 19506.65,
          374115740920.84, 2),
      Crypto('tether', 'tether', 'BTC', 5.8101017227475851, 19506.65,
          374115740920.84, 3),
      Crypto('binance-coin', 'binance-coin', 'BTC', 5.8101017227475851,
          19506.65, 374115740920.84, 4),
      Crypto('bitcoin', 'Bitcoin', 'BTC', 5.8101017227475851, 19506.65,
          374115740920.84, 1),
      Crypto('ethereum', 'ethereum', 'BTC', 5.8101017227475851, 19506.65,
          374115740920.84, 2),
      Crypto('tether', 'tether', 'BTC', 5.8101017227475851, 19506.65,
          374115740920.84, 3),
      Crypto('binance-coin', 'binance-coin', 'BTC', 5.8101017227475851,
          19506.65, 374115740920.84, 4),
      Crypto('bitcoin', 'Bitcoin', 'BTC', 5.8101017227475851, 19506.65,
          374115740920.84, 1),
      Crypto('ethereum', 'ethereum', 'BTC', 5.8101017227475851, 19506.65,
          374115740920.84, 2),
      Crypto('tether', 'tether', 'BTC', 5.8101017227475851, 19506.65,
          374115740920.84, 3),
      Crypto('binance-coin', 'binance-coin', 'BTC', 5.8101017227475851,
          19506.65, 374115740920.84, 4),
      Crypto('bitcoin', 'Bitcoin', 'BTC', 5.8101017227475851, 19506.65,
          374115740920.84, 1),
      Crypto('ethereum', 'ethereum', 'BTC', 5.8101017227475851, 19506.65,
          374115740920.84, 2),
      Crypto('tether', 'tether', 'BTC', 5.8101017227475851, 19506.65,
          374115740920.84, 3),
      Crypto('binance-coin', 'binance-coin', 'BTC', 5.8101017227475851,
          19506.65, 374115740920.84, 4),
    ];

    return fakeCryptosList;
  }
}
