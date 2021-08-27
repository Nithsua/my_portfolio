import 'package:flutter/material.dart';
import 'package:my_portfolio/model/author_model.dart';
import 'package:my_portfolio/model/view_model.dart';
import 'package:my_portfolio/widget/avatar.dart';
import 'package:my_portfolio/widget/social.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  final double viewportWidth;
  final double responsiveTextSize;
  final double horizontalPadding;
  HomeView(
      {required this.viewportWidth,
      required this.horizontalPadding,
      required this.responsiveTextSize});

  @override
  Widget build(BuildContext context) {
    return viewportWidth > 1000
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  headerBuilder(
                      context,
                      authorModel.publicName,
                      authorModel.subHead1,
                      authorModel.subHead2,
                      CrossAxisAlignment.start,
                      viewportWidth,
                      horizontalPadding),
                  Avatar(
                    responsiveTextSize: responsiveTextSize,
                  ),
                ],
              ),
              bodyBuilder(context, authorModel.intro, viewportWidth),
            ],
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Avatar(
                responsiveTextSize: responsiveTextSize,
              ),
              headerBuilder(
                  context,
                  authorModel.publicName,
                  authorModel.subHead1,
                  authorModel.subHead2,
                  CrossAxisAlignment.center,
                  viewportWidth,
                  horizontalPadding),
              bodyBuilder(context, authorModel.intro, viewportWidth),
            ],
          );
  }
}

Widget headerBuilder(
    BuildContext context,
    String publicName,
    String subHead1,
    String subHead2,
    CrossAxisAlignment crossAxisAlignment,
    double viewportWidth,
    double horizontalPadding) {
  return Column(
    crossAxisAlignment: crossAxisAlignment,
    children: [
      Text(publicName,
          style: Theme.of(context).textTheme.headline3?.apply(
                fontFamily: "BalsamiqSans",
                fontWeightDelta: 2,
                fontSizeDelta: 10,
                color: Theme.of(context).primaryColor,
              )),
      Padding(
        padding: EdgeInsets.symmetric(vertical: viewportWidth * 0.0001),
        child: SizedBox(
          width: horizontalPadding,
          child: Divider(
            thickness: viewportWidth * 0.005,
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
      Text(
        subHead1,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline6?.apply(fontSizeDelta: 7),
      ),
      Text(
        subHead2,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline6?.apply(fontSizeDelta: 7),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: viewportWidth * 0.0001),
        child: SocialButtons(
          mainAxisAlignment: crossAxisAlignment == CrossAxisAlignment.center
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
        ),
      ),
    ],
  );
}

Widget bodyBuilder(
  BuildContext context,
  String intro,
  double viewportWidth,
) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 50.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: Text(
            "->  Intro",
            style:
                Theme.of(context).textTheme.headline6?.apply(fontSizeDelta: 5),
          ),
        ),
        Text(
          "Hi👋",
          style: Theme.of(context)
              .textTheme
              .headline4
              ?.apply(color: Theme.of(context).primaryColor),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: Text(
            authorModel.intro.replaceAll('\\n', '\n'),
            style:
                Theme.of(context).textTheme.subtitle1?.apply(fontSizeDelta: 10),
          ),
        ),
        TextButton(
          onPressed: () {
            Provider.of<ViewModel>(context, listen: false).switchView(3);
          },
          child: Text(
            "More bout Me    ->",
            style: TextStyle(color: Theme.of(context).accentColor),
          ),
        ),
      ],
    ),
  );
}
