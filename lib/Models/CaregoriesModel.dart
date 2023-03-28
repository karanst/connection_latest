/// response_code : "1"
/// msg : "Get Main Categories"
/// data : [{"id":"2","name":"Tiffin Centre","roll":"7","image":"https://developmentalphawizz.com/connection/uploads/categories/tiffin.png","count":"5"},{"id":"1","name":"Accommodation","roll":"6","image":"https://developmentalphawizz.com/connection/uploads/categories/accommodation.png","count":"5"}]

class CaregoriesModel {
  CaregoriesModel({
      String? responseCode, 
      String? msg, 
      List<Data>? data,}){
    _responseCode = responseCode;
    _msg = msg;
    _data = data;
}

  CaregoriesModel.fromJson(dynamic json) {
    _responseCode = json['response_code'];
    _msg = json['msg'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  String? _responseCode;
  String? _msg;
  List<Data>? _data;
CaregoriesModel copyWith({  String? responseCode,
  String? msg,
  List<Data>? data,
}) => CaregoriesModel(  responseCode: responseCode ?? _responseCode,
  msg: msg ?? _msg,
  data: data ?? _data,
);
  String? get responseCode => _responseCode;
  String? get msg => _msg;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['response_code'] = _responseCode;
    map['msg'] = _msg;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "2"
/// name : "Tiffin Centre"
/// roll : "7"
/// image : "https://developmentalphawizz.com/connection/uploads/categories/tiffin.png"
/// count : "5"

class Data {
  Data({
      String? id, 
      String? name, 
      String? roll, 
      String? image, 
      String? count,}){
    _id = id;
    _name = name;
    _roll = roll;
    _image = image;
    _count = count;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _roll = json['roll'];
    _image = json['image'];
    _count = json['count'];
  }
  String? _id;
  String? _name;
  String? _roll;
  String? _image;
  String? _count;
Data copyWith({  String? id,
  String? name,
  String? roll,
  String? image,
  String? count,
}) => Data(  id: id ?? _id,
  name: name ?? _name,
  roll: roll ?? _roll,
  image: image ?? _image,
  count: count ?? _count,
);
  String? get id => _id;
  String? get name => _name;
  String? get roll => _roll;
  String? get image => _image;
  String? get count => _count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['roll'] = _roll;
    map['image'] = _image;
    map['count'] = _count;
    return map;
  }

}