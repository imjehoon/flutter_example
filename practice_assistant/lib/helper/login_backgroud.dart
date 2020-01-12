import 'package:flutter/material.dart';

class LoginBackground extends CustomPainter{


  LoginBackground({@required this.isJoin}); // 생성자에 {} <- 옵션 값 , @required는 필수 값이다~

  final bool isJoin;

  @override
  void paint(Canvas canvas, Size size) {
    // .. ? Paint paint2 = Paint();
    //      paint2.color = Colors.blue;
    // Paint 오브젝트를 생성하는데 그안에 컬러 값을 Clors.blue로 지정을 해주고 paint 변수에 넣어줘라
    Paint paint = Paint()..color = isJoin? Colors.red: Colors.blue;
    canvas.drawCircle(Offset(size.width*0.5,size.height*0.2), size.height*0.5, paint);
  }

  // 프레임이 새로 고칠때 같이 새로 고칠 것이냐?
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }

}