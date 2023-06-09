import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Constent/constent.dart';
import '../modls/inf_massegs_M.dart';
import '../modls/srvise/user_serviceFirbase.dart';
import 'masseg.dart';
class ShowImge extends StatefulWidget {
     Massegs urlimge;
  
   ShowImge({super.key,required this.urlimge});

  @override
  State<ShowImge> createState() => _ShowImgeState();
}
class _ShowImgeState extends State<ShowImge> {
     final String currentUser = FirebaseAuth.instance.currentUser!.email.toString();
     @override
      Widget build(BuildContext context) => Scaffold(
       backgroundColor: Colors.black,
     body: 
         Padding(
           padding: const EdgeInsets.only(left: 3,right: 3),
           child: CachedNetworkImage(
                        height: double.maxFinite,
                        width: double.maxFinite,
                          imageUrl: widget.urlimge.masseg!,
                          errorWidget: (context, url, error) =>const Center(child:  Text("تم حذف الصورة ")),
                           placeholder:(context,url)=> const Center(child: CircularProgressIndicator()),
                           imageBuilder: (context, imageProvider) => Image(image: imageProvider,
                           fit: BoxFit.scaleDown,),),));
}