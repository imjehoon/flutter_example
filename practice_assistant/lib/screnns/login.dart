import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size; // 화면 사이즈를 가져옴 ( 폰별로 다름 )
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('Firebase Login'),
        // ),
        body: Stack(
      alignment: Alignment.center, // 스택 가운데 정렬해줌
      children: <Widget>[
        Container(
          color: Colors.white,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center, // 가운데 정렬
          mainAxisAlignment: MainAxisAlignment.end, // 스택 아래로 변경
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              color: Colors.blue,
            ),
            Stack(
              children: <Widget>[
                _inputForm(size),
                _authButton(size),
              ],
            ),
            Container(
              height: size.height * 0.1,
            ),
            Text("Don't Have an Account? Create one2"),
            Container(
              height: size.height * 0.05,
            )
          ],
        )
      ],
    ));
  }

  Widget _authButton(Size size) => Positioned(
      left: size.width * 0.1,
      right: size.width * 0.1,
      bottom: 0,
      child: RaisedButton(
        child: Text("Login"),
        color: Colors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        onPressed: () {},
      ),
    );
 

  Widget _inputForm(Size size) {
    return Padding(
      padding: EdgeInsets.all(size.width * 0.05),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 6, // 그림자인듯
        child: Padding(
          padding: EdgeInsets.only(left: 12.0, right: 12, top: 12, bottom: 32),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      icon: Icon(Icons.account_circle), labelText: "email"),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Please input correct Email.";
                    }

                    return null;
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                      icon: Icon(Icons.vpn_key), labelText: "Password"),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Please input correct Password.";
                    }

                    return null;
                  },
                ),
                Container(
                  height: 8,
                ),
                Text("Forget Password"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
