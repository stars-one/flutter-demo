/// id : 1
/// name : "北京"

class CityModel {
  int _id;
  String _name;

  int get id => _id;
  String get name => _name;

  CityModel({
      int id, 
      String name}){
    _id = id;
    _name = name;
}

  CityModel.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    return map;
  }

}