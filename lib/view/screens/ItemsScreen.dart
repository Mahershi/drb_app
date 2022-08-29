import 'package:drb/view/components/custom_spacer.dart';
import 'package:flutter/material.dart';

import '../../utilities/constants.dart';

class ItemsScreen extends StatefulWidget{
  @override
  PageState createState() => PageState();
}

class PageState extends State<ItemsScreen>{
  List<String> items = ['Watermelon Kiwi Ice', 'Strawberry Raspberry Cherry Ice', 'Blue Raspberry Ice', 'Pineapple Berry',
    'Peach Mango', 'Red Kola'
  ];
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
      child: Column(
        children: [
          Container(
            padding: ei20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      child: Icon(
                        Icons.chevron_left,
                        size: 32,
                      ),
                    ),
                    CustomSpacer(width: 20,),
                    Text(
                      "Mr Fog",
                      style: font.merge(TextStyle(
                          fontSize: head2
                      )),
                    )
                  ],
                ),
                Text(
                  "Bold 50",
                  style: font.merge(TextStyle(
                    fontSize: head4,
                    color: primaryTextColor.withOpacity(0.8)
                  )),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300,
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 40,
                  crossAxisSpacing: 40
                ),
                itemBuilder: (context, index){
                  return Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        // border: testBorder,
                          color: primaryTextColor.withOpacity(0.3),
                          borderRadius: borderRadius20
                      ),
                      child: Text(
                        items[index],
                        style: font.merge(TextStyle(
                            fontSize: head3
                        )),
                      )
                  );
                },
                itemCount: items.length,
              ),
            ),
          )
        ],
      )
    );
  }

}