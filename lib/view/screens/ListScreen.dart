import 'package:drb/app_config.dart';
import 'package:drb/utilities/constants.dart';
import 'package:drb/view/components/custom_spacer.dart';
import 'package:flutter/material.dart';

import '../../models/product_meta_model.dart';

class ListScreen extends StatefulWidget{
  List<ProductMeta>? products;

  ListScreen({required this.products});
  @override
  PageState createState() => PageState();
}

class PageState extends State<ListScreen>{
  @override
  void initState(){
    super.initState();

  }

  @override
  Widget build(BuildContext context){
    return Container(

      height: 270,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.products!.length,
        itemBuilder: (context, index){
          return Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomSpacer(width: 32,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: (MediaQuery.of(context).size.width - MediaQuery.of(context).size.width * navFraction - tilesPerRow * 40 - 40)/6,
                      maxWidth: (MediaQuery.of(context).size.width - MediaQuery.of(context).size.width * navFraction - tilesPerRow * 40 - 40)/6
                    ),
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Container(
                            height: 150,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                // color: secondaryColor.withOpacity(0.2),
                                borderRadius: borderRadius20
                            ),
                            child: (widget.products![index].image_url != null && widget.products![index].image_url != '') ?
                            ClipRRect(
                              borderRadius: borderRadius12,
                              child: Image.network(
                                  AppConfig.config.baseUrl + widget.products![index].image_url!
                              ),
                            )
                                : Text(
                                widget.products![index].brand!.brand!,
                                style: font.merge(TextStyle(
                                    fontSize: head3,
                                    fontWeight: FontWeight.bold
                                ))
                            )
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 4),
                          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 7),
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: borderRadius12
                          ),
                          child: Text(
                            widget.products![index].nic!.toLowerCase() == 'bold 50' ?
                            widget.products![index].nic! : widget.products![index].nic! + " " + widget.products![index].nic_unit!
                          ),
                        )
                      ],
                    ),
                  ),
                  CustomSpacer(height: 12,),
                  Text(
                    widget.products![index].size! + " " + widget.products![index].size_unit!,
                    style: font.merge(TextStyle(
                      fontSize: body4
                    )),
                  ),
                  CustomSpacer(height: 12,),
                  widget.products![index].on_sale!
                  ? Row(
                    children: [
                      Text(
                          "\$ ",
                        style: font.merge(TextStyle(
                            fontSize: body2,
                        )),
                      ),
                      Text(
                        widget.products![index].price!,
                        style: font.merge(TextStyle(
                          fontSize: body2,
                          decoration: TextDecoration.lineThrough

                        )),
                      ),
                      CustomSpacer(width: 8,),
                      Text(
                        widget.products![index].sale_price!,
                        style: font.merge(TextStyle(
                            fontSize: body2,
                            fontWeight: FontWeight.w600
                        )),
                      )
                    ],
                  )

                  : Text(
                    "\$ " + widget.products![index].price!,
                    style: font.merge(TextStyle(
                      fontSize: body2,
                      fontWeight: FontWeight.w600
                    )),
                  ),
                  CustomSpacer(height: 12,),
                  Column(
                    children: widget.products![index].discounts!.map((e){
                      return Container(
                        margin: EdgeInsets.only(bottom: 4),
                        child: Text(
                          e.qty! + ' for \$ ' + e.dis_price!,
                          style: font.merge(TextStyle(
                            fontSize: body4,
                            fontWeight: FontWeight.w400
                          )),
                        ),
                      );
                    }).toList(),
                  )
                ],
              ),
              CustomSpacer(width: 32,),

            ],
          );
        },
      )
    );
  }
}