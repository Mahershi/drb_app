import 'package:drb/app_config.dart';
import 'package:flutter/material.dart';

import '../../models/flavour_model.dart';
import '../../models/product_meta_model.dart';

class FlavourGrid extends StatefulWidget{
  List<Flavour> flavours;
  ProductMeta product;
  FlavourGrid({required this.flavours, required this.product});
  @override
  PageState createState() => PageState();
}

class PageState extends State<FlavourGrid>{
  @override
  Widget build(BuildContext context){
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200
      ),
      itemBuilder: (context, index){
        return Container(
          child: Column(
            children: [
              Image.network(
                widget.flavours[index].image_url == '' ? AppConfig.config.baseUrl + widget.product.image_url! : AppConfig.config.baseUrl + widget.flavours[index].image_url!
              )
            ],
          ),
        );
      },
      itemCount: widget.flavours.length,
    );
  }
}