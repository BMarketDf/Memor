class Massegs {
  String? id ;
  String? masseg;
  String? idUser;
  String? idusersender;
  String? idChat;
  String? Taype;
  DateTime ? datnow;
    Massegs({
      this.id,
      this.idusersender,
      this.idUser,
      this.Taype,
      this.idChat,
      this.masseg,
      this.datnow,
    });
     Massegs.fromjson(Map<String ,dynamic> json){
      // final json=jsonc!.data();
        id = json["id"];
        idusersender = json["idusersender"];
        idUser = json["idUser"];
        Taype = json["Taype"];
        idChat = json["idChat"];
        masseg = json["masseg"];
        datnow = json["datnow"].toDate() ;
             }
    Map<String ,dynamic> tojson (){
   return{
      "id": id,
      "idusersender": idusersender,
      "idUser":idUser,
      "Taype":Taype,
      "idChat":idChat,
      "masseg": masseg,
      "datnow": datnow,
    };
    }
}