import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../component/reusable_card.dart';
import '../component/icon_content.dart';
import '../component/constant.dart';
import 'result_page.dart';
import '../component/calculate.dart';
import '../component/bottom_button.dart';
import '../component/round_icon_button.dart';
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
  int age = 18;
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
                  Text('HEIGHT',style: kLabelTextStyle,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(height.toString(),style: kNumberTextStyle,),
                      Text('cm',style: kLabelTextStyle,),
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
                    Text('WEIGHT',style: kLabelTextStyle,),
                    Text(weight.toString(),style: kNumberTextStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(icon: FontAwesomeIcons.minus,iconColor: Colors.white,onPressed: (){
                          setState(() {
                            weight--;
                          });
                        },),
                        SizedBox(width: 6.0,),
                        RoundIconButton(icon: FontAwesomeIcons.plus,iconColor: Colors.white,
                          onPressed: (){
                          setState(() {
                            weight++;
                          });
                          },
                        ),
                      ],
                    ),

                  ],
                ),
              ),),
              Expanded(child: ReusableCard(color: kActiveCardColor,
                iconContent: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('AGE',style: kLabelTextStyle,),
                  Text(age.toString(),style: kNumberTextStyle,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundIconButton(icon: FontAwesomeIcons.minus,iconColor: Colors.white,onPressed: (){
                        setState(() {
                          age--;
                        });
                      },),
                      SizedBox(width: 6.0,),
                      RoundIconButton(icon: FontAwesomeIcons.plus,iconColor: Colors.white,
                        onPressed: (){
                          setState(() {
                            age++;
                          });
                        },
                      ),
                    ],
                  ),

                ],
              ),),),
            ],
          ),),
          BottomButton(title: 'CALCULATE',onPressed: (){
            Calculate calc = Calculate(height: height,weight: weight);
            Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(
              bmiResult: calc.calculateBmi(),
              resultText: calc.getResult(),
              suggestion: calc.suggestion(),
            )));
          },),
        ],
      ),


    );
  }
}








