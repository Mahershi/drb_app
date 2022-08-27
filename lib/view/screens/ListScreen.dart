import 'package:drb/utilities/constants.dart';
import 'package:drb/view/components/custom_spacer.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget{
  @override
  PageState createState() => PageState();
}

class PageState extends State<ListScreen>{
  List<String> popular = ['Mr Fog', 'Elfbar', 'Ghost', 'Flavour Beast', 'Envi'];
  @override
  Widget build(BuildContext context){
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: popular.length,
        itemBuilder: (context, index){
          return Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomSpacer(width: 20,),
              ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: (MediaQuery.of(context).size.width - MediaQuery.of(context).size.width * navFraction - tilesPerRow * 40 - 40)/4,
                  maxWidth: (MediaQuery.of(context).size.width - MediaQuery.of(context).size.width * navFraction - tilesPerRow * 40 - 40)/4
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: borderRadius20
                  ),
                  child: Text(
                    popular[index],

                  )
                ),
              ),
              CustomSpacer(width: 20,),

            ],
          );
        },
      )
    );
  }
}