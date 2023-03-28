/// response_code : "1"
/// msg : "Get City"
/// data : [{"id":"63","name":"Pratapgarh","image":null,"description":null,"country_id":"0","state_id":"0","created_at":"2023-01-31 13:30:33","updated_at":"2023-01-31 13:30:33"},{"id":"62","name":"Dungarpur","image":null,"description":null,"country_id":"0","state_id":"0","created_at":"2023-01-31 13:30:16","updated_at":"2023-01-31 13:30:16"},{"id":"61","name":"Banswara","image":null,"description":null,"country_id":"0","state_id":"0","created_at":"2023-01-31 13:30:00","updated_at":"2023-01-31 13:30:00"},{"id":"60","name":"Hanumangarh","image":null,"description":null,"country_id":"0","state_id":"0","created_at":"2023-01-31 13:29:46","updated_at":"2023-01-31 13:29:46"},{"id":"59","name":"Beawar","image":null,"description":null,"country_id":"0","state_id":"0","created_at":"2023-01-31 13:29:33","updated_at":"2023-01-31 13:29:33"},{"id":"58","name":"Tonk","image":null,"description":null,"country_id":"0","state_id":"0","created_at":"2023-01-31 13:29:13","updated_at":"2023-01-31 13:29:13"},{"id":"57","name":"Dhaulpur","image":null,"description":null,"country_id":"0","state_id":"0","created_at":"2023-01-31 13:28:59","updated_at":"2023-01-31 13:28:59"},{"id":"56","name":"Baran","image":null,"description":null,"country_id":"0","state_id":"0","created_at":"2023-01-31 13:28:46","updated_at":"2023-01-31 13:28:46"},{"id":"55","name":"Kishangarh","image":null,"description":null,"country_id":"0","state_id":"0","created_at":"2023-01-31 13:28:29","updated_at":"2023-01-31 13:28:29"},{"id":"54","name":"Sri Ganganagar","image":null,"description":null,"country_id":"0","state_id":"0","created_at":"2023-01-31 13:28:14","updated_at":"2023-01-31 13:28:14"},{"id":"53","name":"Pali","image":null,"description":null,"country_id":"0","state_id":"0","created_at":"2023-01-31 13:28:02","updated_at":"2023-01-31 13:28:02"},{"id":"52","name":"Bharatpur","image":null,"description":null,"country_id":"0","state_id":"0","created_at":"2023-01-31 13:27:48","updated_at":"2023-01-31 13:27:48"},{"id":"51","name":"Sikar","image":null,"description":null,"country_id":"0","state_id":"0","created_at":"2023-01-31 13:27:34","updated_at":"2023-01-31 13:27:34"},{"id":"50","name":"Alwar","image":null,"description":null,"country_id":"0","state_id":"0","created_at":"2023-01-31 13:27:20","updated_at":"2023-01-31 13:27:20"},{"id":"49","name":"Bhilwara","image":null,"description":null,"country_id":"0","state_id":"0","created_at":"2023-01-31 13:27:07","updated_at":"2023-01-31 13:27:07"},{"id":"48","name":"Ajmer","image":null,"description":null,"country_id":"0","state_id":"0","created_at":"2023-01-31 13:26:48","updated_at":"2023-01-31 13:26:48"},{"id":"47","name":"Udaipur","image":null,"description":null,"country_id":"0","state_id":"0","created_at":"2023-01-31 13:26:33","updated_at":"2023-01-31 13:26:33"},{"id":"46","name":"Bhiwadi","image":null,"description":null,"country_id":"0","state_id":"0","created_at":"2023-01-31 13:26:14","updated_at":"2023-01-31 13:26:14"},{"id":"45","name":"Bikaner","image":null,"description":null,"country_id":"0","state_id":"0","created_at":"2023-01-31 13:25:58","updated_at":"2023-01-31 13:25:58"},{"id":"44","name":"Kota","image":null,"description":null,"country_id":"0","state_id":"0","created_at":"2023-01-31 13:25:32","updated_at":"2023-01-31 13:25:32"},{"id":"43","name":"Jodhpur","image":null,"description":null,"country_id":"0","state_id":"0","created_at":"2023-01-31 13:25:16","updated_at":"2023-01-31 13:25:16"},{"id":"42","name":"Jaipur","image":null,"description":null,"country_id":"0","state_id":"0","created_at":"2023-01-31 13:24:48","updated_at":"2023-01-31 13:24:48"}]

class CitiesModel {
  CitiesModel({
      String? responseCode, 
      String? msg, 
      List<Data>? data,}){
    _responseCode = responseCode;
    _msg = msg;
    _data = data;
}

  CitiesModel.fromJson(dynamic json) {
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
CitiesModel copyWith({  String? responseCode,
  String? msg,
  List<Data>? data,
}) => CitiesModel(  responseCode: responseCode ?? _responseCode,
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

/// id : "63"
/// name : "Pratapgarh"
/// image : null
/// description : null
/// country_id : "0"
/// state_id : "0"
/// created_at : "2023-01-31 13:30:33"
/// updated_at : "2023-01-31 13:30:33"

class Data {
  Data({
      String? id, 
      String? name, 
      dynamic image, 
      dynamic description, 
      String? countryId, 
      String? stateId, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _image = image;
    _description = description;
    _countryId = countryId;
    _stateId = stateId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
    _description = json['description'];
    _countryId = json['country_id'];
    _stateId = json['state_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  String? _id;
  String? _name;
  dynamic _image;
  dynamic _description;
  String? _countryId;
  String? _stateId;
  String? _createdAt;
  String? _updatedAt;
Data copyWith({  String? id,
  String? name,
  dynamic image,
  dynamic description,
  String? countryId,
  String? stateId,
  String? createdAt,
  String? updatedAt,
}) => Data(  id: id ?? _id,
  name: name ?? _name,
  image: image ?? _image,
  description: description ?? _description,
  countryId: countryId ?? _countryId,
  stateId: stateId ?? _stateId,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  String? get id => _id;
  String? get name => _name;
  dynamic get image => _image;
  dynamic get description => _description;
  String? get countryId => _countryId;
  String? get stateId => _stateId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['image'] = _image;
    map['description'] = _description;
    map['country_id'] = _countryId;
    map['state_id'] = _stateId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}