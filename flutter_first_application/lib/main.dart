import 'package:flutter/material.dart';

void main() {
  var application = Application();
  runApp(application);
}

Widget getApplication() {
  return MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.green,
      body: getBody(),
    ),
  );
}

Widget getBody() {
  return SafeArea(
    child: Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.amber,
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.blue,
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.pink,
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.purple,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
/* TextButton(
          style: TextButton.styleFrom(
              primary: Colors.black, backgroundColor: Colors.pink),
          onPressed: () {
            print('ali');
          },
          child: Text('click me!'),
        )  */

/* return SafeArea(
    child: Row(
      //column / Row
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          flex: 50,
          child: Container(
            width: 100.0,
            height: 100.0,
            color: Colors.amber,
            margin: EdgeInsets.only(top: 20.0, left: 20.0),
            child: Image(
              image: AssetImage('images/flags.png'),
            ),
          ),
        ),
        Expanded(
          flex: 25,
          child: Container(
            width: 60.0,
            height: 60.0,
            color: Colors.red,
            margin: EdgeInsets.only(top: 20.0, left: 20.0),
            padding: EdgeInsets.all(8.0),
            child: Text('hello world2'),
          ),
        ),
        Expanded(
          flex: 25,
          child: Container(
            width: 60.0,
            height: 60.0,
            color: Colors.blue,
            margin: EdgeInsets.only(top: 20.0, left: 20.0),
            child: Text('hello world3'),
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
              primary: Colors.black, backgroundColor: Colors.pink),
          onPressed: () {
            print('ali');
          },
          child: Text('click me!'),
        )
      ],
    ),
  );
  ); */
//challenge 2(course way)
/* return SafeArea(
    child: Column(
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  color: Colors.amber,
                ),
              ),
              Expanded(
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  color: Colors.blue,
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  color: Colors.red,
                ),
              ),
              Expanded(
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  color: Colors.pink,
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  color: Colors.black,
                ),
              ),
              Expanded(
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  color: Colors.white,
                ),
              )
            ],
          ),
        )
      ],
    ), 

} */

//Image(image : NetworkImage('url'),)
//Image(image : AssetImage('path'),)
class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return getApplication();
  }
}

//define function for customize container and use it in column widget
 /* Widget setAndGetContainer(
    {required double width,
    required double height,
    required Color color,
    required double margin,
    required double padding,
    String? text,
    String? pathOrUrl}) {
  if (pathOrUrl != null && text != null) return Text("error");
  if (pathOrUrl != null) {
    if (pathOrUrl.startsWith('https')) {
      return Container(
        color: color,
        width: width,
        height: height,
        margin: EdgeInsets.all(margin),
        padding: EdgeInsets.all(padding),
        child: Center(
          child: Image(
            image: NetworkImage(pathOrUrl),
          ),
        ),
      );
    } else {
      return Container(
        color: color,
        width: width,
        height: height,
        margin: EdgeInsets.all(margin),
        padding: EdgeInsets.all(padding),
        child: Center(
          child: Image(
            image: AssetImage(pathOrUrl),
          ),
        ),
      );
    }
  } else if (text == null) {
    return Container(
      color: color,
      width: width,
      height: height,
      margin: EdgeInsets.all(margin),
      padding: EdgeInsets.all(padding),
    );
  } else {
    return Container(
      color: color,
      width: width,
      height: height,
      margin: EdgeInsets.all(margin),
      padding: EdgeInsets.all(padding),
      child: Center(
        child: Text(text),
      ),
    );
  }
} */
 
