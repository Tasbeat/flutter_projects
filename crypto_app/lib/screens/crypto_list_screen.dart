import 'package:flutter/material.dart';

import '../data/model/crypto_model.dart';

class CryptoListScreen extends StatefulWidget {
  List<Crypto>? cryptoList;
  CryptoListScreen({Key? key, this.cryptoList}) : super(key: key);

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  List<Crypto>? cryptoList;
  @override
  void initState() {
    super.initState();
    cryptoList = widget.cryptoList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: cryptoList!.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(cryptoList![index].name),
              leading: SizedBox(
                width: 30.0,
                child: Center(
                  child: Text(
                    cryptoList![index].rank.toString(),
                  ),
                ),
              ),
              subtitle: Text(cryptoList![index].symbol),
              trailing: SizedBox(
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          cryptoList![index].priceUsd.toStringAsFixed(2),
                        ),
                        Text(
                          cryptoList![index]
                              .changePercent24Hr
                              .toStringAsFixed(2),
                        )
                      ],
                    ),
                    const SizedBox(width: 8.0),
                    _getTrendingIcon(index)
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Icon _getTrendingIcon(int index) {
    return Icon(
      cryptoList![index].changePercent24Hr > 0
          ? Icons.trending_up
          : Icons.trending_down,
      color:
          cryptoList![index].changePercent24Hr > 0 ? Colors.green : Colors.red,
    );
  }
}
