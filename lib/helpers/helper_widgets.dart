import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_app/helpers/helper_func.dart';

Widget verticalspace(height) {
  return SizedBox(
    height: calculateSize(height),
  );
}

Widget horizontalspace(width) {
  return SizedBox(
    width: calculateSize(width),
  );
}

Widget appText(String tx, double size,
    {FontWeight weight = FontWeight.w400,
    topmargin = 0.0,
    bottommargin = 0.0,
    leftmargin = 0.0,
    rightmargin = 0.0,
    TextAlign align = TextAlign.center,
    Color color = Colors.black,
    double? space,
    double? height,
    bool softwrap = true,
    TextOverflow? overflow,
    TextDecoration? decoration,
    int? maxlines,
    FontStyle fontStyle = FontStyle.normal}) {
  return Container(
    margin: EdgeInsets.only(
        top: calculateSize(topmargin),
        bottom: calculateSize(bottommargin),
        left: calculateSize(leftmargin),
        right: calculateSize(rightmargin)),
    child: Text(
      tx,
      softWrap: softwrap,
      overflow: overflow,
      maxLines: maxlines,
      textAlign: align,
      style: TextStyle(
          decoration: decoration,
          fontSize: calculateSize(size),
          fontWeight: weight,
          fontStyle: fontStyle,
          color: color,
          letterSpacing: space,
          height: height),
    ),
  );
}

class cusView1 extends StatelessWidget {
  cusView1({
    super.key,
    required this.color,
    required this.iconColor,
    required this.icon,
    this.bordercolor = Colors.transparent,
    this.text,
  });

  Color color;
  IconData icon;
  Color iconColor;
  String? text;
  Color bordercolor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(calculateSize(4)),
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(calculateSize(8)),
              border: Border.all(color: bordercolor)),
          child: Icon(
            icon,
            size: calculateSize(30),
            color: iconColor,
          ),
        ),
        appText(text ?? "N/A", 12, topmargin: 5.0)
      ],
    );
  }
}

class cusView2 extends StatelessWidget {
  cusView2(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.day});

  String title;
  String subtitle;
  String day;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: calculateSize(20)),
      padding: EdgeInsets.symmetric(
          horizontal: calculateSize(12), vertical: calculateSize(16)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(calculateSize(8)),
        border: Border.all(color: Color(0xffe7e7f7)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appText(
                title,
                14,
                weight: FontWeight.w500,
              ),
              appText(
                subtitle,
                10,
              ),
            ],
          ),
          Spacer(),
          appText(
            title,
            14,
            weight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
