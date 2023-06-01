class chat {
  String ?id;
  // String ?idMasseg;
  String ?idusersender;
  String ?idUser;
  chat({this.id,
  // this.idMasseg
  this.idUser,this.idusersender});
   chat.fromjson(Map<String ,dynamic> json){
      // final json=jsonc!.data();
        id = json["id"];
        idusersender = json["idusersender"];
        idUser = json["idUser"];
        // idMasseg = json["idMasseg"];
             }
    Map<String ,dynamic> tojson (){
   return{
      "id": id,
      "idusersender":idusersender,
      "idUser":idUser,
      // "masseg": idMasseg,
    };
    }
}