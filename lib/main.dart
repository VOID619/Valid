import'package:flutter/material.dart';
import 'package:project12/modules/bmi/BMI_CAculator.dart';



void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:BMI());
  }
}
