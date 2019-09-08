import 'package:flutter/material.dart';

import '../styleguide/colors.dart';

const shadowColor = styleShadowColor;
const blurRadius = 10.0;
const spreadRadius = 5.0;
const offset = Offset(
  0, // horizontal, move right 10
  0, // vertical, move down 10
);

class BgShadow extends StatefulWidget {
  var color;

  BgShadow({@required this.color});
  @override
  _BgShadowState createState() => _BgShadowState();
}

class _BgShadowState extends State<BgShadow> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double maxWidth = constraints.maxWidth;
        double maxHeight = constraints.maxHeight;

        var sizeData = MediaQuery.of(context);

        var blockSizeW = sizeData.size.width.toDouble() / 100;
        var blockSizeH = sizeData.size.height.toDouble() / 100;

        var responsizeFix;

        if (sizeData.size.height < 700) {
          responsizeFix = blockSizeH.toDouble() * 5.5;
        } else {
          responsizeFix = 0.0;
        }

        return Stack(
          children: <Widget>[
            Positioned(
              top: maxHeight * 0.275 - (responsizeFix * 2),
              left: maxWidth * 0.4,
              // FIRST CIRCLE -------------------------------------------------
              child: Container(
                width: maxWidth,
                height: maxWidth,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(maxWidth),
                  boxShadow: [
                    BoxShadow(
                      color: shadowColor,
                      blurRadius: blurRadius,
                      spreadRadius: spreadRadius,
                      offset: offset,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: maxHeight * 0.5 - responsizeFix,
              left: maxWidth * 0.5 - (maxWidth * 0.25),
              // SECOND CIRCLE -------------------------------------------------
              child: Container(
                width: maxWidth * 0.5,
                height: maxWidth * 0.5,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(maxWidth),
                  boxShadow: [
                    BoxShadow(
                      color: shadowColor,
                      blurRadius: blurRadius,
                      spreadRadius: spreadRadius,
                      offset: offset,
                    ),
                  ],
                ),
              ),
            ),
            // THIRD CIRCLE -------------------------------------------------
            Positioned(
              top: maxHeight * 0.45 - responsizeFix,
              left: maxWidth * 0.05,
              child: Container(
                width: maxWidth * 0.5,
                height: maxWidth * 0.5,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(maxWidth),
                  boxShadow: [
                    BoxShadow(
                      color: shadowColor,
                      blurRadius: blurRadius,
                      spreadRadius: spreadRadius,
                      offset: offset,
                    ),
                  ],
                ),
              ),
            ),
            // FOURTH CIRCLE -------------------------------------------------
            Positioned(
              top: maxHeight * 0.41 - responsizeFix,
              left: maxWidth * -0.2,
              child: Container(
                width: maxWidth * 0.5,
                height: maxWidth * 0.5,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(maxWidth),
                  boxShadow: [
                    BoxShadow(
                      color: shadowColor,
                      blurRadius: blurRadius,
                      spreadRadius: spreadRadius,
                      offset: offset,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0 - responsizeFix,
              left: 0,
              child: Container(
                width: maxWidth,
                height: maxHeight * 0.6,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
