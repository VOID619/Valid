import 'dart:math';

import 'package:flutter/material.dart';

import 'BMI_R.dart';
class BMI extends StatefulWidget {
  @override
  _BMIState createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  bool isMale=true;
  double height=100.0;
  int age=20;
  int weight=75;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR ',
        style: TextStyle(
          fontSize: 35.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),),
      ),
      body:Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                children: [
                 Expanded(
                   child: GestureDetector(
                     onTap: ()
                     {
                       setState(() {
                         isMale=true;
                       });
                     },
                     child: Container(
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Icon(Icons.ac_unit,),
                           SizedBox(height: 10.0,),
                           Text('MALE',
                             style: TextStyle(
                               fontWeight: FontWeight.bold,
                               fontSize: 35.0,
                               color: Colors.black,
                             ),)
                         ],
                       ),

                       decoration: BoxDecoration(
                         color: isMale?Colors.blue:Colors.grey[400],
                         borderRadius: BorderRadius.circular(20.0)
                       ),
                     ),
                   ),
                 ),
                 SizedBox(width: 20.0,),
                 Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale=false;
                        });
                      },
                      child: Container(
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Icon(Icons.ac_unit,),
                           SizedBox(height: 10.0,),
                           Text('FEMALE',
                             style: TextStyle(
                               fontWeight: FontWeight.bold,
                               fontSize: 35.0,
                               color: Colors.black,
                             ),)
                         ],
                       ),
                        decoration: BoxDecoration(
                            color: !isMale?Colors.blue:Colors.grey[400],
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                 ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('HEIGHT',
                    style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                    ),),
                    SizedBox(height: 10.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text('${height.round()}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 50.0,
                        ),),
                        Text('cm',
                        style: TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                        ),)
                      ],
                    ),
                    SizedBox(height: 20.0,),
                    Slider(
                      min: 100.0,
                        max: 220.0,
                        value:height ,
                        onChanged:(value){
                          setState(() {
                            height=value;
                          });
                        }
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child:
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.grey[400],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('AGE',
                              style: TextStyle
                                (
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35.0),),
                            SizedBox(height: 10.0,),
                            Text('$age',
                              style: TextStyle
                                (
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35.0),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                    onPressed:(){
                                      setState(() {
                                        --age;
                                      });
                                    },
                                  mini: true,
                                child: Icon(Icons.remove),),
                                SizedBox(width: 20.0,),
                                FloatingActionButton(
                                  mini: true,
                                  onPressed:(){
                                    setState(() {
                                      ++age;
                                    });
                                  },
                                  child: Icon(Icons.add),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 20.0,),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.grey[400],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('WEIGHT',
                              style: TextStyle
                                (
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35.0),),
                            SizedBox(height: 10.0,),
                            Text('$weight',
                              style: TextStyle
                                (
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35.0),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  onPressed:(){
                                    setState(() {
                                      --weight;
                                    });
                                  },
                                  mini: true,
                                  child: Icon(Icons.remove),),
                                SizedBox(width: 20.0,),
                                FloatingActionButton(
                                  mini: true,
                                  onPressed:(){
                                    setState(() {
                                      ++weight;
                                    });
                                  },
                                  child: Icon(Icons.add),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ),
          Container(
            width: double.infinity,
            child: MaterialButton(onPressed: (){
              double result =weight/pow(height/100,2);
              print(result);
              Navigator.push(context,MaterialPageRoute(builder: (context)=>BMI_R(
                age: age,
                result: result,
                isMale:isMale,
              ),),);
            },
            color: Colors.blue,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text('calculate',
                style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,),),
            ),
            ),
          )
        ],
      ),
    );
  }
}
