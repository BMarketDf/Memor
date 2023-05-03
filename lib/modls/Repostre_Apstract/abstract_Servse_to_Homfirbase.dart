
import 'package:newproject/modls/inf_Srvice_M.dart';

import '../inf_Reviews_M.dart';

abstract class abstractHome {
  Future<List<Srvices>?> getAllService();
  Future<List<Reviews>?>getAllReviews(String idservice) ;
  
  }
