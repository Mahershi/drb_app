import 'package:drb/utilities/constants.dart';
import 'package:drb/view/components/subcat_heading.dart';
import 'package:drb/view/screens/ListScreen.dart';
import 'package:flutter/material.dart';

class CategoryBodyScreen extends StatefulWidget{
  @override
  PageState createState() => PageState();
}

class PageState extends State<CategoryBodyScreen>{
  @override
  Widget build(BuildContext context){
    return Container(
      padding: eiTop20,
      width: MediaQuery.of(context).size.width - MediaQuery.of(context).size.width * navFraction,
      decoration: BoxDecoration(
        // border: testBorder
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: radius30)
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SubCatHeading(
              title: 'New',
              buttonTitle: 'more',
              onTap: (){}
            ),
            ListScreen(),
            SubCatHeading(
                title: 'On Sale',
                buttonTitle: 'more',
                onTap: (){}
            ),
            ListScreen(),
            SubCatHeading(
                title: 'Popular',
                buttonTitle: 'more',
                onTap: (){}
            ),
            ListScreen(),
            SubCatHeading(
                title: 'Popular Brands',
                buttonTitle: 'more',
                onTap: (){}
            ),
            ListScreen(),
          ],
        ),
      ),
    );
  }
}