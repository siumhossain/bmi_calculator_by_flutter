import 'package:flutter/material.dart';
import '../component/bottom_button.dart';
import '../component/constant.dart';
import '../component/reusable_card.dart';

class ResultPage extends StatelessWidget {
  ResultPage({@required this.bmiResult,@required this.resultText,@required this.suggestion});
  final bmiResult;
  final resultText;
  final suggestion;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
         Expanded(child: Container(
           padding: EdgeInsets.all(15.0),
           child: Text('Your BMI Result',
             style: kResultTitle,
           ),
         ),) ,
          Expanded(
            flex: 7,
            child: ReusableCard(
            color: kActiveCardColor,
            iconContent: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(resultText,style: kResultHeadline,),
                Text(bmiResult,style: kResultValue,),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(suggestion,textAlign: TextAlign.center,style: kSuggestion,),
                ),
              ],
            ),
          ),),
          BottomButton(title: 'Re-Calculate',onPressed: (){
            Navigator.pop(context);
          },)
        ],
      ),
    );
  }
}
