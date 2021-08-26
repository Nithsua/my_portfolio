import 'package:flutter/material.dart';
import 'package:my_portfolio/model/author_model.dart';
import 'package:my_portfolio/widget/avatar.dart';
import 'package:my_portfolio/widget/showcase.dart';

class AboutView extends StatelessWidget {
  final double viewportWidth;
  final double responsiveTextSize;
  final double horizontalPadding;
  AboutView(
      {required this.viewportWidth,
      required this.horizontalPadding,
      required this.responsiveTextSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Hi👋",
            style: Theme.of(context)
                .textTheme
                .headline3
                ?.apply(color: Theme.of(context).primaryColor),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Avatar(
              responsiveTextSize: responsiveTextSize,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    authorModel.detailed.replaceAll('\\n', '\n'),
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(
              'assets/images/skillorbit.png',
              width: viewportWidth - horizontalPadding * 4,
              height: viewportWidth - horizontalPadding * 4,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'My Projects',
                      style: Theme.of(context).textTheme.headline5?.apply(
                          fontWeightDelta: 1, fontFamily: "BalsamiqSans"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: ShowCase(
                        horizontalPadding: horizontalPadding,
                        viewportWidth: viewportWidth,
                        responsivePrimarySizeFactor: responsiveTextSize,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
