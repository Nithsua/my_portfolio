import 'package:flutter/material.dart';
import 'package:my_portfolio/model/author_model.dart';
import 'package:my_portfolio/widget/avatar.dart';
import 'package:my_portfolio/widget/showcase.dart';
import 'dart:math' as math;

class AboutView extends StatefulWidget {
  final double viewportWidth;
  final double responsivePrimarySize;
  final double horizontalPadding;
  AboutView(
      {required this.viewportWidth,
      required this.horizontalPadding,
      required this.responsivePrimarySize});

  @override
  _AboutViewState createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  final Map<String, int> skills = {
    "Flutter": 8,
    "Dart": 7,
    "SwiftUI": 6,
    "Rustlang": 6,
    "Golang": 6,
    "MongoDB": 5,
    "Firebase": 6,
    "Python": 6,
    "C/C++": 7,
  };

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 10));
    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

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
              responsiveTextSize: widget.responsivePrimarySize,
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
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        ?.apply(fontSizeDelta: 7),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: widget.viewportWidth >= 1200
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: skillShowcase(context, _animationController,
                        skills, widget.viewportWidth, widget.horizontalPadding))
                : Column(
                    children: skillShowcase(
                        context,
                        _animationController,
                        skills,
                        widget.viewportWidth,
                        widget.horizontalPadding)),
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
                        horizontalPadding: widget.horizontalPadding,
                        viewportWidth: widget.viewportWidth,
                        responsivePrimarySizeFactor:
                            widget.responsivePrimarySize,
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

List<Widget> skillShowcase(
    BuildContext context,
    AnimationController animationController,
    Map<String, int> skills,
    double viewportWidth,
    double horizontalPadding) {
  return [
    Stack(
      alignment: Alignment.center,
      children: [
        AnimatedBuilder(
            animation: animationController,
            child: Image.asset(
              'assets/images/skillorbit.png',
              width: viewportWidth - horizontalPadding * 4,
              height: viewportWidth - horizontalPadding * 4,
            ),
            builder: (_, child) => Transform.rotate(
                  angle: animationController.value * 2 * math.pi,
                  child: child,
                )),
        CircleAvatar(
          radius: (viewportWidth - horizontalPadding * 4) / 12,
          child: Image.asset(
            'assets/images/nitsua.png',
          ),
        )
      ],
    ),
    Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Skills",
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.apply(fontWeightDelta: 2, fontFamily: "BalsamiqSans"),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
                  skillGen(context, skills, viewportWidth, horizontalPadding),
            )
          ],
        ),
      ),
    )
  ];
}

List<Widget> skillGen(BuildContext context, Map<String, int> skills,
    double viewportWidth, double horizontalPadding) {
  List<Widget> widgets = [];
  widgets = skills.entries
      .map((e) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  e.key,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                viewportWidth >= 1200
                    ? SizedBox(
                        width: (((viewportWidth - horizontalPadding * 2) -
                                (viewportWidth - horizontalPadding * 4))) *
                            e.value /
                            10,
                        child: Divider(
                          thickness: 5.0,
                          color: Theme.of(context).accentColor,
                        ),
                      )
                    : FractionallySizedBox(
                        widthFactor: e.value / 10,
                        child: Divider(
                          thickness: 5.0,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
              ],
            ),
          ))
      .toList();

  return widgets;
}
