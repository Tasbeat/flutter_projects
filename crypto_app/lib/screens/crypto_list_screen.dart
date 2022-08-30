import 'package:crypto_app/data/constants.dart/constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../data/model/crypto_model.dart';

class CryptoListScreen extends StatefulWidget {
  List<Crypto>? cryptoList;
  CryptoListScreen({Key? key, this.cryptoList}) : super(key: key);

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  var textEditingController = TextEditingController();
  List<Crypto>? cryptoList;
  @override
  void initState() {
    super.initState();
    cryptoList = widget.cryptoList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      appBar: AppBar(
        backgroundColor: blackColor,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          'کریپتو بازار',
          style: TextStyle(fontFamily: 'moraba'),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 12.0),
            _getTextField(),
            Expanded(child: _getCryptoList()),
          ],
        ),
      ),
    );
  }

  Future<void> getDataFromAPI() async {
    Response response = await Dio().get('https://api.coincap.io/v2/assets');
    List<dynamic> jsonMapsList = response.data['data'];
    setState(
      () {
        cryptoList =
            jsonMapsList.map<Crypto>((e) => Crypto.fromMapObject(e)).toList();
      },
    );
  }

  Widget _getCryptoList() {
    return RefreshIndicator(
      backgroundColor: Colors.white,
      displacement: 50,
      color: greenColor,
      strokeWidth: 3.0,
      edgeOffset: 5.0,
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      onRefresh: () async {
        getDataFromAPI();
      },
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: cryptoList!.length,
        itemBuilder: (context, index) {
          if (textEditingController.text.isEmpty) {
            return _getListTile(index);
          } else if (cryptoList![index]
              .name
              .contains(textEditingController.text)) {
            return _getListTile(index);
          } else
            return Container();
        },
      ),
    );
  }

  Widget _getListTile(int index) {
    return ListTile(
      title: Text(
        cryptoList![index].name,
        style: const TextStyle(color: greenColor),
      ),
      leading: SizedBox(
        width: 30.0,
        child: Center(
          child: Text(
            cryptoList![index].rank.toString(),
            style: const TextStyle(color: greyColor),
          ),
        ),
      ),
      subtitle: Text(
        cryptoList![index].symbol,
        style: const TextStyle(color: greyColor),
      ),
      trailing: SizedBox(
        width: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  cryptoList![index].priceUsd.toStringAsFixed(2),
                  style: const TextStyle(
                    color: greyColor,
                    fontSize: 15,
                  ),
                ),
                Text(
                  cryptoList![index].changePercent24Hr.toStringAsFixed(2),
                  style: TextStyle(
                    color: _getChangePercent24HrTextColor(index),
                  ),
                )
              ],
            ),
            const SizedBox(width: 8.0),
            _getTrendingIcon(index)
          ],
        ),
      ),
    );
  }

  Widget _getTextField() {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextField(
        textAlign: TextAlign.left,
        controller: textEditingController,
        cursorColor: greenColor,
        textAlignVertical: TextAlignVertical.center,
        style: const TextStyle(
          color: greenColor,
          fontSize: 20,
          fontFamily: 'moraba',
        ),
        decoration: InputDecoration(
          hintText: 'e.g:bitcoin',
          hintStyle: TextStyle(
            color: greenColor.withOpacity(0.5),
            fontFamily: 'moraba',
            fontSize: 18,
          ),
          labelText: 'جستجو',
          labelStyle: const TextStyle(
            color: redColor,
            fontFamily: 'moraba',
            fontSize: 15,
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
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

  Color _getChangePercent24HrTextColor(int index) {
    return cryptoList![index].changePercent24Hr > 0 ? greenColor : redColor;
  }
}
