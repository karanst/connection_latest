/// response_code : "1"
/// msg : "Get Tiffin Vendor"
/// data : [{"uname":"test","email":"test@gmail.com","mobile":"6545646546","address":"Indore, Madhya Pradesh, India","description":"","profile_image":"https://developmentalphawizz.com/connection/uploads/profile_pics/640f1f94270ef.jpg"},{"uname":"devesh","email":"dev456@gmail.com","mobile":"9993224906","address":"Indore, Madhya Pradesh, India","description":"","profile_image":"https://developmentalphawizz.com/connection/uploads/profile_pics/640eb243785f5.jpg"},{"uname":"Shiva ","email":"shi@gmail.com","mobile":"9638527413","address":"302006, Railway, Station Rd, Gopalbari, Jaipur, Rajasthan 302006, India","description":"","profile_image":"https://developmentalphawizz.com/connection/uploads/profile_pics/"},{"uname":"Kunal Vyas","email":"Vyas@gmail.com","mobile":"7896541111","address":"135-Ratanlok Colony, Malviya Nagar, Indore, Madhya Pradesh 452011, India","description":"","profile_image":"https://developmentalphawizz.com/connection/uploads/profile_pics/63d3c5a4c689a.jpg"},{"uname":"piyush","email":"pi@gmail.com","mobile":"8878149512","address":"norangpura Ahmedabad","description":"","profile_image":"https://developmentalphawizz.com/connection/uploads/profile_pics/63d3ae04be28c.png"}]

class TifinDetailsModel {
  TifinDetailsModel({
      String? responseCode, 
      String? msg, 
      List<Data>? data,}){
    _responseCode = responseCode;
    _msg = msg;
    _data = data;
}

  TifinDetailsModel.fromJson(dynamic json) {
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
TifinDetailsModel copyWith({  String? responseCode,
  String? msg,
  List<Data>? data,
}) => TifinDetailsModel(  responseCode: responseCode ?? _responseCode,
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

/// uname : "test"
/// email : "test@gmail.com"
/// mobile : "6545646546"
/// address : "Indore, Madhya Pradesh, India"
/// description : ""
/// profile_image : "https://developmentalphawizz.com/connection/uploads/profile_pics/640f1f94270ef.jpg"

class Data {
  Data({
      String? uname, 
      String? email, 
      String? mobile, 
      String? address, 
      String? description, 
      String? profileImage,}){
    _uname = uname;
    _email = email;
    _mobile = mobile;
    _address = address;
    _description = description;
    _profileImage = profileImage;
}

  Data.fromJson(dynamic json) {
    _uname = json['uname'];
    _email = json['email'];
    _mobile = json['mobile'];
    _address = json['address'];
    _description = json['description'];
    _profileImage = json['profile_image'];
  }
  String? _uname;
  String? _email;
  String? _mobile;
  String? _address;
  String? _description;
  String? _profileImage;
Data copyWith({  String? uname,
  String? email,
  String? mobile,
  String? address,
  String? description,
  String? profileImage,
}) => Data(  uname: uname ?? _uname,
  email: email ?? _email,
  mobile: mobile ?? _mobile,
  address: address ?? _address,
  description: description ?? _description,
  profileImage: profileImage ?? _profileImage,
);
  String? get uname => _uname;
  String? get email => _email;
  String? get mobile => _mobile;
  String? get address => _address;
  String? get description => _description;
  String? get profileImage => _profileImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uname'] = _uname;
    map['email'] = _email;
    map['mobile'] = _mobile;
    map['address'] = _address;
    map['description'] = _description;
    map['profile_image'] = _profileImage;
    return map;
  }

}