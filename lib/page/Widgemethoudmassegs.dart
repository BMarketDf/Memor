import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
// import 'package:newproject/modls/inf_User_M.dart';
import 'package:newproject/modls/inf_chat_M.dart';
import 'package:newproject/modls/inf_massegs_M.dart';
import 'package:newproject/modls/inf_massegs_M.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:newproject/modls/srvise/user_serviceFirbase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newproject/page/ShowImage.dart'; 
import '../Constent/constent.dart';
import '../modls/srvise/firbase_Servse_to_Hom.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path/path.dart';
class massegsWidge{
          final constent = FirebaseFirestore.instance;
         final String currentUser = FirebaseAuth.instance.currentUser!.email.toString();
         Massegs Addmasseg =Massegs();
         massegsWidge({required this.Addmasseg});
 
   allertSyalouug(context,Massegs geTaype){
    showDialog(
             context:context,
          builder: (context) =>  AlertDialog(
              title:Column(
                children: [
                 const Text("هل تريد حذف الرسالة "),
                   Row(
                   children:[
                    TextButton(onPressed: (){
                   deletimage(context,geTaype);   
                           Navigator.pop(context);               //يوجد خطا في هذه الدالة
              }, child:const Text("نعم ")),
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child:const Text(" لا ")),] )  ],) ,));}    
          deletimage(context,Massegs remove) async{
            bool isdelete=false;

                String deleteUrlImage=remove.masseg.toString() ;
              isdelete=await Auth().deletMassge(remove.id)  ;
                  if (isdelete) {
                     Navigator.pop(context);
                    conste().snakepare("تم حدف الصورة ", context); 
                    await  Auth().deleteimagrinfirestore(deleteUrlImage);
                  }
                 else{conste().snakepare("تعذر حذف الصورة!  ",context);}}
         ///رفع الصورة كمن الكاميرا او المعرض 
          Uploudfile(XFile image)async {
              File file =File(image.path);
              String nameimage=basename(image.path);
              var refrehce=FirebaseStorage.instance.ref("imagaeChatMassegs/$nameimage");
              Addmasseg.Taype="Image";
              Addmasseg.datnow= DateTime.now();      
              await  refrehce.putFile(file);
              Addmasseg.masseg= await refrehce.getDownloadURL();      
              Auth().addMassge(Addmasseg); 
                 }
          //  send image 
      showimge( XFile image,context)async {
      return await showModalBottomSheet(context: context, builder: (context)
       {
       return Container(
            height: 600,
            padding: const EdgeInsets.all(5),
            // width: 170,
           child: Column(
                            children:[  Image(image: FileImage(File(image.path)),
                            height: 420 ,
                              fit: BoxFit.cover,        
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(onPressed: (){
                                   Uploudfile(image);
                                    Navigator.pop(context);
                                    conste().snakepare("جاري ارسال  الصورة ", context); 
                                         }, icon: const Icon(Icons.send,
                                  color:Colors.blue,
                                  size: 30,
                                  )),],)]), ); });}//new fonction

           Widget shwoData(Massegs gettype,context){
            switch (gettype.Taype) {
              case "Text":
                            // if (currentUser==gettype.idusersender) {

              return GestureDetector(
   
                child: Text("${gettype.masseg}",style:  const TextStyle( 
                             color: Color.fromARGB(255, 236, 228, 228),
                      ),),
                                        onLongPress: (){
                if (currentUser==gettype.idusersender) {
                      showDialog(
               context:context,
               builder: (context) =>  AlertDialog(
              title:Column(
                children: [
                 const Text("هل تريد حذف الرسالة "),
                   Row(
                   children:[
                    TextButton(onPressed: (){
                Auth().deletMassge(gettype.id);
                //add Tousset  show massege in remove or fail
                Navigator.pop(context);
              }, child:const Text("نعم ")),
              TextButton(onPressed: (){
                Navigator.pop(context);
              },
                 child:const Text(" لا ")), ])  ],), ));
                 } 
                 }  
             
                      );
     
          ///if loula tkmle hna 
              // else {
              //     return Text("${gettype.masseg}",style: const  TextStyle( 
              //                        color:Colors.black,),); 
              //                        }
                
                              default:
                    return GestureDetector(
                      onLongPress: () {
                    if (currentUser==gettype.idusersender) {  allertSyalouug(context,gettype);  } },
                 onTap: (){
                Navigator.push( context, MaterialPageRoute(builder:(context) 
                => ShowImge(urlimge: gettype,)));      },
                child: ClipRRect(
                       borderRadius: BorderRadius.circular(20), 
                  child: CachedNetworkImage(
                    width: 180,
                    // height: 600,
                      imageUrl: gettype.masseg.toString(),
                    placeholder:(context,url)=> const Center(child: CircularProgressIndicator()),
                           imageBuilder: (context, imageProvider) =>Image(image: imageProvider,
                            fit: BoxFit.scaleDown,
                           ), ),), );
           
            }}
}//lescpolad in class