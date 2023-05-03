import 'package:flutter/foundation.dart';
import 'package:newproject/modls/Repostre_Apstract/abstract_Servse_to_Homfirbase.dart';
import 'package:newproject/modls/Repostre_Apstract/abstract_user.dart';
import 'package:newproject/modls/inf_Reviews_M.dart';
import 'package:newproject/modls/inf_Srvice_M.dart';
import 'package:newproject/modls/srvise/firbase_Servse_to_Hom.dart';

class homeviwemodle extends ChangeNotifier {
  abstractHome? abstrecthome;
  abstractuser? abstrectuser;
  homeviwemodle({this.abstrecthome,this.abstrectuser});
  List<getservisVM>? lis;
  Future<List<Srvices>?> fechAllservice() async {
    List<Srvices>? listsrvices =
        (await abstrecthome!.getAllService())!.toList();
    listsrvices.map((servis) => (getservisVM(srvis: servis))).toList();
    ChangeNotifier();
    return listsrvices;
  }

  ///fethche all Reviwes to Service 
  Future<List<Reviews>> fetchAllReviews(String idservice)async {
    List<Reviews>? listReviews =(await abstrecthome!.getAllReviews(idservice))!.toList();
    ChangeNotifier();
    return listReviews ;
  }
  // fetche delet Reviews 
   Future<bool> fethDeleteReviews(String id ,String idservice)async {
     return await abstrectuser!.deleteReviews(id, idservice);
   }
   // fetch update Reviews to service 
   Future<bool> fetchupdatReviews(String id ,Reviews updaetReviwes)async{
    return await abstrectuser!.UpdateReviews(id,updaetReviwes);
   }
     // fetche delet service 
   Future<bool> fethDeleteservice(String id ,String idservice)async {
     return await abstrectuser!.deleteService(id);
   }
   // fetch update service 
   Future<bool> fetchupdatservice(Srvices updaetSrvice)async{
    return await abstrectuser!.UpdaetService(updaetSrvice);
   }
   // add service 
   Future<bool> fetchAddservice(Srvices addservice)async{
     return await abstrectuser!.addSrvice(addservice);
   }
   // add Reviews to service  
   Future<bool> fetchAddReviews(Reviews addRviews)async{
     return await abstrectuser!.addReviews(addRviews);
   }
  
}
