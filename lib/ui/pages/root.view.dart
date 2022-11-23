import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/theme.bloc.dart';
import '../../model/festivals.model.dart';
import 'details.page.dart';
import 'home.page.dart';
import 'listfestivals.page.dart';
import 'login.page.dart';


class RootView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc,ThemeState>(
        builder: (context,state){
          return MaterialApp(
            theme: state.themeData,
            routes: {
              "/": (context) => const HomePage(),
              "/login": (context) => const LoginPage(),
              "/festivals": (context) => const ListFestivalsPage(),
            },
            initialRoute: "/",
          );
        }
    );
  }
}