import 'package:flutter/material.dart';
import 'package:my_portfolio/model/theme_model.dart';
import 'package:my_portfolio/model/view_model.dart';
import 'package:my_portfolio/view/about_me.dart';
import 'package:my_portfolio/view/home.dart';
import 'package:my_portfolio/widget/social.dart';
import 'package:provider/provider.dart';

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double viewportWidth = MediaQuery.of(context).size.width;
    double responsiveTextSize;
    double horizontalPadding;

    // if (viewportWidth > 720 && viewportWidth < 1000) {
    //   horizontalPadding = 0.15 * viewportWidth;
    //   responsiveTextSize = 0.002 * MediaQuery.of(context).size.width;
    // } else
    if (viewportWidth > 1000) {
      horizontalPadding = 0.15 * viewportWidth;
      responsiveTextSize = 0.001 * MediaQuery.of(context).size.width;
    } else {
      horizontalPadding = 0.1 * viewportWidth;
      responsiveTextSize = 0.002 * MediaQuery.of(context).size.width;
    }
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => ViewModel(0),
        builder: (context, child) {
          return NestedScrollView(
            headerSliverBuilder: (context, isScrolled) => [
              SliverAppBar(
                elevation: 1.0,
                snap: true,
                pinned: true,
                floating: true,
                automaticallyImplyLeading: false,
                backgroundColor: isScrolled
                    ? Theme.of(context).cardTheme.color
                    : Theme.of(context).scaffoldBackgroundColor,
                title: Padding(
                  padding: EdgeInsets.only(left: horizontalPadding),
                  child: IconButton(
                    onPressed: () {
                      Provider.of<AppTheme>(context, listen: false)
                          .changeTheme();
                    },
                    icon: Icon(
                      Provider.of<AppTheme>(context).currentTheme ==
                              ThemeMode.light
                          ? Icons.nights_stay_outlined
                          : Icons.wb_sunny_outlined,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: () {
                        Provider.of<ViewModel>(context, listen: false)
                            .switchView(0);
                      },
                      child: Text(
                        "Home",
                        style: Theme.of(context).textTheme.headline5?.apply(
                              fontFamily: "BalsamiqSans",
                              fontSizeDelta: 2,
                              fontWeightDelta: 1,
                              color: Theme.of(context).primaryColor,
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: () {
                        Provider.of<ViewModel>(context, listen: false)
                            .switchView(3);
                      },
                      child: Text(
                        "Me",
                        style: Theme.of(context).textTheme.headline5?.apply(
                              fontFamily: "BalsamiqSans",
                              fontSizeDelta: 2,
                              fontWeightDelta: 1,
                              color: Theme.of(context).primaryColor,
                            ),
                      ),
                    ),
                  ),
                  SizedBox(width: horizontalPadding)
                ],
              )
            ],
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding, vertical: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(top: viewportWidth * 0.04),
                        child: viewCaller(
                            Provider.of<ViewModel>(context).currentView,
                            viewportWidth,
                            horizontalPadding,
                            responsiveTextSize),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: horizontalPadding, vertical: 20),
                        child: Column(
                          children: [
                            Text(
                              'Made with 💛, 😁, depression, anxiety using Flutter',
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'Nivas Muthu M G/Nithsua',
                            ),
                            SocialButtons(
                              mainAxisAlignment: MainAxisAlignment.center,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget viewCaller(int currentView, double viewportWidth,
    double horizontalPadding, double responsiveTextSize) {
  if (currentView == 0)
    return HomeView(
      viewportWidth: viewportWidth,
      horizontalPadding: horizontalPadding,
      responsiveTextSize: responsiveTextSize,
    );
  else
    return AboutView(
      viewportWidth: viewportWidth,
      horizontalPadding: horizontalPadding,
      responsivePrimarySize: responsiveTextSize,
    );
}
