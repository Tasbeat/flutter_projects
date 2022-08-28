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
            );
          },
        ),
      ),
    );
  }
}
