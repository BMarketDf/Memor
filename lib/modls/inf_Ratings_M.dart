class RatingsM {
  String ?id ;
 int  ?Rating;
 String ?userid ;
 RatingsM({this.id,this.Rating,this.userid });
 RatingsM.fromjson(Map<String ,dynamic> json){
      id = json["id"];
      Rating= json["Rating"];
      userid= json["userid"];
 }
 Map<String, dynamic>json(){
return{
       "id": id,
       "Rating": Rating,
       "userid": userid,
};  }
}