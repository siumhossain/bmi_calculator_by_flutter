import 'package:flutter/material.dart';


const iconColor =  Color(0xFFFFFFFF);
const labelTextStyle = TextStyle(
    color: Color(0xFFbbbfca),
    fontSize: 20.0
);
class IconContent extends StatelessWidget {
  IconContent({this.icon,this.text});
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, size: 80.0,color: iconColor,),
        SizedBox(height: 15.0,),
        Text(text,style: labelTextStyle,),
      ],
    );
  }
}