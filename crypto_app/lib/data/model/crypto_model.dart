class Crypto {
  String name;
  String symbol;
  int rank;
  double priceUsd;
  double changePercent24Hr;
  double supply;
  double maxSupply;

  Crypto(
    this.changePercent24Hr,
    this.maxSupply,
    this.priceUsd,
    this.supply,
    this.name,
    this.rank,
    this.symbol,
  );

  factory Crypto.fromMapObject(Map<String, dynamic> jsonMapObject) {
    return Crypto(
      double.parse(jsonMapObject['changePercent24Hr']),
      jsonMapObject['maxSupply'] == null
          ? 0
          : double.parse(jsonMapObject['maxSupply']),
      double.parse(jsonMapObject['priceUsd']),
      double.parse(jsonMapObject['supply']),
      jsonMapObject['name'],
      int.parse(jsonMapObject['rank']),
      jsonMapObject['symbol'],
    );
  }
}
