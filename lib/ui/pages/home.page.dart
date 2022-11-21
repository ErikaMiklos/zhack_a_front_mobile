import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zhack_a_front_mobile/ui/widgets/carousel.widget.dart';

import '../../bloc/theme.bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Festivals en France"),
        actions: [
          IconButton(
              onPressed: (){
                context.read<ThemeBloc>().add(SwitchThemeEvent());
              },
              icon: const Icon(Icons.settings))
        ],
      ),
      body: Column(
        children: const [
          SizedBox(height: 8,),
          CarouselWidget(),
        ],
      )
    );
  }
}