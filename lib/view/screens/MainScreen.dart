import 'package:flutter/material.dart';

import '../../utilities/constants.dart';
import '../components/looking_for.dart';

class MainScreen extends StatefulWidget{
  @override
  PageState createState() => PageState();
}

class PageState extends State<MainScreen>{
  List<String> cats = ['Disposables', 'Pods', 'eJuice', 'Coild', 'Devices', 'Accessories', 'Misc'];
  @override
  Widget build(BuildContext context){
    return Expanded(
      child: Column(
        children: [
          Container(
              padding: ei20,
              child: LookingFor()
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 400,
                    childAspectRatio: 3/1.5,
                    crossAxisSpacing: 40,
                    mainAxisSpacing: 40
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
                        cats[index],
                        style: font.merge(TextStyle(
                            fontSize: head3
                        )),
                      )
                  );
                },
                itemCount: cats.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}