import 'package:flutter/material.dart';

class BMIRE extends StatelessWidget {
  final int?age;
  final bool? isMale;
  final int? result;
  BMIRE({
    @required this.age,
    @required this.isMale,
    @required this.result,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI RESULT '),
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Gender : ${isMale! ? 'Male' : 'female' }',style: TextStyle(fontSize: 50.0,fontWeight: FontWeight.bold),),
            Text('Result : ${result}',style: TextStyle(fontSize: 50.0,fontWeight: FontWeight.bold),),
            Text('AGE : ${age}',style: TextStyle(fontSize: 50.0,fontWeight: FontWeight.bold),),
          ],
        ),
      ) ,
    );
  }
}
