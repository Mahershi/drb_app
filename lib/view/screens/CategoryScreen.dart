import 'package:drb/utilities/constants.dart';
import 'package:drb/view/components/side_nav.dart';
import 'package:drb/view/screens/CategoryBody.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget{

  @override
  PageState createState() => PageState();
}

class PageState extends State<CategoryScreen>{
  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        // border: Border.all(color: Colors.yellow)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: eiTop40,
            decoration: BoxDecoration(
              color: secondaryColor
            ),
            width: MediaQuery.of(context).size.width * navFraction,
            child: SideNav(),
          ),
          CategoryBodyScreen()
        ],
      ),
    );
  }
}