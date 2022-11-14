import 'package:flutter/material.dart';
import 'package:mvvm_sample/view_models/cryptolist_view_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var cryptolistViewmodel = CryptolistViewmodel();
  @override
  void initState() {
    cryptolistViewmodel.loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => cryptolistViewmodel,
        child: Consumer<CryptolistViewmodel>(
          builder: (context, value, child) {
            return getScaffold(value);
          },
        ),
      ),
    );
  }

  Scaffold getScaffold(CryptolistViewmodel cryptolistViewmodel) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Text(cryptolistViewmodel.cryptoList[index].name);
        },
        itemCount: cryptolistViewmodel.cryptoList.length,
      ),
    );
  }
}
