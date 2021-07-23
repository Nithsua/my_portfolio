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
      {@required this.viewportWidth,
      @required this.horizontalPadding,
      @required this.responsiveTextSize});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      if (viewportWidth > 1000) {
        return Column(
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
                    responsiveTextSize,
                    viewportWidth,
                    horizontalPadding),
                Avatar(
                  responsiveTextSize: responsiveTextSize,
                ),
              ],
            ),
            bodyBuilder(context, authorModel.intro, responsiveTextSize,
                viewportWidth, horizontalPadding),
          ],
        );
      } else {
        return Column(
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
                responsiveTextSize,
                viewportWidth,
                horizontalPadding),
            bodyBuilder(context, authorModel.intro, responsiveTextSize,
                viewportWidth, horizontalPadding),
          ],
        );
      }
    });
  }
}

Widget headerBuilder(
    BuildContext context,
    String publicName,
    String subHead1,
    String subHead2,
    CrossAxisAlignment crossAxisAlignment,
    double responsiveTextSize,
    double viewportWidth,
    double horizontalPadding) {
  return Column(
    crossAxisAlignment: crossAxisAlignment,
    children: [
      Text(
        publicName,
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: 31 * responsiveTextSize,
          fontFamily: "BalsamiqSans",
          fontWeight: FontWeight.w700,
        ),
      ),
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
        style: TextStyle(
          fontSize: responsiveTextSize * 16,
          color: Theme.of(context).primaryColor,
        ),
      ),
      Text(
        subHead2,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: responsiveTextSize * 16,
          color: Theme.of(context).primaryColor,
        ),
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

Widget bodyBuilder(BuildContext context, String intro,
    double responsiveTextSize, double viewportWidth, double horizontalPadding) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: viewportWidth * 0.05),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: Text(
            "->  Intro",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 16 * responsiveTextSize,
            ),
          ),
        ),
        Text(
          "Hi👋",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 27 * responsiveTextSize,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: Text(
            authorModel.intro.replaceAll('\\n', '\n'),
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 16 * responsiveTextSize,
            ),
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
