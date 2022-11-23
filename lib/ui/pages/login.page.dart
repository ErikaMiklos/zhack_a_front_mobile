import 'package:flutter/material.dart';
import 'package:zhack_a_front_mobile/ui/widgets/login.widget.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("Login"),
        ),
        body: const LoginWidget()
    );
  }
}