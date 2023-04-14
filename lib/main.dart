import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorials/favourite_provider.dart';
import 'package:provider_tutorials/provider/auth_provider.dart';
import 'package:provider_tutorials/provider/count_&_time_provider.dart';
import 'package:provider_tutorials/slider_screen.dart';
import 'package:provider_tutorials/provider/slider_provider.dart';
import 'package:provider_tutorials/stl_to_stf.dart';

import 'favourite_main_screen.dart';
import 'home_screen.dart';
import 'login_with_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SliderProvider()),
        ChangeNotifierProvider(create: (_) => CountAndTimeProvider()),
        ChangeNotifierProvider(create: (_) => FavouriteProviderClass()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MaterialApp(
        home: LoginScreen(),
      ),
    );
  }
}
