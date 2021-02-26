import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.color,this.iconContent});
  final Color color;
  final Widget iconContent;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: iconContent,
      height: 200.0,
      width: 175.0,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}