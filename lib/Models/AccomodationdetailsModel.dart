/// response_code : "1"
/// msg : "Get Accodomation List"
/// data : [{"username":"devesh singh parihar","cityname":"Jaipur","id":"78","artist_name":"demo","category_id":"0","city":"42","sub_id":"0","services_image":["16787756910x0.jpg","16787756916-1.jpg"],"profile_image":"","mrp_price":"500","special_price":"500","v_id":"78","roll":"6","ser_desc":null,"service_status":"0","tax_status":"0","gst_amount":"0","available_for":"couple","no_of_person":"4","sharing":"private","room_type":"apartment","rent_type":"per person","utilities":"included","address":"indore mp","food_type":"veg","mobile":"8349922853","note":"demo","date":"2023-01-31"},{"username":"devesh singh parihar","cityname":"Jaipur","id":"77","artist_name":"demo","category_id":"0","city":"42","sub_id":"0","services_image":["16787756440x0.jpg","16787756446-1.jpg"],"profile_image":"","mrp_price":"500","special_price":"500","v_id":"78","roll":"6","ser_desc":null,"service_status":"0","tax_status":"0","gst_amount":"0","available_for":"couple","no_of_person":"4","sharing":"private","room_type":"apartment","rent_type":"per person","utilities":"included","address":"indore mp","food_type":"veg","mobile":"8349922853","note":"demo","date":"2023-01-31"},{"username":"devesh singh parihar","cityname":"Jaipur","id":"76","artist_name":"demo","category_id":"0","city":"42","sub_id":"0","services_image":["16787756420x0.jpg","16787756426-1.jpg"],"profile_image":"","mrp_price":"500","special_price":"500","v_id":"78","roll":"6","ser_desc":null,"service_status":"0","tax_status":"0","gst_amount":"0","available_for":"couple","no_of_person":"4","sharing":"private","room_type":"apartment","rent_type":"per person","utilities":"included","address":"indore mp","food_type":"veg","mobile":"8349922853","note":"demo","date":"2023-01-31"}]

class AccomodationdetailsModel {
  AccomodationdetailsModel({
      String? responseCode, 
      String? msg, 
      List<Data>? data,}){
    _responseCode = responseCode;
    _msg = msg;
    _data = data;
}

  AccomodationdetailsModel.fromJson(dynamic json) {
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
AccomodationdetailsModel copyWith({  String? responseCode,
  String? msg,
  List<Data>? data,
}) => AccomodationdetailsModel(  responseCode: responseCode ?? _responseCode,
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

/// username : "devesh singh parihar"
/// cityname : "Jaipur"
/// id : "78"
/// artist_name : "demo"
/// category_id : "0"
/// city : "42"
/// sub_id : "0"
/// services_image : ["16787756910x0.jpg","16787756916-1.jpg"]
/// profile_image : ""
/// mrp_price : "500"
/// special_price : "500"
/// v_id : "78"
/// roll : "6"
/// ser_desc : null
/// service_status : "0"
/// tax_status : "0"
/// gst_amount : "0"
/// available_for : "couple"
/// no_of_person : "4"
/// sharing : "private"
/// room_type : "apartment"
/// rent_type : "per person"
/// utilities : "included"
/// address : "indore mp"
/// food_type : "veg"
/// mobile : "8349922853"
/// note : "demo"
/// date : "2023-01-31"

class Data {
  Data({
      String? username, 
      String? cityname, 
      String? id, 
      String? artistName, 
      String? categoryId, 
      String? city, 
      String? subId, 
      List<String>? servicesImage, 
      String? profileImage, 
      String? mrpPrice, 
      String? specialPrice, 
      String? vId, 
      String? roll, 
      dynamic serDesc, 
      String? serviceStatus, 
      String? taxStatus, 
      String? gstAmount, 
      String? availableFor, 
      String? noOfPerson, 
      String? sharing, 
      String? roomType, 
      String? rentType, 
      String? utilities, 
      String? address, 
      String? foodType, 
      String? mobile, 
      String? note, 
      String? date,}){
    _username = username;
    _cityname = cityname;
    _id = id;
    _artistName = artistName;
    _categoryId = categoryId;
    _city = city;
    _subId = subId;
    _servicesImage = servicesImage;
    _profileImage = profileImage;
    _mrpPrice = mrpPrice;
    _specialPrice = specialPrice;
    _vId = vId;
    _roll = roll;
    _serDesc = serDesc;
    _serviceStatus = serviceStatus;
    _taxStatus = taxStatus;
    _gstAmount = gstAmount;
    _availableFor = availableFor;
    _noOfPerson = noOfPerson;
    _sharing = sharing;
    _roomType = roomType;
    _rentType = rentType;
    _utilities = utilities;
    _address = address;
    _foodType = foodType;
    _mobile = mobile;
    _note = note;
    _date = date;
}

  Data.fromJson(dynamic json) {
    _username = json['username'];
    _cityname = json['cityname'];
    _id = json['id'];
    _artistName = json['artist_name'];
    _categoryId = json['category_id'];
    _city = json['city'];
    _subId = json['sub_id'];
    _servicesImage = json['services_image'] != null ? json['services_image'].cast<String>() : [];
    _profileImage = json['profile_image'];
    _mrpPrice = json['mrp_price'];
    _specialPrice = json['special_price'];
    _vId = json['v_id'];
    _roll = json['roll'];
    _serDesc = json['ser_desc'];
    _serviceStatus = json['service_status'];
    _taxStatus = json['tax_status'];
    _gstAmount = json['gst_amount'];
    _availableFor = json['available_for'];
    _noOfPerson = json['no_of_person'];
    _sharing = json['sharing'];
    _roomType = json['room_type'];
    _rentType = json['rent_type'];
    _utilities = json['utilities'];
    _address = json['address'];
    _foodType = json['food_type'];
    _mobile = json['mobile'];
    _note = json['note'];
    _date = json['date'];
  }
  String? _username;
  String? _cityname;
  String? _id;
  String? _artistName;
  String? _categoryId;
  String? _city;
  String? _subId;
  List<String>? _servicesImage;
  String? _profileImage;
  String? _mrpPrice;
  String? _specialPrice;
  String? _vId;
  String? _roll;
  dynamic _serDesc;
  String? _serviceStatus;
  String? _taxStatus;
  String? _gstAmount;
  String? _availableFor;
  String? _noOfPerson;
  String? _sharing;
  String? _roomType;
  String? _rentType;
  String? _utilities;
  String? _address;
  String? _foodType;
  String? _mobile;
  String? _note;
  String? _date;
Data copyWith({  String? username,
  String? cityname,
  String? id,
  String? artistName,
  String? categoryId,
  String? city,
  String? subId,
  List<String>? servicesImage,
  String? profileImage,
  String? mrpPrice,
  String? specialPrice,
  String? vId,
  String? roll,
  dynamic serDesc,
  String? serviceStatus,
  String? taxStatus,
  String? gstAmount,
  String? availableFor,
  String? noOfPerson,
  String? sharing,
  String? roomType,
  String? rentType,
  String? utilities,
  String? address,
  String? foodType,
  String? mobile,
  String? note,
  String? date,
}) => Data(  username: username ?? _username,
  cityname: cityname ?? _cityname,
  id: id ?? _id,
  artistName: artistName ?? _artistName,
  categoryId: categoryId ?? _categoryId,
  city: city ?? _city,
  subId: subId ?? _subId,
  servicesImage: servicesImage ?? _servicesImage,
  profileImage: profileImage ?? _profileImage,
  mrpPrice: mrpPrice ?? _mrpPrice,
  specialPrice: specialPrice ?? _specialPrice,
  vId: vId ?? _vId,
  roll: roll ?? _roll,
  serDesc: serDesc ?? _serDesc,
  serviceStatus: serviceStatus ?? _serviceStatus,
  taxStatus: taxStatus ?? _taxStatus,
  gstAmount: gstAmount ?? _gstAmount,
  availableFor: availableFor ?? _availableFor,
  noOfPerson: noOfPerson ?? _noOfPerson,
  sharing: sharing ?? _sharing,
  roomType: roomType ?? _roomType,
  rentType: rentType ?? _rentType,
  utilities: utilities ?? _utilities,
  address: address ?? _address,
  foodType: foodType ?? _foodType,
  mobile: mobile ?? _mobile,
  note: note ?? _note,
  date: date ?? _date,
);
  String? get username => _username;
  String? get cityname => _cityname;
  String? get id => _id;
  String? get artistName => _artistName;
  String? get categoryId => _categoryId;
  String? get city => _city;
  String? get subId => _subId;
  List<String>? get servicesImage => _servicesImage;
  String? get profileImage => _profileImage;
  String? get mrpPrice => _mrpPrice;
  String? get specialPrice => _specialPrice;
  String? get vId => _vId;
  String? get roll => _roll;
  dynamic get serDesc => _serDesc;
  String? get serviceStatus => _serviceStatus;
  String? get taxStatus => _taxStatus;
  String? get gstAmount => _gstAmount;
  String? get availableFor => _availableFor;
  String? get noOfPerson => _noOfPerson;
  String? get sharing => _sharing;
  String? get roomType => _roomType;
  String? get rentType => _rentType;
  String? get utilities => _utilities;
  String? get address => _address;
  String? get foodType => _foodType;
  String? get mobile => _mobile;
  String? get note => _note;
  String? get date => _date;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = _username;
    map['cityname'] = _cityname;
    map['id'] = _id;
    map['artist_name'] = _artistName;
    map['category_id'] = _categoryId;
    map['city'] = _city;
    map['sub_id'] = _subId;
    map['services_image'] = _servicesImage;
    map['profile_image'] = _profileImage;
    map['mrp_price'] = _mrpPrice;
    map['special_price'] = _specialPrice;
    map['v_id'] = _vId;
    map['roll'] = _roll;
    map['ser_desc'] = _serDesc;
    map['service_status'] = _serviceStatus;
    map['tax_status'] = _taxStatus;
    map['gst_amount'] = _gstAmount;
    map['available_for'] = _availableFor;
    map['no_of_person'] = _noOfPerson;
    map['sharing'] = _sharing;
    map['room_type'] = _roomType;
    map['rent_type'] = _rentType;
    map['utilities'] = _utilities;
    map['address'] = _address;
    map['food_type'] = _foodType;
    map['mobile'] = _mobile;
    map['note'] = _note;
    map['date'] = _date;
    return map;
  }

}