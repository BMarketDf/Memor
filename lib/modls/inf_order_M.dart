class order {
   String ?id ;
   String ?serviceid ;
   String ?userid;
   String ?DateRequest;
   String ? DateExpriy;
   String ? Status;
     order({this.id,this.serviceid ,this.userid,this.DateRequest,this.DateExpriy,this.Status});
     order.fromjson(Map<String ,dynamic> json){
        id = json["id"];
        serviceid = json["serviceid"];
        userid = json["userid"];
        DateRequest = json["DateRequest"];
        DateExpriy = json["DateExpriy"];
        Status = json["Status"];        }
    Map<String ,dynamic> tojson (){
   return{
      "id": id,
      "serviceid": serviceid,
      "userid": userid,
      "DateRequest": DateRequest,
      "DateExpriy": DateExpriy,
      "Status": Status
    };
    }

  } 