import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Container(
//       alignment: Alignment.centerLeft,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center, // 정렬 기준 가운데, 중간 등등
//         mainAxisSize: MainAxisSize.max , // 가로 공간을 차지 할지 말지를 결정한다
//         crossAxisAlignment: CrossAxisAlignment.start, // ROW는 가로로 나열하는데 그걸 크로스하니 세로를 나타내는거다
//         children: <Widget>[
//             YellowBox(),
//             TallerYellowBox(),
//             YellowBox(),
//         ],
//       ),
//     );
//   }
// }

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // 정렬 기준 가운데, 중간 등등
        mainAxisSize: MainAxisSize.max, // 가로 공간을 차지 할지 말지를 결정한다
        //crossAxisAlignment: CrossAxisAlignment.center, // ROW는 가로로 나열하는데 그걸 크로스하니 세로를 나타내는거다
        children: <Widget>[
          SizedBox(
            child: YellowBox(),
            height: 200,
            width: 150,
          ),
          SizedBox(
            height: 30,
          ),
          TallerYellowBox(),
          YellowBox(),
        ],
      ),
    );
  }
}

class YellowBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.yellowAccent,
        border: Border.all(),
      ),
    );
  }
}

class TallerYellowBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.yellowAccent,
        border: Border.all(),
      ),
    );
  }
}
