import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget{
  Widget body;

  CustomAlertDialog({required this.body});
  @override
  Widget build(BuildContext context){
    return AlertDialog(
      content: body,
    );
  }
}