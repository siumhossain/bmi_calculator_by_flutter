import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constant.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  int height = 180;
  int weight = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                  child: ReusableCard(
                    onPressed: (){
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                  color: selectedGender == Gender.male ? kActiveCardColor : kInactiveCardColor,
                  iconContent: IconContent(icon: FontAwesomeIcons.mars,text:'MALE'),
              )
                ,),
              Expanded(child: ReusableCard(
                onPressed: (){
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                color: selectedGender == Gender.female ? kActiveCardColor : kInactiveCardColor,
              iconContent: IconContent(icon: FontAwesomeIcons.venus,text: 'FEMALE',)
                ,),
              ),
            ],
          ),),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReusableCard(
                color: kActiveCardColor,
                iconContent: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('HEIGHT',style: labelTextStyle,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(height.toString(),style: kNumberTextStyle,),
                      Text('cm',style: labelTextStyle,),
                    ],
                  ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    inactiveTrackColor: Color(0xFF30475e),
                    activeTrackColor: Colors.white,
                    overlayColor: Color(0x29ff2e63),
                    thumbColor: kBottomContainerColor,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 16.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 25.0),

                  ),
                  child: Slider(value: height.toDouble(),
                      min: 120,
                      max: 220,
                      onChanged: (double heightValue){
                        setState(() {
                          height = heightValue.round();
                        });

                  }),
                ),
                ],
              ),),),
            ],
          ),),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReusableCard(color: kActiveCardColor,
                iconContent: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('WEIGHT',style: labelTextStyle,),
                    Text(weight.toString(),style: kNumberTextStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(icon: FontAwesomeIcons.plus,iconColor: Colors.white,onPressed: (){
                          setState(() {
                            weight++;
                          });
                        },),
                        SizedBox(width: 6.0,),
                        RoundIconButton(icon: FontAwesomeIcons.minus,iconColor: Colors.white,
                          onPressed: (){
                          setState(() {
                            weight--;
                          });
                          },
                        ),
                      ],
                    ),

                  ],
                ),
              ),),
              Expanded(child: ReusableCard(color: kActiveCardColor),),
            ],
          ),),
          Container(
            color: kBottomContainerColor,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: kBottomContainerHeight,
          ),
        ],
      ),


    );
  }
}
class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon,this.iconColor,this.onPressed});
  final IconData icon;
  final Color iconColor;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon,color: iconColor,),
        constraints: BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0,
        ),
        onPressed:onPressed,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      elevation: 5.0,
    );
  }
}





