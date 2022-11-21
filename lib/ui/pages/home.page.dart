import 'package:flutter/material.dart';
import 'package:zhack_a_front_mobile/ui/widgets/carousel.widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Festivals en France"),),
      body: Column(
        children: const [
          SizedBox(height: 8,),
          CarouselWidget(),
        ],
      )
    );
  }
}