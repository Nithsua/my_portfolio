import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final double responsiveTextSize;

  Avatar({required this.responsiveTextSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: responsiveTextSize * 51 * 2.5,
      child: Stack(
        children: [
          Positioned(
            left: responsiveTextSize * 51 / 2,
            child: CircleAvatar(
              backgroundColor: Theme.of(context).accentColor,
              radius: responsiveTextSize * 51,
            ),
          ),
          CircleAvatar(
            backgroundColor: Theme.of(context).accentColor,
            radius: responsiveTextSize * 51,
            child: Image.asset('assets/images/nitsua.png'),
          ),
        ],
      ),
    );
  }
}
