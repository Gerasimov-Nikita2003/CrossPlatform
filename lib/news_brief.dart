import 'package:flutter/material.dart';
import 'package:myaplication/app/app.dart';
//import 'package:news_brief/app/theme/theme_data.dart';

class MyApk extends StatelessWidget {
  const MyApk({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'IMDB Movies',
      theme: AppTheme.lightTheme,
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      debugShowCheckedModeBanner: false,
    );
  }
}
