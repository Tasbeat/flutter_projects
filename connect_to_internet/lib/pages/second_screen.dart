import 'package:connect_to_internet/data/model/Crypto.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  List<Crypto>? cryptoList;
  SecondScreen({Key? key, this.cryptoList}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  List<Crypto>? cryptoList;
  @override
  void initState() {
    super.initState();
    cryptoList = widget.cryptoList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cryptoList!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Text(
                        cryptoList![index].name,
                        style: TextStyle(fontSize: 30),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
