/// code : 200
/// error : ""
/// ReturnValue : [{"generalstars":"5","tagid":"7176177890787235","tagname":"可以先受理后补材料","updatetime":"2020-08-27 00:00:00"}]

class TagListModel {
  int _code;
  String _error;
  List<TagItem> _tagItems;

  int get code => _code;
  String get error => _error;
  List<TagItem> get tagItems => _tagItems;

  TagListModel({
      int code, 
      String error, 
      List<TagItem> returnValue}){
    _code = code;
    _error = error;
    _tagItems = returnValue;
}

  TagListModel.fromJson(dynamic json) {
    _code = json["code"];
    _error = json["error"];
    if (json["ReturnValue"] != null) {
      _tagItems = [];
      json["ReturnValue"].forEach((v) {
        _tagItems.add(TagItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["code"] = _code;
    map["error"] = _error;
    if (_tagItems != null) {
      map["ReturnValue"] = _tagItems.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// generalstars : "5"
/// tagid : "7176177890787235"
/// tagname : "可以先受理后补材料"
/// updatetime : "2020-08-27 00:00:00"

class TagItem {
  String _generalstars;
  String _tagid;
  String _tagname;
  String _updatetime;
  bool flag = false; //不属于返回的json数据结构,用来判断当前标签是否选择

  String get generalstars => _generalstars;
  String get tagid => _tagid;
  String get tagname => _tagname;
  String get updatetime => _updatetime;

  TagItem({
      String generalstars, 
      String tagid, 
      String tagname, 
      String updatetime}){
    _generalstars = generalstars;
    _tagid = tagid;
    _tagname = tagname;
    _updatetime = updatetime;
}

  TagItem.fromJson(dynamic json) {
    _generalstars = json["generalstars"];
    _tagid = json["tagid"];
    _tagname = json["tagname"];
    _updatetime = json["updatetime"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["generalstars"] = _generalstars;
    map["tagid"] = _tagid;
    map["tagname"] = _tagname;
    map["updatetime"] = _updatetime;
    return map;
  }

}