import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:practice_assistant/data/join_or_login.dart';
import 'package:practice_assistant/helper/login_backgroud.dart';
import 'package:practice_assistant/screnns/main_page.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size; // 화면 사이즈를 가져옴 ( 폰별로 다름 )
    return Scaffold(
        body: Stack(
      alignment: Alignment.center, // 스택 가운데 정렬해줌
      children: <Widget>[
        CustomPaint(
          size: size,
          painter:
              LoginBackground(isJoin: Provider.of<JoinOrLogin>(context).isJoin),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center, // 가운데 정렬
          mainAxisAlignment: MainAxisAlignment.end, // 스택 아래로 변경
          children: <Widget>[
            _logoImage,
            Stack(
              children: <Widget>[
                _inputForm(size),
                _authButton(size),
              ],
            ),
            Container(
              height: size.height * 0.1,
            ),
            Consumer<JoinOrLogin>(
              builder: (context, joinOrLogin, child) => GestureDetector(
                child: Text(
                  joinOrLogin.isJoin
                      ? "Already Have an Account? Sign in"
                      : "Don't Have an Account? Create one",
                  style: TextStyle(
                      color: joinOrLogin.isJoin ? Colors.red : Colors.blue),
                ),
                onTap: () {
                  // 익명 함수
                  // 외부에 void textBox() { } 선언 해도 됨
                  // JoinOrLogin joinOrLogin = Provider.of<JoinOrLogin>(context, listen: false);
                  // joinOrLogin.toggle();
                  joinOrLogin.toggle();
                },
              ),
            ),
            Container(
              height: size.height * 0.05,
            )
          ],
        )
      ],
    ));
  }

  void _register(BuildContext context) async {
    final AuthResult result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
    final FirebaseUser user = result.user;

    if( user == null) {
      final snackBar = SnackBar(content: Text('Please try again later'),);

      Scaffold.of(context).showSnackBar(snackBar);
    }

    //Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage(email: user.email)));
  }

  void _login(BuildContext context) async {
    final AuthResult result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
    final FirebaseUser user = result.user;

    if( user == null) {
      final snackBar = SnackBar(content: Text('Please try again later'),);

      Scaffold.of(context).showSnackBar(snackBar);
    }

    //Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage(email: user.email)));
  }

  Widget get _logoImage => Expanded(
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 24, right: 24),
          child: FittedBox(
            fit: BoxFit.contain,
            child: CircleAvatar(
              backgroundImage: NetworkImage("https://picsum.photos/200"),
            ),
          ),
        ),
      );

  Widget _authButton(Size size) => Positioned(
        left: size.width * 0.1,
        right: size.width * 0.1,
        bottom: 0,
        child: SizedBox(
          height: 50,
          child: Consumer<JoinOrLogin>(
            builder: (context, joinOrLogin, child) => RaisedButton(
              child: Text(
                joinOrLogin.isJoin?"Join":"Login",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              color: joinOrLogin.isJoin? Colors.red:Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  joinOrLogin.isJoin? _register(context): _login(context);
                }
              },
            ),
          ),
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
                  obscureText: true,
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
                Consumer<JoinOrLogin>(
                  builder: (context, value, child) => Opacity(
                      opacity: value.isJoin ? 0 : 1,
                      child: Text("Forget Password")),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
