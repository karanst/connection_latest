/// response_code : "1"
/// msg : "Get Tiffin Vendor"
/// data : [{"id":"132","uname":"Test","email":"Test@gmail.com","mobile":"6545646546","address":"Indore, Madhya Pradesh, India","description":["Aloo Gobhi","chana masala","Palak paneer","Chana masala","butter-brushed naan","Dal makhani"],"per_day_charge":"300","monthly_charge":"2000","yearly_charge":"5000","resto_type":"non-veg","profile_image":"https://developmentalphawizz.com/connection/uploads/profile_pics/640f1f94270ef.jpg"},{"id":"131","uname":"Devesh","email":"Dev456@gmail.com","mobile":"9993224906","address":"Indore, Madhya Pradesh, India","description":["Aloo Gobhi","chana masala"],"per_day_charge":"400","monthly_charge":"2500","yearly_charge":"6000","resto_type":"non-veg","profile_image":"https://developmentalphawizz.com/connection/uploads/profile_pics/640eb243785f5.jpg"},{"id":"125","uname":"Shiva ","email":"Shi@gmail.com","mobile":"9638527413","address":"302006, Railway, Station Rd, Gopalbari, Jaipur, Rajasthan 302006, India","description":["Stuffed paratha","Kaju Kati","Dal makhani"],"per_day_charge":"500","monthly_charge":"5000","yearly_charge":"7000","resto_type":"veg","profile_image":"https://developmentalphawizz.com/connection/uploads/profile_pics/64117e423c8d4.jpg"},{"id":"41","uname":"Kunal Vyas","email":"Vyas@gmail.com","mobile":"7896541111","address":"135-Ratanlok Colony, Malviya Nagar, Indore, Madhya Pradesh 452011, India","description":[""],"per_day_charge":"","monthly_charge":"","yearly_charge":"","resto_type":"","profile_image":"https://developmentalphawizz.com/connection/uploads/profile_pics/63d3c5a4c689a.jpg"},{"id":"39","uname":"piyush","email":"pi@gmail.com","mobile":"8878149512","address":"norangpura Ahmedabad","description":[""],"per_day_charge":"","monthly_charge":"","yearly_charge":"","resto_type":"","profile_image":"https://developmentalphawizz.com/connection/uploads/profile_pics/63d3ae04be28c.png"}]

class TiffinServiceResponse {
  TiffinServiceResponse({
      String? responseCode, 
      String? msg, 
      List<Data>? data,}){
    _responseCode = responseCode;
    _msg = msg;
    _data = data;
}

  TiffinServiceResponse.fromJson(dynamic json) {
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
TiffinServiceResponse copyWith({  String? responseCode,
  String? msg,
  List<Data>? data,
}) => TiffinServiceResponse(  responseCode: responseCode ?? _responseCode,
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

/// id : "132"
/// uname : "Test"
/// email : "Test@gmail.com"
/// mobile : "6545646546"
/// address : "Indore, Madhya Pradesh, India"
/// description : ["Aloo Gobhi","chana masala","Palak paneer","Chana masala","butter-brushed naan","Dal makhani"]
/// per_day_charge : "300"
/// monthly_charge : "2000"
/// yearly_charge : "5000"
/// resto_type : "non-veg"
/// profile_image : "https://developmentalphawizz.com/connection/uploads/profile_pics/640f1f94270ef.jpg"

class Data {
  Data({
      String? id, 
      String? uname, 
      String? email, 
      String? mobile, 
      String? address, 
      List<String>? description, 
      String? perDayCharge, 
      String? monthlyCharge, 
      String? yearlyCharge, 
      String? restoType, 
      String? profileImage,}){
    _id = id;
    _uname = uname;
    _email = email;
    _mobile = mobile;
    _address = address;
    _description = description;
    _perDayCharge = perDayCharge;
    _monthlyCharge = monthlyCharge;
    _yearlyCharge = yearlyCharge;
    _restoType = restoType;
    _profileImage = profileImage;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _uname = json['uname'];
    _email = json['email'];
    _mobile = json['mobile'];
    _address = json['address'];
    _description = json['description'] != null ? json['description'].cast<String>() : [];
    _perDayCharge = json['per_day_charge'];
    _monthlyCharge = json['monthly_charge'];
    _yearlyCharge = json['yearly_charge'];
    _restoType = json['resto_type'];
    _profileImage = json['profile_image'];
  }
  String? _id;
  String? _uname;
  String? _email;
  String? _mobile;
  String? _address;
  List<String>? _description;
  String? _perDayCharge;
  String? _monthlyCharge;
  String? _yearlyCharge;
  String? _restoType;
  String? _profileImage;
Data copyWith({  String? id,
  String? uname,
  String? email,
  String? mobile,
  String? address,
  List<String>? description,
  String? perDayCharge,
  String? monthlyCharge,
  String? yearlyCharge,
  String? restoType,
  String? profileImage,
}) => Data(  id: id ?? _id,
  uname: uname ?? _uname,
  email: email ?? _email,
  mobile: mobile ?? _mobile,
  address: address ?? _address,
  description: description ?? _description,
  perDayCharge: perDayCharge ?? _perDayCharge,
  monthlyCharge: monthlyCharge ?? _monthlyCharge,
  yearlyCharge: yearlyCharge ?? _yearlyCharge,
  restoType: restoType ?? _restoType,
  profileImage: profileImage ?? _profileImage,
);
  String? get id => _id;
  String? get uname => _uname;
  String? get email => _email;
  String? get mobile => _mobile;
  String? get address => _address;
  List<String>? get description => _description;
  String? get perDayCharge => _perDayCharge;
  String? get monthlyCharge => _monthlyCharge;
  String? get yearlyCharge => _yearlyCharge;
  String? get restoType => _restoType;
  String? get profileImage => _profileImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['uname'] = _uname;
    map['email'] = _email;
    map['mobile'] = _mobile;
    map['address'] = _address;
    map['description'] = _description;
    map['per_day_charge'] = _perDayCharge;
    map['monthly_charge'] = _monthlyCharge;
    map['yearly_charge'] = _yearlyCharge;
    map['resto_type'] = _restoType;
    map['profile_image'] = _profileImage;
    return map;
  }

}