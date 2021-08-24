// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'dart:html' as html;

import 'package:url_launcher/url_launcher.dart';

class SocialButtons extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;

  SocialButtons({this.mainAxisAlignment});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        children: [
          SocialButton(
              url: 'https://twitter.com/nithsua',
              name: 'Twitter',
              icon: FontAwesomeIcons.twitter,
              padding: EdgeInsets.all(8.0)),
          SocialButton(
              url: 'https://www.linkedin.com/in/nivas-muthu/',
              name: 'LinkedIn',
              icon: FontAwesomeIcons.linkedin,
              padding: EdgeInsets.all(8.0)),
          SocialButton(
              url: 'https://github.com/Nithsua',
              name: 'Github',
              icon: FontAwesomeIcons.github,
              padding: EdgeInsets.all(8.0)),
        ],
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  final String url;
  final String name;
  final IconData icon;
  final EdgeInsets padding;

  SocialButton({this.url, this.name, this.icon, this.padding});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      onPressed: () async {
        // if (kIsWeb) {
        //   html.window.open(url, name);
        // } else
        if (await canLaunch(url)) {
          launch(url);
        } else {
          print('url not launchable');
        }
      },
      child: Padding(
        padding: padding,
        child: FaIcon(
          icon,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
