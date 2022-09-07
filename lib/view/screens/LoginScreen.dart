import 'package:drb/controllers/login_controller.dart';
import 'package:drb/utilities/constants.dart';
import 'package:drb/utilities/global_vars.dart';
import 'package:drb/view/components/custom_spacer.dart';
import 'package:drb/view/components/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../models/store_model.dart';
import '../components/app_bar.dart';

class LoginScreen extends StatefulWidget{
  @override
  PageState createState() => PageState();
}

class PageState extends StateMVC<LoginScreen>{
  LoginController? con;

  PageState() : super(LoginController()){
    con = controller as LoginController;
  }


  @override
  Widget build(BuildContext buildContext){
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(secondaryColor.withOpacity(0.35), BlendMode.srcIn),
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
                  color: secondaryTextColor,
                  borderRadius: borderRadius20
                ),
                child: Form(
                  key: con!.formKey,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.33,
                        child: TextFormField(
                          controller: con!.username,
                          validator: (value){
                            if(value!.isEmpty){
                              return "Username Required";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'User',
                            hintStyle: font.merge(TextStyle(
                                color: secondaryColor.withOpacity(0.5)
                            )),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: primaryTextColor.withOpacity(0.3)),
                              borderRadius: borderRadius12
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: primaryColor.withOpacity(1)),
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
                          obscureText: true,
                          validator: (value){
                            if(value!.isEmpty){
                              return "Password Required";
                            }
                            return null;
                          },
                          controller: con!.password,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: font.merge(TextStyle(
                              color: secondaryColor.withOpacity(0.5)
                            )),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: secondaryColor.withOpacity(0.3)),
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
                          GlobalVars.currentStore = value as Store;
                          print("Store: " + GlobalVars.currentStore!.name!);
                          setState((){});
                        },
                        value: GlobalVars.currentStore,
                        items: GlobalVars.stores!.map((value){
                          return DropdownMenuItem(
                            child: Container(
                              padding: ei12,
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: Text(value.name!),

                            ),
                            value: value,

                          );
                        }).toList(),
                        borderRadius: borderRadius12,
                      ),
                      CustomSpacer(height: 20,),
                      SubmitButton(
                          label: 'Sign In',
                          onPress: (){
                            print("Submit");
                            if(con!.formKey.currentState!.validate()){
                              con!.login();
                            }else{
                              print("invalide");
                            }
                          },
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
