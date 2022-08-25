import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              getData();
            },
            child: const Text('Click Me!'),
          ),
        ),
      ),
    );
  }
}

getData() async {
  var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
  Response response = await get(uri);
  print(response.body);
}
