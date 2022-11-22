import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zhack_a_front_mobile/ui/widgets/carousel.widget.dart';

import '../../bloc/theme.bloc.dart';
import 'list.page.dart';
import 'login.page.dart';

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
        children: [
          const SizedBox(height: 20,),
          const CarouselWidget(),
          const SizedBox(height: 100,),
           Text("Bienvenu sur le site de Festivals en France !",
               textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline4,),
          const SizedBox(height: 80,),
          const Text("Please Log in:"),
          const SizedBox(height: 8,),
          ElevatedButton(
              child: const Text("Login"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              }
          ),
        ],
      )
    );
  }
}