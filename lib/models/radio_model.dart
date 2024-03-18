class radio_model {
  List<Radios>? radios;

  radio_model({this.radios});

  radio_model.fromJson(Map<String, dynamic> json) {
    if (json['Radios'] != null) {
      radios = <Radios>[];
      json['Radios'].forEach((v) {
        radios!.add(new Radios.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.radios != null) {
      data['Radios'] = this.radios!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Radios {
  String? id;
  String? name;
  String? uRL;

  Radios({this.id, this.name, this.uRL});

  Radios.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    uRL = json['URL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Name'] = this.name;
    data['URL'] = this.uRL;
    return data;
  }
}