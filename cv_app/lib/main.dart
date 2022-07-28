import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _getApplication();
  }

  Widget _getApplication() {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'vazir'),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: _getAppBar(),
        body: SafeArea(
          child: _getBody(),
        ),
      ),
    );
  }

  PreferredSizeWidget _getAppBar() {
    return AppBar(
      backgroundColor: Colors.blue,
      elevation: 0,
      title: Center(
        child: Text('رزومه من'),
      ),
    );
  }

  Widget _getBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _getHeader(),
          _getIconsRow(),
          _getSkillLabels(),
          SizedBox(
            height: 12.0,
          ),
          _getResume(),
        ],
      ),
    );
  }

  Widget _getHeader() {
    return Column(
      children: [
        SizedBox(height: 20),
        CircleAvatar(
          backgroundColor: Colors.blue[400],
          child: IconButton(
            iconSize: 40,
            color: Colors.black,
            onPressed: () {},
            icon: FaIcon(FontAwesomeIcons.user),
          ),
          radius: 40,
        ),
        SizedBox(height: 20),
        Text(
          'علی علیرحیمی',
          style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 15.0,
              color: Colors.blue[900]),
        ),
      ],
    );
  }

  Widget _getIconsRow() {
    return Wrap(
      runSpacing: 20.0,
      spacing: 30.0,
      alignment: WrapAlignment.center,
      children: [
        IconButton(
          iconSize: 20,
          onPressed: () {},
          icon: FaIcon(FontAwesomeIcons.instagram),
        ),
        IconButton(
          iconSize: 20,
          onPressed: () {},
          icon: FaIcon(FontAwesomeIcons.telegram),
        ),
        IconButton(
          iconSize: 20,
          onPressed: () {},
          icon: FaIcon(FontAwesomeIcons.github),
        ),
        IconButton(
          iconSize: 20,
          onPressed: () {},
          icon: FaIcon(FontAwesomeIcons.linkedin),
        ),
      ],
    );
  }

  Widget _getSkillLabels() {
    var names = ['flutter', 'git', 'kotlin', 'wordpress', 'java', 'android'];
    var images = [
      'flutter1',
      'git1',
      'kotlin1',
      'wordpress1',
      'java1',
      'android1'
    ];
    return Wrap(
      alignment: WrapAlignment.center,
      runSpacing: 5.0,
      spacing: 5.0,
      children: [
        //for(var names in names)
        for (int index = 0; index < names.length; index++)
          Card(
            elevation: 15,
            shadowColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  width: 40.0,
                  height: 40.0,
                  child: Image(
                    image: AssetImage('images/${images[index]}.png'),
                  ),
                ),
                Padding(
                  child: Text(names[index]),
                  padding: EdgeInsets.all(5),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _getResume() {
    var resumeContext = [
      'متن 1',
      'متن 2',
      'متن 3',
      'متن 4',
      'متن 5',
      'متن 6',
      'متن 7',
      'متن 8',
      'متن 9',
      'متن 10'
    ];
    return Column(
      children: [
        Container(
          color: Colors.blue[400],
          width: double.infinity,
          child: Text(
            'سابقه کاری',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          color: Colors.grey[300],
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  width: double.infinity,
                ),
                for (var index in resumeContext)
                  Text(
                    index,
                    textDirection: TextDirection.rtl,
                  ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
  /* Wrap(
      spacing: 15,
      alignment: WrapAlignment.center,
      children: [
        getFlutterCard(),
        getFlutterCard(),
        getFlutterCard(),
        getFlutterCard(),
      ],
    ); */

  /* Widget getFlutterCard() {
    return Card(
      elevation: 15,
      shadowColor: Colors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            width: 60.0,
            height: 60.0,
            child: Image(
              image: AssetImage('images/flutter.png'),
            ),
          ),
          Padding(
            child: Text('flutter'),
            padding: EdgeInsets.all(5),
          ),
        ],
      ),
    );
  } */

