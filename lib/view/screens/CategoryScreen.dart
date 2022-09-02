import 'package:drb/utilities/constants.dart';
import 'package:drb/view/components/side_nav.dart';
import 'package:drb/view/screens/CategoryBody.dart';
import 'package:drb/view/screens/ItemsScreen.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget{
  CategoryScreen({required this.currentCatId});

  String currentCatId;
  @override
  PageState createState() => PageState();
}

class PageState extends State<CategoryScreen>{
  @override
  void initState(){
    super.initState();
    print("Again");
  }
  
  // @override
  // void didUpdateWidget(CategoryScreen oldWidget){
  //   super.didUpdateWidget(oldWidget);
  //   print("did update m");
  //   if(oldWidget.currentCatId != widget.currentCatId){
  //     print("diff m");
  //   }
  // }

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
            child: SideNav(currentCatId: widget.currentCatId,),
          ),
          CategoryBodyScreen(currentCatId: widget.currentCatId,),
          // ItemsScreen()
        ],
      ),
    );
  }
}