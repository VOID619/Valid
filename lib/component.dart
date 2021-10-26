import 'package:flutter/material.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 3.0,
  @required Function? function,
  @required String? text,
}) =>
    Container(
      width: width,
      height: 50.0,
      child: MaterialButton(
        onPressed: (){function!();},
        child: Text(
          text!,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ),
    );

Widget defaultForm({
  @required TextEditingController? controller,
  @required TextInputType? type,
  Function? onSubmit,
  Function? onChange,
  bool isPassword = false,
  @required Function? validate,
  @required String? label,
  @required IconData? prefix,
  IconData? suffix,
}) => TextFormField(
  controller: controller,
  keyboardType: type,
  obscureText: isPassword,
  onFieldSubmitted: (s){onSubmit!(s);},
  onChanged: (s){onChange!(s);},
  validator: (value){validate!(value);},
  decoration: InputDecoration(
    labelText: label,
    prefixIcon: Icon(
      prefix,
    ),
    suffixIcon: suffix != null ? Icon(
      suffix,
    ) : null,
    border: OutlineInputBorder(),
  ),
);
