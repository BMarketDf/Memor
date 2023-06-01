
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newproject/modls/inf_User_M.dart';
import 'package:newproject/modls/inf_chat_M.dart';
import 'package:newproject/modls/inf_massegs_M.dart';
import 'package:newproject/modls/inf_massegs_M.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:newproject/modls/srvise/user_serviceFirbase.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; 
import '../modls/srvise/firbase_Servse_to_Hom.dart';


class masseg extends StatefulWidget {
    chat ? massg;
    Users ? User;
   masseg({ this.massg,super.key,this.User}) {
  }
  @override
  State<masseg> createState() => _massegState();
  
}

class _massegState extends State<masseg> {
  @override
    
  // void initState() {
  //   // TODO: implement initState
  //   getidchattheCurentUser();
  // }
  // String ?idchatUser;
    final String currentUser = FirebaseAuth.instance.currentUser!.email.toString();
    final GlobalKey<FormState> _glonlfey = GlobalKey<FormState>();
        final constent = FirebaseFirestore.instance;
     Massegs Addmasseg =Massegs();
    
     
   Widget Chatinputfiled(){
     bool isEmpty=false;
  return StreamBuilder(
    //ا الستريم درتوا يجيب  المحادثة لي بعثها المستخدم  لي  لبززت عليها ويجيبلي المحدثة لبعثها الملبوز عليه  لل مستخدم لي داير تسجيل الدخول 
      stream:  constent.collection("Massegs").where("idusersender",isEqualTo:currentUser).where("idUser",isEqualTo: widget.User!.uid).snapshots() ,
      builder:(context, snapshot) {
                List<Massegs> massegs =[];
          if (snapshot.hasData) {
             for (var element in snapshot.data!.docs) {
               massegs.add(Massegs.fromjson(element.data()));
             }  
          }
         return StreamBuilder(
          // وهذ الستريم عكس لاخر وكل البينات يتم تجمعها في ليست واحدة 
        stream: constent.collection("Massegs").where("idusersender",isEqualTo:widget.User!.uid ).where("idUser",isEqualTo: currentUser).snapshots(),
        // where("idUser", isEqualTo:widget.User!.uid ).where("idusersender",isEqualTo: currentUser)
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const  Center(child: CircularProgressIndicator(),);
          }
          for (var element in snapshot.data!.docs) {
                     massegs.add(Massegs.fromjson(element.data()));
          }
                       List m=["4","m","k","k","m","5","5"];
                       print(m);
          for(int i=0;i<m.length;i++){
            for(int j=i+1;j<m.length;j++){
              if(m[i]==m[j]){
               m.removeAt(j);
              }
              print(m);
              print("bachir");
            }
          }
          for(int i=0;i<massegs.length;i++){
            for(int j=i+1;j<massegs.length;j++){
              if(massegs[i].id==massegs[j].id){
               massegs.removeAt(j);
              }
              print(m);
              print("bachir");
            }
          }
massegs.sort((a, b) => a.datnow!.compareTo(b.datnow!));        
    return Column(children: [
           Expanded(child: ListView.builder(
          itemCount: massegs.length,
          itemBuilder: (context, index) {
          return   Row( 
            // add condetion user conection and user send ne massege 
            mainAxisAlignment: massegs[index].idUser==widget.User!.uid? MainAxisAlignment.end :MainAxisAlignment.start,
            children:[ Container(
              margin:const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.symmetric(
                horizontal: 20*0.75,vertical: 10
              ),
              decoration: BoxDecoration(color:massegs[index].idUser==widget.User!.uid? Colors.blue:Colors.white,
              borderRadius: BorderRadius.circular(30)),
              child: Column(
                children: [
                  Text("${massegs[index].masseg}",style:  TextStyle( 
                   color:massegs[index].idUser==widget.User!.uid? Colors.white:Colors.black,
                  ),),
                  // Text("${snapshot.data!.docs[index]["idChat"]}"),
                ],
              ),
            )]);
        },)),
          Container(
          padding: const EdgeInsets.symmetric(horizontal: 20,
          vertical: 15,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child:  SafeArea(child: Row(children: [
            const Icon(Icons.mic,
            color: Colors.black,),
            const SizedBox(width: 20,),
            Expanded(child: Container(decoration: BoxDecoration(
                color: const Color.fromARGB(0, 255, 255, 255),
                borderRadius: BorderRadius.circular(40),
            ),
            child: Row(children: [
              Expanded(child: 
              Form(
                 key:_glonlfey,
                child: TextFormField(
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      isEmpty=true;
                    }
                    return null;
                  },
                  onChanged: (sendmessge) {
                             Addmasseg.masseg= sendmessge;
                             },
                  decoration: const InputDecoration(
                    hintText: "Typ Text", 
                  border: InputBorder.none
                  ),
                ),
              ),
              ),
              // icon send Message to  user 
                      Visibility(
                        visible: true,
                        child: IconButton(onPressed: (){
                           if (_glonlfey.currentState!.validate()) {
                             setState(() {
                                _glonlfey.currentState!.save();
                                Addmasseg.datnow= DateTime.now();
                                // Addmasseg.idChat=widget.massg!.id;
                                  Addmasseg.idusersender=currentUser;
                                 Addmasseg.idUser=widget.User!.uid;
                                 Auth(). addMassge(Addmasseg);  
                              // HomeModlefirbase().getMasseg(currentUser);
                              
                              });
                                
                              }
                        }, icon: const Icon(Icons.send))),
                      //icon uploude to image in galore or camira
              IconButton(onPressed:(){},
               icon: const Icon(Icons.camera_alt_outlined))
            ]),
            ))
          ],)),
        ),
        
        ]
          
        ,);
          
      } );}
    );
 }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        toolbarHeight: 75 ,
        automaticallyImplyLeading: false,
        title:  Row(
          children: [
            const BackButton(),
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage("${widget.User!.imgeurl}"),
            ),
            const SizedBox(width: 20*0.75,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${widget.User!.Username}" ,
                style: const TextStyle(fontSize: 20,
                fontWeight: FontWeight.w600),),
                const SizedBox(height: 4,),
                const Text("Activ 3m ago",style: TextStyle(fontSize: 10),)
              ],
            )
          ],
        ),
      ),
      body:Chatinputfiled(),
       
      
     
    );
  }
}