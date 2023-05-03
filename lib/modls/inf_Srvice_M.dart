class Srvices {
  String? Id;
  String? title;
  String? Content;
  String? Urlimge;
  String? userid;
  String? Date;

  Srvices(
      {this.Id,
      this.Content,
      this.title,
      this.Urlimge,
      this.userid,
      this.Date});

  Srvices.fromjson(Map<String, dynamic> json) {
    Id = json["Id"];
    title = json["title"];
    Content = json["Content"];
    Urlimge = json["Urlimge"];
    userid = json["userid"];
    Date = json["Date"];
  }

  Map<String, dynamic> tojson() {
    return {
      "Id": Id,
      "title": title,
      "Content": Content,
      "Urlimage": Urlimge,
      "userid": userid,
      "Date": Date,
    };
  }
}

class getservisVM {
  Srvices? srvis;
  getservisVM({this.srvis});
  get Id => srvis!.Id;
  get Content => srvis!.Content;
  get Date => srvis!.Date;
  get Urlimge => srvis!.Urlimge;
  get title => srvis!.title;
  get userid => srvis!.userid;
}
