import 'package:drb/controllers/categorybody_controller.dart';
import 'package:drb/utilities/constants.dart';
import 'package:drb/view/components/subcat_heading.dart';
import 'package:drb/view/screens/ListScreen.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';


class CategoryBodyScreen extends StatefulWidget{
  CategoryBodyScreen({required this.currentCatId});

  String currentCatId;
  @override
  PageState createState() => PageState();
}

class PageState extends StateMVC<CategoryBodyScreen>{
  CategoryBodyController? con;

  PageState() : super(CategoryBodyController()){
    con = controller as CategoryBodyController;
  }

  @override
  void initState(){
    super.initState();
    con!.init(catId: widget.currentCatId);
    con!.fetchBody();
  }

  @override
  void didUpdateWidget(CategoryBodyScreen oldWidget){
    super.didUpdateWidget(oldWidget);
    if(oldWidget.currentCatId != widget.currentCatId){
      con!.init(catId: widget.currentCatId);
      con!.fetchBody();
    }
  }

  @override
  Widget build(BuildContext context){
    print("Build Current Cat: " + widget.currentCatId);

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
          children: con!.children!
        ),
      ),
    );
  }
}