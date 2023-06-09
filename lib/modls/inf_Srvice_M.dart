import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
class Srvices {
  String? serviceuid;
  String ?catogry;
  String? title;
  String ? Count;
  String ? Raitin;
  String? description;
  String? imgUrl;
  String? user;
  DateTime? createDate;
  Srvices(
      {this.serviceuid,
       this.description,
       this.catogry,
       this.Count,
       this.Raitin,
       this.title,
       this.imgUrl,
       this.user,
       this.createDate});
         Srvices.fromjson(Map<String, dynamic> json) {
    serviceuid = json["serviceuid"];
    catogry = json["catogry"];
    title = json["title"];
    description = json["description"];
    Count = json["Count"].toString();
    imgUrl = json["imgUrl"];
    user = json["user"];
    createDate = DateTime.fromMillisecondsSinceEpoch(json["createDate"].seconds * 1000);
    Raitin = json["Raitin"].toString();
  }

  Map<String, dynamic> tojson() {
    return {
      "serviceuid": serviceuid,
      "catogry": catogry,
      "title": title,
      "description": description,
      "Raitin": Raitin,
      "Count": Count,
      "imgUrl": imgUrl,
      "user": user,
      "createDate": Timestamp.fromDate(createDate!),
    };
  }
}








  // Srvices.fromjson(Map<String, dynamic> json) {
  //   serviceuid = json["serviceuid"];
  //   catogry = json["catogry"];
  //   title = json["title"];
  //   description = json["description"];
  //  Count = json["Count"].toString();
  //   imgUrl = json["imgUrl"];
  //   user = json["user"].toString();
  //   createDate = json["createDate"].toDateTime();
  //   Raitin = json["Raitin"];
  // }

  // Map<String, dynamic> tojson() {
  //   return {
  //     "serviceuid": serviceuid,
  //     "catogry": catogry,
  //     "title": title,
  //     "description": description,
  //     "Raitin": Raitin,
  //     "Count": Count,
  //     "imgUrl": imgUrl,
  //     "user": user,
  //     "createDate": createDate,
  //   };
  // }


class getservisVM {
  Srvices? srvis;
  getservisVM({this.srvis});
  get Id => srvis!.serviceuid;
  get Content => srvis!.Count;
  get Date => srvis!.createDate;
  get imgUrl => srvis!.imgUrl;
  get title => srvis!.title;
  get userid => srvis!.user;
}
// {
  // "imgUrl": https://firebasestorage.googleapis.com/v0/b/bmarket-b690b.appspot.com/o/projects%20thumb%2Ff21d3ed0-ede5-11ed-bc9f-7b3952d21103?alt=media&token=c7fa0fbc-4a6d-4e65-bbf8-3b7cba5a7b25, 
// "catogry": طبخ, 
// "serviceuid": tdH0kXK7mTp3gMXwBPyK,
//  "description": تذنطنل؛تبتبشلسن, 
//  "Raitin": 2,
  // "Count": 12,
  //  "title": غملنذت, 
  // "user": hSI5bmtMSkcV06bwjmbpu0BEdAn2, 

// "createDate": Timestamp(seconds=1683580741, nanoseconds=363000000)
// }