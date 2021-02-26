import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReusableCard(color: Colors.grey[850],),),
              Expanded(child: ReusableCard(color: Colors.grey[850]),),
            ],
          ),),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReusableCard(color: Colors.grey[850]),),
            ],
          ),),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReusableCard(color: Colors.grey[850]),),
              Expanded(child: ReusableCard(color: Colors.grey[850]),),
            ],
          ),),
        ],
      ),


    );
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
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
