import 'package:drb/utilities/global_vars.dart';
import 'package:drb/view/components/custom_spacer.dart';
import 'package:flutter/material.dart';

import '../../utilities/constants.dart';
import '../components/looking_for.dart';

class MainScreen extends StatefulWidget{
  @override
  PageState createState() => PageState();
}

class PageState extends State<MainScreen>{
  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        Container(
            padding: ei20,
            child: LookingFor()
        ),
        CustomSpacer(height: 20,),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300,
                  childAspectRatio: 3/1.5,
                  crossAxisSpacing: 40,
                  mainAxisSpacing: 40
              ),
              itemBuilder: (context, index){
                return InkWell(
                  onTap: (){
                    GlobalVars.hsCon!.switchPage(page: 1, args: GlobalVars.categories![index].id);
                  },
                  child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        // border: testBorder,
                          color: primaryTextColor.withOpacity(0.3),
                          borderRadius: borderRadius20
                      ),
                      child: Text(
                        GlobalVars.categories![index].category!,
                        style: font.merge(TextStyle(
                            fontSize: head4
                        )),
                      )
                  ),
                );
              },
              itemCount: GlobalVars.categories!.length,
            ),
          ),
        ),
      ],
    );
  }
}