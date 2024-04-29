import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizzatopia/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:pizzatopia/screens/auth/blocs/sign_in_bloc/sign_in_bloc.dart';

import 'screens/auth/views/welcome_screen.dart';
import 'screens/home/views/home_screen.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pizzatopia',
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.light(
            background: Colors.grey.shade200,
            onBackground: Colors.black,
            primary: Colors.blue,
            onPrimary: Colors.white,
          )),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
        if (state.status == AuthenticationStatus.authenticated) {
          return BlocProvider(
            create: (context) =>
                SignInBloc(context.read<AuthenticationBloc>().userRepository),
            child: const HomeScreen(),
          );
        } else {
          return const WelcomeScreen();
        }
      }),
    );
  }
}
