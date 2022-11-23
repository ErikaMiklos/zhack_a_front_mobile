import 'package:flutter/material.dart';


class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("Details"),
        ),
        body: const Text("Details")
    );
  }
}