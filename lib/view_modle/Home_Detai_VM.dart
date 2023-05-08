
// ignore_for_file: non_constant_identifier_names

import 'package:newproject/modls/Repostre_Apstract/abstract_Servse_to_Homfirbase.dart';
import 'package:newproject/modls/inf_Ratings_M.dart';
import 'package:newproject/modls/inf_order_M.dart';

import '../modls/Repostre_Apstract/abstract_user.dart';

class Detaiserviceviwemodle {
  
  abstractuser ?Detaiservice ;
  abstractHome ?instence;
  Detaiserviceviwemodle({this.instence,this.Detaiservice});
   Future fetchaddordr( order newOrder)async {
    await Detaiservice!.OrderbyService(newOrder);
   }

   Future fetchgetRating( String userid)async {
    await instence!.getMoyneRatings(userid);
   }
     
  

}