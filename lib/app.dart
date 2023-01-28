import 'package:flutter/cupertino.dart';
import 'package:language_gym_english/constants.dart' as constants;
import 'package:language_gym_english/screens/app_home_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: constants.appTitle,
      theme: CupertinoThemeData(
        brightness: Brightness.light,
        primaryColor: CupertinoColors.activeBlue,
      ),
      home: Directionality(
        textDirection: TextDirection.ltr,
        child: AppHomeScreen(),
      ),
    );
  }
}
