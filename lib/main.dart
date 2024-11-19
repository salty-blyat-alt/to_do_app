import 'package:flutter/cupertino.dart';
import 'HomePage.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Flutter Demo',
      theme: CupertinoThemeData(
        primaryColor: Color(0xFF673AB7), // Deep Purple color
        barBackgroundColor:
            Color(0xFF512DA8), // Darker purple for the navigation bar
        textTheme: CupertinoTextThemeData(
          primaryColor: Color(0xFF673AB7), // Deep purple text color
        ),

        applyThemeToAll: true,
        brightness: Brightness.light, // Light theme
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
