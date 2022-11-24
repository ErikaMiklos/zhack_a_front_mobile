import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zhack_a_front_mobile/bloc/theme.bloc.dart';
import 'package:zhack_a_front_mobile/ui/pages/root.view.dart';

import 'bloc/festivals.bloc.dart';
import 'bloc/github.events.bloc.dart';
import 'bloc/login.bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeBloc()),
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => FestivalsBloc()),
        BlocProvider(create: (context) => GitHubEventsBloc()),
      ],
      child: RootView(),
    );
  }
}
