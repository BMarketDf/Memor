
import 'package:newproject/modls/inf_Ratings_M.dart';
import 'package:newproject/modls/inf_Srvice_M.dart';

import '../inf_Reviews_M.dart';

abstract class abstractHome {
  Future<List<Srvices>?> getAllService();
  Future<List<Reviews>?>getAllReviews(String idservice) ;
  Future<double> getMoyneRatings(String userid);
  // Future getMasseg(String id );
  Future getSearche(String qure,String isSlected);
  Future getSearcheUser(String qure);
  }
