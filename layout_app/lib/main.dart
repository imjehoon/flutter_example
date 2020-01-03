import 'package:flutter/material.dart';

void main() => runApp(MyApp());

var stars = Row(
  mainAxisSize: MainAxisSize.min,
  children: [
    Icon(Icons.star, color: Colors.green[500]),
    Icon(Icons.star, color: Colors.green[500]),
    Icon(Icons.star, color: Colors.green[500]),
    Icon(Icons.star, color: Colors.green[500]),
    Icon(Icons.star, color: Colors.black),
  ],
);

final descTextStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w800,
  fontFamily: 'Roboto',
  letterSpacing: 0.5,
  fontSize: 18,
  height: 2,
);

final iconList = DefaultTextStyle.merge(
    style: descTextStyle,
    child: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                Icon(Icons.kitchen, color: Colors.green[500]),
                Text('PREP:'),
                Text('25 min'),
              ],
            ),
            Column(
              children: <Widget>[
                Icon(Icons.timer, color: Colors.green[500]),
                Text('COOK:'),
                Text('1 min'),
              ],
            ),
            Column(
              children: <Widget>[
                Icon(Icons.restaurant, color: Colors.green[500]),
                Text('FEEDS:'),
                Text('4-6'),
              ],
            )
          ],
        )));

final titleText = Container(
  padding: EdgeInsets.all(20),
  child: Text('Strwberdfdfddddddry Pavlova'),
);

final subitleText = Container(
    padding: EdgeInsets.all(20),
    child: Text(
        '이건서브타이틀이건서브타이틀이건서브타이틀이건서브타이틀이건서브타이틀이건서브타이틀이건서브타이틀이건서브타이틀이건서브타이틀이건서브타이틀이건서브타이틀이건서브타이틀이건서브타이틀이건서브타이틀이건서브타이틀이건서브타이틀이건서브타이틀'));

final ratings = Container(
  padding: EdgeInsets.all(20),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      stars, // only static member
      Text(
        '170 Reviews',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w800,
          fontFamily: 'Roboto',
          letterSpacing: 0.5,
          fontSize: 20,
        ),
      )
    ],
  ),
);

// 수평 이미지 칠드런
final imageRow = Container(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 가로로 정렬
    children: <Widget>[
      Expanded(
        child: Image.asset('images/1.jpg'),
      ),
      Expanded(
        child: Image.asset('images/2.jpg'),
      ),
      Expanded(
        child: Image.asset('images/3.jpg'),
      )
    ],
  ),
);

final verticalImageRow = Container(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Expanded(
        child: Image.asset('images/4.jpg'),
      ),
      Expanded(
        child: Image.asset('images/5.jpg'),
      ),
      Expanded(
        child: Image.asset('images/6.jpg'),
      )

    ],
  ),
);

class MyApp extends StatelessWidget {
  final leftColumn = Container(
    padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
    child: Column(
      children: [
        titleText,
        subitleText,
        ratings,
        iconList,
        imageRow,
        //verticalImageRow,
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
          appBar: AppBar(
            title: Text('flutter layout demo'),
          ),
          body: Row(
            children: <Widget>[
              Flexible(
                child: Card(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                      
                        width: 400,
                        child: leftColumn,
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
