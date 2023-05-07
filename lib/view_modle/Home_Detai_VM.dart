
// ignore_for_file: non_constant_identifier_names

import 'package:newproject/modls/inf_order_M.dart';

import '../modls/Repostre_Apstract/abstract_user.dart';

class Detaiserviceviwemodle {
  
  abstractuser ?Detaiservice ;
  Detaiserviceviwemodle({this.Detaiservice});
   Future fetchaddordr( order newOrder)async {
    await Detaiservice!.OrderbyService(newOrder);
   }
     
  

}