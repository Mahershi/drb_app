import 'package:drb/view/components/app_bar_2.dart';
import 'package:flutter/material.dart';

import '../../utilities/constants.dart';
import 'package:drb/services/user_repo.dart' as ur;

class SettingsScreen extends StatefulWidget{
  @override
  PageState createState() => PageState();
}

class PageState extends State<SettingsScreen>{
  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: Column(
          children: [
            Container(
                padding: ei20,
                child: CustomAppBar2(showCart: false,)
            ),
            Expanded(
              child: Container(
                padding: ei30,
                width: MediaQuery.of(context).size.width - MediaQuery.of(context).size.width * navFraction,
                decoration: BoxDecoration(
                  // border: testBorder
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: radius30, topRight: radius30)
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            child: Text(
                              "Settings",
                              style: font.merge(TextStyle(
                                  fontSize: head2
                              )),
                            )
                        ),
                        InkWell(
                          onTap: (){
                            ur.logout();
                            Navigator.of(context).pushNamedAndRemoveUntil('/LoginScreen', (route) => false);
                          },
                          child: Container(
                            padding: ei16,
                            decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: borderRadius12
                            ),
                            child: Text(
                              "Logout",
                              style: font.merge(TextStyle(
                                fontSize: body2,
                                color: secondaryTextColor,
                                letterSpacing: 1.1
                              )),
                            )
                          )
                        )
                      ],
                    )
                  ],
                )
              ),
            )
          ],
        )
      )
    );
  }
}