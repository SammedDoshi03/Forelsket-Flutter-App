import 'package:flutter/material.dart';
import 'package:forelsket/UI/Profile/Screen/screen_controller.dart';
import 'package:forelsket/UI/Profile/data/local_providers.dart';
import 'package:forelsket/UI/Profile/theme_state.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomBarState()),
        ChangeNotifierProvider(create: (_) => ScreensState()),
        ChangeNotifierProvider(create: (_) => ThemeState()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: ScreenController(),
        ),
      ),
    );
  }
}
