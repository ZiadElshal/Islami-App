/// radios : [{"id":10,"name":"Radio Alzain Mohammad Ahmad","url":"https://Qurango.net/radio/alzain_mohammad_ahmad"},{"id":100,"name":"Radio Ahmad Khader Al-Tarabulsi","url":"https://Qurango.net/radio/ahmad_khader_altarabulsi"}]

class RadioModel {
  RadioModel({
    this.radios,
  });

  RadioModel.fromJson(dynamic json) {
    if (json['radios'] != null) {
      radios = [];
      json['radios'].forEach((v) {
        radios?.add(Radios.fromJson(v));
      });
    }
  }

  List<Radios>? radios;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (radios != null) {
      map['radios'] = radios?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 10
/// name : "Radio Alzain Mohammad Ahmad"
/// url : "https://Qurango.net/radio/alzain_mohammad_ahmad"

class Radios {
  Radios({
    this.id,
    this.name,
    this.url,
  });

  Radios.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
  }

  num? id;
  String? name;
  String? url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['url'] = url;
    return map;
  }
}
