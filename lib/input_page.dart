import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';

//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
const bottomContainerHeight = 80.0;
const activeCardColor = Color(0xFF222831);
const inactiveCardColor = Color(0xFF30475e);
const bottomContainerColor = Color(0xFFf05454);
const iconColor =  Color(0xFFFFFFFF);
Gender selectedGender;

enum Gender{
  male,
  female,
}

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
              Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: ReusableCard(
                    color: selectedGender == Gender.male ? activeCardColor : inactiveCardColor,
                    iconContent: IconContent(icon: FontAwesomeIcons.mars,text:'MALE'),
              ),
                  )
                ,),
              Expanded(child: GestureDetector(
                onTap: (){
                  //print('touch female');
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                child: ReusableCard(color: selectedGender == Gender.female ? activeCardColor : inactiveCardColor,
                iconContent: IconContent(icon: FontAwesomeIcons.venus,text: 'FEMALE',)
                  ,),
              ),
              ),
            ],
          ),),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReusableCard(color: activeCardColor),),
            ],
          ),),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReusableCard(color: activeCardColor),),
              Expanded(child: ReusableCard(color: activeCardColor),),
            ],
          ),),
          Container(
            color: bottomContainerColor,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomContainerHeight,
          ),
        ],
      ),


    );
  }
}




