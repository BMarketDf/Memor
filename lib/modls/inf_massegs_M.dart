class Massegs {
  String? id ;
  String? masseg;
  String? idUser;
  String? idusersender;
  String? idChat;
  DateTime ? datnow;
    Massegs({
      this.id,
      this.idusersender,
      this.idUser,
      this.idChat,
      this.masseg,
      this.datnow,
    });
     Massegs.fromjson(Map<String ,dynamic> json){
      // final json=jsonc!.data();
        id = json["id"];
        idusersender = json["idusersender"];
        idUser = json["idUser"];
        idChat = json["idChat"];
        masseg = json["masseg"];
        datnow = json["datnow"].toDate() ;
             }
    Map<String ,dynamic> tojson (){
   return{
      "id": id,
      "idusersender": idusersender,
      "idUser":idUser,
      "idChat":idChat,
      "masseg": masseg,
      "datnow": datnow,
    };
    }
}