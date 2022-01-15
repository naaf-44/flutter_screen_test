class AboutUsModel {
  List<Data>? data;

  AboutUsModel({this.data});

  AboutUsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? heading;
  String? details;

  Data({this.id, this.heading, this.details});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    heading = json['heading'];
    details = json['details'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['heading'] = this.heading;
    data['details'] = this.details;
    return data;
  }
}