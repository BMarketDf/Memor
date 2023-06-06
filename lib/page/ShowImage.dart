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
          bool isdelete=false;
                deletimage(context) async{
                  //يوجد خطا في هذه الدالة
                  String deleteUrlImage=widget.urlimge.masseg.toString() ;
                //  Navigator.pushNamedAndRemoveUntil(context, "/masseg", (route) => false);
                 Navigator.of(context).pop();
                isdelete=  await Auth().deletMassge(widget.urlimge.id)  ;
                  if (isdelete) {
                 await  Auth().deleteimagrinfirestore(deleteUrlImage);
                    conste().snakepare("تم حدف الصورة ", context);
                 }else{
                   print("فشل الحذف ");
                  conste().snakepare("تعذر حذف الصورة!  ",context);}
                       }

     @override
      Widget build(BuildContext context) => Scaffold(
       backgroundColor: Colors.black,
       appBar: AppBar( 
       title: Visibility(
       visible: widget.urlimge.idusersender==currentUser?true:false,
         child: IconButton(onPressed: (){
              showDialog(
             context:context,
          builder: (context) =>  AlertDialog(
              title:Column(
                children: [
                 const Text("هل تريد حذف الرسالة "),
                   Row(
                   children:[
                    TextButton(onPressed: (){
                    Navigator.pop(context);
                   deletimage(context);                  //يوجد خطا في هذه الدالة

              }, child:const Text("نعم ")),
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child:const Text(" لا ")),
                  ] )  ],
              ) ,
            ));
          }, icon: const Icon(Icons.delete)),
       ),
       ),
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
                           fit: BoxFit.scaleDown,),
                      ),
         )
    );
}