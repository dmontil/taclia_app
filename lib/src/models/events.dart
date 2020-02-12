class Events {
  String title;
  String description;
  String tag;
  String date;
  String id;

  Events({this.title, this.description,this.tag,this.date,this.id});

  Events.fromJson(Map<String, dynamic> json)
      :
        title = json['title'],
        description = json['description'],
        tag = json['tag'],
        date = json['date'],
        id = json['id'];


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['tag'] = this.tag;
    data['date'] = this.date;


    return data;
  }

}