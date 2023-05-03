

class Reviews{
     String? id ;
     String? userid ;
     String? idservice ;
     String? content ;
     String? datePublish ;
     int?   starRating ;      
      Reviews({this.id, this.userid , this.idservice ,this.content , this.datePublish,this.starRating});
  Reviews.fromjesion(Map<String , dynamic > json ){
        id = json["id"];
        userid = json["userid"];
        idservice = json["idservice"];
        content = json["content"];
        datePublish = json["datePublish"];
        starRating = json["starRating"];
           
  }
  Map<String ,dynamic> tojson (){
    return{
      "id": id,
      "userid": userid,
      "idservice": idservice,
      "content": content,
      "datePublish": datePublish,
      "starRating": starRating,
    };
    
  }
 } 
