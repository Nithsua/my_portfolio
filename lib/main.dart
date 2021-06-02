import 'package:flutter/material.dart';
import 'package:my_portfolio/model/author_model.dart';
import 'package:my_portfolio/view/index.dart';
import 'package:my_portfolio/model/theme_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: initAuthor(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ChangeNotifierProvider<AppTheme>(
              create: (context) => AppTheme(
                  MediaQueryData.fromWindow(WidgetsBinding.instance.window)
                              .platformBrightness ==
                          Brightness.light
                      ? ThemeMode.light
                      : ThemeMode.dark),
              child: Consumer<AppTheme>(builder: (context, appTheme, child) {
                return MaterialApp(
                  theme: ThemeData(
                    visualDensity: VisualDensity.adaptivePlatformDensity,
                    fontFamily: "BalsamiqSans",
                    iconTheme:
                        IconThemeData(color: Color.fromRGBO(37, 39, 52, 1)),
                    primaryColor: Color.fromRGBO(37, 39, 52, 1),
                    primarySwatch: Colors.grey,
                    accentColor: Color.fromRGBO(255, 194, 92, 1),
                    scaffoldBackgroundColor: Colors.white,
                    cardTheme: CardTheme(
                        color: Colors.white,
                        elevation: 20.0,
                        shadowColor: Colors.black38,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0))),
                    // primaryTextTheme: TextTheme(),
                  ),
                  darkTheme: ThemeData(
                    visualDensity: VisualDensity.adaptivePlatformDensity,
                    fontFamily: "BalsamiqSans",
                    iconTheme:
                        IconThemeData(color: Color.fromRGBO(234, 234, 236, 1)),
                    primaryColor: Color.fromRGBO(234, 234, 236, 1),
                    primarySwatch: Colors.grey,
                    accentColor: Color.fromRGBO(255, 194, 92, 1),
                    scaffoldBackgroundColor: Colors.black,
                    cardTheme: CardTheme(
                        color: Colors.grey[900],
                        elevation: 10.0,
                        // shadowColor: Colors.white38,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0))),
                  ),
                  themeMode: appTheme.currentTheme,
                  home: MainView(),
                );
              }),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
