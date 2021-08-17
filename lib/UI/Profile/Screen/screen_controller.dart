import 'package:flutter/material.dart';
import 'package:forelsket/UI/Profile/Screen/home_screen.dart';
import 'package:forelsket/UI/Profile/Screen/settings_screen.dart';
import 'package:forelsket/UI/Profile/data/local_providers.dart';
import 'package:forelsket/UI/Profile/theme_state.dart';
import 'package:forelsket/UI/Profile/widgets/navigation_bar.dart';
import 'package:provider/provider.dart';

class ScreenController extends StatelessWidget {
  const ScreenController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bottomBarState = Provider.of<BottomBarState>(context);
    final screensState = Provider.of<ScreensState>(context);
    final themeState = Provider.of<ThemeState>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Forelsket',
      theme: themeState.currentTheme,
      home: Scaffold(
        body: Stack(
          children: [
            PageView(
              controller: screensState.pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                const HomeScreen(),
                const SettingsScreen(),
              ],
            ),
            NavigationBar(
              showBar: bottomBarState.showBottomBar,
              selectedIndex: screensState.page,
            ),
          ],
        ),
      ),
    );
  }
}
