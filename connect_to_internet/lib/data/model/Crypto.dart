import 'dart:convert';

class Crypto {
  String name;
  int rank;
  String symbol;
  double priceUsd;
  String maxSupply;

  Crypto(
    this.maxSupply,
    this.name,
    this.priceUsd,
    this.rank,
    this.symbol,
  );

  factory Crypto.fromMapJson(Map<String, dynamic> jsonMapObject) {
    var test = jsonMapObject['maxSupply'];
    return Crypto(
      jsonMapObject['maxSupply'] == null ? 'null' : '$test',
      jsonMapObject['name'],
      double.parse(jsonMapObject['priceUsd']),
      int.parse(jsonMapObject['rank']),
      jsonMapObject['symbol'],
    );
  }
}
