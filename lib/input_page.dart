import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import "package:font_awesome_flutter/font_awesome_flutter.dart"; 
import "icon_content.dart"; 
import "reusable_cart.dart"; 
import "constants.dart"; 
import "bottom_button.dart"; 
import "round_icon_button.dart"; 
import "calculator_brain.dart"; 

enum Gender {
  male, 
  female, 
}

class InputPage extends StatefulWidget {
 @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender; 
  int height = 180; 
  int weight  = 60; 
  int age  = 20; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: Text("BMI CALCULATOR"), 
        ),
        body:  Column( 
            children: <Widget>[ 

              // First Row
               Expanded (
                 child:Row(
                   children:  <Widget>[ 
                     Expanded (
                      child: ReusableCard(
                        onPress: (){ 
                            setState(() {
                             selectedGender= Gender.male;
                        }); 
                       }, 

                      colour:selectedGender == Gender.male? kActiveCardColour:kInactiveCardColour,
                      cardChild: IconContent(
                              label:"Man", 
                              icon: FontAwesomeIcons.mars)
                      ),
                      ), 
                    
                    Expanded (
                        child: ReusableCard(
                         onPress: () { 
                              setState (() {
                                selectedGender=Gender.female; 
                         }); 
                       }, 
                       colour:selectedGender == Gender.female?kActiveCardColour:kInactiveCardColour,
                       cardChild: IconContent(
                              label:"female",
                              icon: FontAwesomeIcons.venus))),

                    ], 
               )), 

              // Middle
                    Expanded (child: ReusableCard(colour:kActiveCardColour, 
                              cardChild: Column( 
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                        "HEIGHT",
                                        style:kLabelTextStyle),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.baseline,
                                        textBaseline: TextBaseline.alphabetic,
                                        children: <Widget>[ 

                                            Text (
                                                  height.toString(), 
                                                  style: kNumberTextStyle, 
                                              ), 
                                              Text(
                                                "cm",
                                                  style:kLabelTextStyle, 
                                              )
                                        ],
                                        ),
                                        SliderTheme( 
                                        data: SliderTheme.of(context).copyWith(
                                          activeTrackColor: Colors.white,
                                          thumbColor: Color(0xFFEB1555), 
                                          overlayColor: Color(0x29EB1555),
                                          inactiveTrackColor: Color(0xFF8D8E98),
                                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                                          overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0), 
                                        ),
                                        child: Slider(  
                                            value: height.toDouble(), 
                                            min: 120.0, 
                                            max:220.0, 
                                            activeColor: Color(0xFFEB1555),
                                            onChanged: (double newValue) {
                                              setState(() {
                                                height = newValue.round(); 

                                              });  
                                            },
                                        ), 
                                        ),
                                      ],
                              ),                      
                               )),

             // Third row 
                    Expanded (child:Row(children: <Widget>[
                    Expanded (child: 
                        ReusableCard(
                          colour:kActiveCardColour, 
                          cardChild: Column ( 
                            mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget> [ 
                                  Text("WEIGHT", 
                                        style: kLabelTextStyle, 
                                      ), 
                                  Text ( 
                                    weight.toString(), 
                                    style:kNumberTextStyle, 
                                  ),
                                  
                                  Row ( 
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[ 
                                        RoundIconButton(
                                          icon: FontAwesomeIcons.minus,
                                          onPressed: () {
                                            setState(() {
                                              weight --;
                                            }); 
                                          } 
                                         ), 

                                SizedBox( 
                                    width:10.0, 
                                  ), 

                                        RoundIconButton(
                                          icon:FontAwesomeIcons.plus, 
                                          onPressed: () {
                                            setState(() {
                                              weight ++;
                                            });
                                          }
                                          ) 
                                    ],
                                  ),
                            ],  
                          ),  
                          )
                          ),
                      // 2nd box from the row
                      Expanded (child: 
                        ReusableCard(
                          colour:kActiveCardColour, 
                          cardChild: Column ( 
                            mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget> [ 
                                  Text("AGE", 
                                        style: kLabelTextStyle, 
                                      ), 

                                  Text ( 
                                    age.toString(), 
                                    style:kNumberTextStyle, 
                                  ),
                                  
                                  Row ( 
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[ 
                                        RoundIconButton(
                                          icon: FontAwesomeIcons.minus,
                                          onPressed: () {
                                            setState(() {
                                              age --;
                                            }); 
                                          } 
                                         ), 

                                SizedBox( 
                                    width:10.0, 
                                  ), 

                                        RoundIconButton(
                                          icon:FontAwesomeIcons.plus, 
                                          onPressed: () {
                                            setState(() {
                                              age ++;
                                            });
                                          }
                                          ) 
                                    ],
                                  ),
                            ],  
                          ),  
                          )
                          )
                    ],
             )),

              // Container de abajo
               BottomButton(
                  buttonTitle: "CALCULATE",
                  onTap:() {
                    CalculatorBrain calc = CalculatorBrain(height:height, weight:weight); 

                    Navigator.push(context, 
                        MaterialPageRoute(builder:(context)=>ResultsPage(
                        bmiResult: calc.calculateBMI(),// it's need to start with this one sicne it will asign the value to _bmi
                        interpretation: calc.getInterpretation(),
                        resultText: calc.getResult(),
                      ))); 
                  }
               ),
              ]

             ));
      }
  }

