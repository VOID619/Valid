import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project12/modules/bmi_r/BMI_R.dart';
class BMI extends StatefulWidget {
  @override
  _BMIState createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  bool isMale=true;
  double height=100.0;
  int age=10;
  int weight=70;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0,),),
      ),
      body:
      Column(
        children:
        [
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
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: isMale? Colors.blue:Colors.grey[400],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.ac_unit),
                              SizedBox(height: 10.0,),
                              Text('MALE',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),),

                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20.0,),
                    Expanded(
                      child: GestureDetector(
                        onTap: ()
                        {
                          setState(() {
                            isMale=false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: !isMale ?Colors.blue:Colors.grey[400],
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.ac_unit),
                                SizedBox(height: 10.0,),
                                Text('FEMALE',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),),
                              ]),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
          Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey[400],
                  ),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'HEIGHT',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30.0),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            '${height.round()}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 50.0),),
                          Text(
                            'cm',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),


                        ],),
                      SizedBox(height: 10.0,),
                      Slider(
                        value: height,
                        onChanged: (value){
                          setState(() {
                            height=value;
                          });
                          print(value.round());
                        },
                        min: 100.0,
                        max: 220.0,
                      ),
                    ],
                  ),
                ),
              )
          ),
          Expanded(
              child: Padding (
                padding: EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey[400],

                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'AGE',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,),),
                            Text(
                              '${age}',style: TextStyle(fontSize: 40.0,fontWeight: FontWeight.bold,),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //add
                                FloatingActionButton(onPressed:(){
                                  setState(() {
                                    --age;
                                  });
                                },
                                  mini :true,
                                  child: Icon(Icons.remove),
                                ),
                                SizedBox(width: 20.0,),
                                FloatingActionButton(onPressed:(){
                                  setState(() {
                                    ++age;
                                  });
                                },
                                  mini :true,
                                  child: Icon(Icons.add),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 20.0,),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey[400],

                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            Text(
                              'WEIGHT',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,),),
                            Text(
                              '${weight}',style: TextStyle(fontSize: 40.0,fontWeight: FontWeight.bold,),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //add
                                FloatingActionButton(onPressed:(){
                                  setState(() {
                                    --weight;
                                  });
                                },
                                  mini :true,
                                  child: Icon(Icons.remove),
                                ),
                                SizedBox(width: 20.0,),
                                FloatingActionButton(onPressed:(){
                                  setState(() {
                                    ++weight;
                                  });
                                },
                                  mini :true,
                                  child: Icon(Icons.add),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
          ),
          Container(
              color: Colors.blue,
              width: double.infinity,
              child: MaterialButton(
                onPressed: ()
                {
                  double result =weight/pow(height/100,2);
                  print(result.round());
                  Navigator.push(context,MaterialPageRoute(builder:(context) =>BMIRE(
                    age: age,
                    isMale:isMale,
                    result: result.round(),
                  )
                  ),
                  );
                },
                height: 50.0,
                child: Text('CALCULATE',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30.0,color: Colors.white),),
              )
          ),

        ],),
    );
  }
}
