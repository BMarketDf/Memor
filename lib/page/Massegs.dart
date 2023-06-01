import 'package:flutter/material.dart';
import 'package:newproject/modls/inf_User_M.dart';
import 'package:newproject/modls/inf_chat_M.dart';
import 'package:newproject/modls/inf_massegs_M.dart';
import 'package:newproject/page/masseg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
 
class Mas extends StatefulWidget {
  const Mas({super.key});

  @override
  State<Mas> createState() => _MasState();
}

class _MasState extends State<Mas> {
    final constent = FirebaseFirestore.instance;
    final String currentUser = FirebaseAuth.instance.currentUser!.email.toString();
     // ignore: non_constant_identifier_names
      Users ListUses=Users();
     // ignore: non_constant_identifier_names
     
  Widget body(chat chat){

    return  StreamBuilder(
      stream: constent.collection("Users").doc(chat.idUser).snapshots(),
      // .where("uid",isEqualTo: chat.idusersender)
      builder:(context, snapshot) { 
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator(),);
              }
            if(!snapshot.data!.exists) {
              return Container();
            }
              ListUses= Users.fromjson(snapshot.data!.data());
              return
                InkWell(
                       child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0*0.75),
                             child: Row(children: [
                    Stack(
                      children:[  CircleAvatar(
                        radius:25,
                        backgroundImage:  NetworkImage("${ListUses.imgeurl}"),
                      ),
                      ///يجي الشرط نتاع اذا كان المستحدم نشط اولا  
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child:Container(height: 12,
                      width: 12,
                      decoration: const BoxDecoration(
                         color:Color(0xFF00BF6D),
                         shape: BoxShape.circle
                      ),
                      ))
                      ]
                    ),
                    const SizedBox(width: 8,),
                             Expanded(
                    child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${ListUses.Username}",
                          style:  const TextStyle(fontSize: 20,
                          fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 10,),
                           const Opacity(
                            opacity: 0.65,
                             child: Text("الرسالة الاخيرة= مرحبا",
                                       style:  TextStyle(fontSize: 20,
                                       ),
                                       ),
                           ),
                        ],
                        
                      ),
                    ),
                             ),
                    const Opacity(
                      opacity: 0.65,
                      child: Text("m.datnow"))
                             ],),
                       ),
                        onTap: () {
                      //تمري القم          
                      Navigator.push(context, MaterialPageRoute(builder:(context) =>  masseg(User:ListUses ,massg: chat,)));
                       },
               
                     );
           }
    );}
                 @override
                 Widget build(BuildContext context) {
 return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        title:   const Center(
           child:   Text(
          'Chat ',
          style: TextStyle( fontSize: 26),
        )),
        backgroundColor: const Color.fromARGB(255, 12, 142, 248),
        actions: [
        IconButton(onPressed:(){}, icon: const Icon(Icons.search))
        ],
      ),
    body: StreamBuilder(
      stream: constent.collection("Chat").where("idusersender",isEqualTo: currentUser).snapshots(),
      builder:(context, snapshot){ 
                 List<chat> ListChat=[];
        if(!snapshot.hasData){
             return const Center(child: CircularProgressIndicator(),);
        }
        for (var element in snapshot.data!.docs) {
              ListChat.add(chat.fromjson(element.data()));
                }
         return  Column(children: [
        Expanded(child:

                ListView.builder(
               itemCount: ListChat.length,
              itemBuilder: (context, index) {
                return ListChat.isEmpty? const Center(child: Text("non Chat"),):body(ListChat[index]);
            },)
                    
            )
      ],);}
    )
    
    
    
    );
                 }
            
             
          }
    
  
  