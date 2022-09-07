import 'dart:convert';

import 'package:drb/models/product_meta_model.dart';

import '../utilities/custom_trace.dart';

class Flavour{
  String? product_id;
  String? flavour;
  String? description;
  String? image_url;
  int? stock;
  String? id;

  bool empty = false;

  Flavour.fromJson({jsonMap}){
    try{
      this.id = jsonMap['id'].toString() ?? '';
      this.flavour = jsonMap['flavour'] ?? '';
      this.description = jsonMap['description'] ?? '';
      this.image_url = jsonMap['image'] ?? '';
      this.stock = jsonMap['stock'] ?? 0;
      this.product_id = jsonMap['product'].toString() ?? '';
    }
    catch(e){
      CustomTrace(StackTrace.current, message: e.toString());
    }
  }
}