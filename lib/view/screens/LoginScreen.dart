import 'package:drb/utilities/constants.dart';
import 'package:drb/view/components/custom_spacer.dart';
import 'package:drb/view/components/submit_button.dart';
import 'package:flutter/material.dart';

import '../components/app_bar.dart';

class LoginScreen extends StatefulWidget{
  @override
  PageState createState() => PageState();
}

class PageState extends State<LoginScreen>{
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  List<String> stores = [
    'Brandee\'s',
    'DRB - EAST',
    'DRB - NORTH'
  ];
  String currentStore = 'Brandee\'s';
  @override
  Widget build(BuildContext buildContext){
    print("Login screen");
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(primaryColor.withOpacity(0.35), BlendMode.srcIn),
                image: AssetImage('assets/img/smoke.png')
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomAppBar(),
              Container(
                padding: ei30,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: borderRadius20
                ),
                child: Form(
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.33,
                        child: TextFormField(
                          controller: username,

                          decoration: InputDecoration(
                            hintText: 'User',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: primaryColor.withOpacity(0.3)),
                              borderRadius: borderRadius12
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: primaryColor.withOpacity(0.8)),
                                borderRadius: borderRadius12
                            ),
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: errorColor.withOpacity(0.3)),
                                borderRadius: borderRadius12
                            ),
                          ),
                        ),
                      ),
                      CustomSpacer(height: 20,),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.33,
                        child: TextFormField(
                          controller: password,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: primaryColor.withOpacity(0.3)),
                                borderRadius: borderRadius12
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: primaryColor.withOpacity(0.8)),
                                borderRadius: borderRadius12
                            ),
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: errorColor.withOpacity(0.3)),
                                borderRadius: borderRadius12
                            ),
                          ),
                        ),
                      ),
                      CustomSpacer(height: 20,),
                      DropdownButton(
                        onChanged: (value){
                          currentStore = value as String;
                          setState((){});
                        },
                        value: currentStore,
                        items: stores.map((value){
                          return DropdownMenuItem(
                            child: Container(
                              padding: ei12,
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: Text(value),

                            ),
                            value: value,

                          );
                        }).toList(),
                        borderRadius: borderRadius12,
                      ),
                      CustomSpacer(height: 20,),
                      SubmitButton(
                          label: 'Sign In',
                          onPress: (){print("Tapped");},
                          width: MediaQuery.of(context).size.width * 0.33,
                          height: 20,
                          backgroundColor: primaryColor,
                          labelColor: primaryTextColor,
                      )
                    ],
                  ),
                ),
              ),
              CustomSpacer(height: 40, show_frame: false, width: 500,),
            ],
          ),
        ),
      ),
    );
  }
}
