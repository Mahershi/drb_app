import 'package:drb/models/flavour_model.dart';
import 'package:drb/models/product_meta_model.dart';
import 'package:drb/services/flavour_repo.dart';
import 'package:drb/utilities/global_vars.dart';
import 'package:drb/utilities/scripts.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class FlavourBaseController extends ControllerMVC{
  List<Flavour> flavours = [];

  Map<String, dynamic> catFetchMap = {
    '1': fetchDisposableFlavours,
    '2': fetchJuiceFlavour,
    '3': fetchPodFlavour
  };


  Future<void> getFlavours({ProductMeta? product}) async {
    flavours = [];


    var resp = await catFetchMap[product!.category!.id!](productId: product!.id!, storeId: GlobalVars.currentStore!.id!);
    if(isSuccess(resp)){
      for(var inst in resp['data']){
        flavours.add(Flavour.fromJson(jsonMap: inst));
      }
      this.state!.setState(() { });

    }
  }
}