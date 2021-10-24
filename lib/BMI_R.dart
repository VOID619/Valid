import 'package:flutter/material.dart';
import 'BMI_R.dart';
class BMI_R extends StatelessWidget {
  final int?age;
  final bool? isMale;
  final double? result;
  BMI_R({
   @required  this.isMale ,
   @required  this.result ,
   @required  this.age ,
});
  double r(double result)
  {
    double re;
    result=result*100;
   re= result.round()/100;

    return re;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI RESULT '),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Gender : ${isMale! ? 'Male' : 'female' }',style: TextStyle(fontSize: 50.0,fontWeight: FontWeight.bold),),
            Text('Result : ${r(result!)}',style: TextStyle(fontSize: 50.0,fontWeight: FontWeight.bold),),
            Text('AGE : ${age!}',style: TextStyle(fontSize: 50.0,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}

