/// response_code : "1"
/// msg : "Get Ride List Successfully"
/// data : [{"id":"377","user_id":"80","pickup_address":"vijay nagar indore","drop_address":"indore mp","type":null,"departure_time":null,"departure_date":null,"return_date":null,"flight_number":null,"package":null,"promo_code":null,"distance":null,"amount":null,"paid_amount":"0","address":null,"transfer":null,"item_status":null,"transaction":null,"payment_media":null,"km":null,"timetype":null,"assigned_for":"0","is_paid_advance":"0","status":"0","latitude":"45654654645","longitude":"45456456456","drop_latitude":"4654654654","drop_longitude":"66465445","booking_type":"urgent","accept_reject":"0","created_date":"0000-00-00","reason":"","surge_amount":"0","gst_amount":"","base_fare":"","time_amount":"","rate_per_km":"","admin_commision":"","total_time":"","cancel_charge":"","car_categories":"0","taxi_id":"","hours":"","booking_time":"00:00:00","shareing_type":"","sharing_user_id":"0","promo_discount":"","payment_status":"","bookings_type":"passenger_booking","category":null,"unit":null,"date_added":"13-09-2023","passenger_name":"dev singh","mobile":"8349922853","no_of_person":"1","note":"demo","sharing":"private"}]

class RideListModel {
  RideListModel({
      String? responseCode, 
      String? msg, 
      List<Data>? data,}){
    _responseCode = responseCode;
    _msg = msg;
    _data = data;
}

  RideListModel.fromJson(dynamic json) {
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
RideListModel copyWith({  String? responseCode,
  String? msg,
  List<Data>? data,
}) => RideListModel(  responseCode: responseCode ?? _responseCode,
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

/// id : "377"
/// user_id : "80"
/// pickup_address : "vijay nagar indore"
/// drop_address : "indore mp"
/// type : null
/// departure_time : null
/// departure_date : null
/// return_date : null
/// flight_number : null
/// package : null
/// promo_code : null
/// distance : null
/// amount : null
/// paid_amount : "0"
/// address : null
/// transfer : null
/// item_status : null
/// transaction : null
/// payment_media : null
/// km : null
/// timetype : null
/// assigned_for : "0"
/// is_paid_advance : "0"
/// status : "0"
/// latitude : "45654654645"
/// longitude : "45456456456"
/// drop_latitude : "4654654654"
/// drop_longitude : "66465445"
/// booking_type : "urgent"
/// accept_reject : "0"
/// created_date : "0000-00-00"
/// reason : ""
/// surge_amount : "0"
/// gst_amount : ""
/// base_fare : ""
/// time_amount : ""
/// rate_per_km : ""
/// admin_commision : ""
/// total_time : ""
/// cancel_charge : ""
/// car_categories : "0"
/// taxi_id : ""
/// hours : ""
/// booking_time : "00:00:00"
/// shareing_type : ""
/// sharing_user_id : "0"
/// promo_discount : ""
/// payment_status : ""
/// bookings_type : "passenger_booking"
/// category : null
/// unit : null
/// date_added : "13-09-2023"
/// passenger_name : "dev singh"
/// mobile : "8349922853"
/// no_of_person : "1"
/// note : "demo"
/// sharing : "private"

class Data {
  Data({
      String? id, 
      String? userId, 
      String? pickupAddress, 
      String? dropAddress, 
      dynamic type, 
      dynamic departureTime, 
      dynamic departureDate, 
      dynamic returnDate, 
      dynamic flightNumber, 
      dynamic package, 
      dynamic promoCode, 
      dynamic distance, 
      dynamic amount, 
      String? paidAmount, 
      dynamic address, 
      dynamic transfer, 
      dynamic itemStatus, 
      dynamic transaction, 
      dynamic paymentMedia, 
      dynamic km, 
      dynamic timetype, 
      String? assignedFor, 
      String? isPaidAdvance, 
      String? status, 
      String? latitude, 
      String? longitude, 
      String? dropLatitude, 
      String? dropLongitude, 
      String? bookingType, 
      String? acceptReject, 
      String? createdDate, 
      String? reason, 
      String? surgeAmount, 
      String? gstAmount, 
      String? baseFare, 
      String? timeAmount, 
      String? ratePerKm, 
      String? adminCommision, 
      String? totalTime, 
      String? cancelCharge, 
      String? carCategories, 
      String? taxiId, 
      String? hours, 
      String? bookingTime, 
      String? shareingType, 
      String? sharingUserId, 
      String? promoDiscount, 
      String? paymentStatus, 
      String? bookingsType, 
      dynamic category, 
      dynamic unit, 
      String? dateAdded, 
      String? passengerName, 
      String? mobile, 
      String? noOfPerson, 
      String? note, 
      String? sharing,}){
    _id = id;
    _userId = userId;
    _pickupAddress = pickupAddress;
    _dropAddress = dropAddress;
    _type = type;
    _departureTime = departureTime;
    _departureDate = departureDate;
    _returnDate = returnDate;
    _flightNumber = flightNumber;
    _package = package;
    _promoCode = promoCode;
    _distance = distance;
    _amount = amount;
    _paidAmount = paidAmount;
    _address = address;
    _transfer = transfer;
    _itemStatus = itemStatus;
    _transaction = transaction;
    _paymentMedia = paymentMedia;
    _km = km;
    _timetype = timetype;
    _assignedFor = assignedFor;
    _isPaidAdvance = isPaidAdvance;
    _status = status;
    _latitude = latitude;
    _longitude = longitude;
    _dropLatitude = dropLatitude;
    _dropLongitude = dropLongitude;
    _bookingType = bookingType;
    _acceptReject = acceptReject;
    _createdDate = createdDate;
    _reason = reason;
    _surgeAmount = surgeAmount;
    _gstAmount = gstAmount;
    _baseFare = baseFare;
    _timeAmount = timeAmount;
    _ratePerKm = ratePerKm;
    _adminCommision = adminCommision;
    _totalTime = totalTime;
    _cancelCharge = cancelCharge;
    _carCategories = carCategories;
    _taxiId = taxiId;
    _hours = hours;
    _bookingTime = bookingTime;
    _shareingType = shareingType;
    _sharingUserId = sharingUserId;
    _promoDiscount = promoDiscount;
    _paymentStatus = paymentStatus;
    _bookingsType = bookingsType;
    _category = category;
    _unit = unit;
    _dateAdded = dateAdded;
    _passengerName = passengerName;
    _mobile = mobile;
    _noOfPerson = noOfPerson;
    _note = note;
    _sharing = sharing;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _pickupAddress = json['pickup_address'];
    _dropAddress = json['drop_address'];
    _type = json['type'];
    _departureTime = json['departure_time'];
    _departureDate = json['departure_date'];
    _returnDate = json['return_date'];
    _flightNumber = json['flight_number'];
    _package = json['package'];
    _promoCode = json['promo_code'];
    _distance = json['distance'];
    _amount = json['amount'];
    _paidAmount = json['paid_amount'];
    _address = json['address'];
    _transfer = json['transfer'];
    _itemStatus = json['item_status'];
    _transaction = json['transaction'];
    _paymentMedia = json['payment_media'];
    _km = json['km'];
    _timetype = json['timetype'];
    _assignedFor = json['assigned_for'];
    _isPaidAdvance = json['is_paid_advance'];
    _status = json['status'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _dropLatitude = json['drop_latitude'];
    _dropLongitude = json['drop_longitude'];
    _bookingType = json['booking_type'];
    _acceptReject = json['accept_reject'];
    _createdDate = json['created_date'];
    _reason = json['reason'];
    _surgeAmount = json['surge_amount'];
    _gstAmount = json['gst_amount'];
    _baseFare = json['base_fare'];
    _timeAmount = json['time_amount'];
    _ratePerKm = json['rate_per_km'];
    _adminCommision = json['admin_commision'];
    _totalTime = json['total_time'];
    _cancelCharge = json['cancel_charge'];
    _carCategories = json['car_categories'];
    _taxiId = json['taxi_id'];
    _hours = json['hours'];
    _bookingTime = json['booking_time'];
    _shareingType = json['shareing_type'];
    _sharingUserId = json['sharing_user_id'];
    _promoDiscount = json['promo_discount'];
    _paymentStatus = json['payment_status'];
    _bookingsType = json['bookings_type'];
    _category = json['category'];
    _unit = json['unit'];
    _dateAdded = json['date_added'];
    _passengerName = json['passenger_name'];
    _mobile = json['mobile'];
    _noOfPerson = json['no_of_person'];
    _note = json['note'];
    _sharing = json['sharing'];
  }
  String? _id;
  String? _userId;
  String? _pickupAddress;
  String? _dropAddress;
  dynamic _type;
  dynamic _departureTime;
  dynamic _departureDate;
  dynamic _returnDate;
  dynamic _flightNumber;
  dynamic _package;
  dynamic _promoCode;
  dynamic _distance;
  dynamic _amount;
  String? _paidAmount;
  dynamic _address;
  dynamic _transfer;
  dynamic _itemStatus;
  dynamic _transaction;
  dynamic _paymentMedia;
  dynamic _km;
  dynamic _timetype;
  String? _assignedFor;
  String? _isPaidAdvance;
  String? _status;
  String? _latitude;
  String? _longitude;
  String? _dropLatitude;
  String? _dropLongitude;
  String? _bookingType;
  String? _acceptReject;
  String? _createdDate;
  String? _reason;
  String? _surgeAmount;
  String? _gstAmount;
  String? _baseFare;
  String? _timeAmount;
  String? _ratePerKm;
  String? _adminCommision;
  String? _totalTime;
  String? _cancelCharge;
  String? _carCategories;
  String? _taxiId;
  String? _hours;
  String? _bookingTime;
  String? _shareingType;
  String? _sharingUserId;
  String? _promoDiscount;
  String? _paymentStatus;
  String? _bookingsType;
  dynamic _category;
  dynamic _unit;
  String? _dateAdded;
  String? _passengerName;
  String? _mobile;
  String? _noOfPerson;
  String? _note;
  String? _sharing;
Data copyWith({  String? id,
  String? userId,
  String? pickupAddress,
  String? dropAddress,
  dynamic type,
  dynamic departureTime,
  dynamic departureDate,
  dynamic returnDate,
  dynamic flightNumber,
  dynamic package,
  dynamic promoCode,
  dynamic distance,
  dynamic amount,
  String? paidAmount,
  dynamic address,
  dynamic transfer,
  dynamic itemStatus,
  dynamic transaction,
  dynamic paymentMedia,
  dynamic km,
  dynamic timetype,
  String? assignedFor,
  String? isPaidAdvance,
  String? status,
  String? latitude,
  String? longitude,
  String? dropLatitude,
  String? dropLongitude,
  String? bookingType,
  String? acceptReject,
  String? createdDate,
  String? reason,
  String? surgeAmount,
  String? gstAmount,
  String? baseFare,
  String? timeAmount,
  String? ratePerKm,
  String? adminCommision,
  String? totalTime,
  String? cancelCharge,
  String? carCategories,
  String? taxiId,
  String? hours,
  String? bookingTime,
  String? shareingType,
  String? sharingUserId,
  String? promoDiscount,
  String? paymentStatus,
  String? bookingsType,
  dynamic category,
  dynamic unit,
  String? dateAdded,
  String? passengerName,
  String? mobile,
  String? noOfPerson,
  String? note,
  String? sharing,
}) => Data(  id: id ?? _id,
  userId: userId ?? _userId,
  pickupAddress: pickupAddress ?? _pickupAddress,
  dropAddress: dropAddress ?? _dropAddress,
  type: type ?? _type,
  departureTime: departureTime ?? _departureTime,
  departureDate: departureDate ?? _departureDate,
  returnDate: returnDate ?? _returnDate,
  flightNumber: flightNumber ?? _flightNumber,
  package: package ?? _package,
  promoCode: promoCode ?? _promoCode,
  distance: distance ?? _distance,
  amount: amount ?? _amount,
  paidAmount: paidAmount ?? _paidAmount,
  address: address ?? _address,
  transfer: transfer ?? _transfer,
  itemStatus: itemStatus ?? _itemStatus,
  transaction: transaction ?? _transaction,
  paymentMedia: paymentMedia ?? _paymentMedia,
  km: km ?? _km,
  timetype: timetype ?? _timetype,
  assignedFor: assignedFor ?? _assignedFor,
  isPaidAdvance: isPaidAdvance ?? _isPaidAdvance,
  status: status ?? _status,
  latitude: latitude ?? _latitude,
  longitude: longitude ?? _longitude,
  dropLatitude: dropLatitude ?? _dropLatitude,
  dropLongitude: dropLongitude ?? _dropLongitude,
  bookingType: bookingType ?? _bookingType,
  acceptReject: acceptReject ?? _acceptReject,
  createdDate: createdDate ?? _createdDate,
  reason: reason ?? _reason,
  surgeAmount: surgeAmount ?? _surgeAmount,
  gstAmount: gstAmount ?? _gstAmount,
  baseFare: baseFare ?? _baseFare,
  timeAmount: timeAmount ?? _timeAmount,
  ratePerKm: ratePerKm ?? _ratePerKm,
  adminCommision: adminCommision ?? _adminCommision,
  totalTime: totalTime ?? _totalTime,
  cancelCharge: cancelCharge ?? _cancelCharge,
  carCategories: carCategories ?? _carCategories,
  taxiId: taxiId ?? _taxiId,
  hours: hours ?? _hours,
  bookingTime: bookingTime ?? _bookingTime,
  shareingType: shareingType ?? _shareingType,
  sharingUserId: sharingUserId ?? _sharingUserId,
  promoDiscount: promoDiscount ?? _promoDiscount,
  paymentStatus: paymentStatus ?? _paymentStatus,
  bookingsType: bookingsType ?? _bookingsType,
  category: category ?? _category,
  unit: unit ?? _unit,
  dateAdded: dateAdded ?? _dateAdded,
  passengerName: passengerName ?? _passengerName,
  mobile: mobile ?? _mobile,
  noOfPerson: noOfPerson ?? _noOfPerson,
  note: note ?? _note,
  sharing: sharing ?? _sharing,
);
  String? get id => _id;
  String? get userId => _userId;
  String? get pickupAddress => _pickupAddress;
  String? get dropAddress => _dropAddress;
  dynamic get type => _type;
  dynamic get departureTime => _departureTime;
  dynamic get departureDate => _departureDate;
  dynamic get returnDate => _returnDate;
  dynamic get flightNumber => _flightNumber;
  dynamic get package => _package;
  dynamic get promoCode => _promoCode;
  dynamic get distance => _distance;
  dynamic get amount => _amount;
  String? get paidAmount => _paidAmount;
  dynamic get address => _address;
  dynamic get transfer => _transfer;
  dynamic get itemStatus => _itemStatus;
  dynamic get transaction => _transaction;
  dynamic get paymentMedia => _paymentMedia;
  dynamic get km => _km;
  dynamic get timetype => _timetype;
  String? get assignedFor => _assignedFor;
  String? get isPaidAdvance => _isPaidAdvance;
  String? get status => _status;
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  String? get dropLatitude => _dropLatitude;
  String? get dropLongitude => _dropLongitude;
  String? get bookingType => _bookingType;
  String? get acceptReject => _acceptReject;
  String? get createdDate => _createdDate;
  String? get reason => _reason;
  String? get surgeAmount => _surgeAmount;
  String? get gstAmount => _gstAmount;
  String? get baseFare => _baseFare;
  String? get timeAmount => _timeAmount;
  String? get ratePerKm => _ratePerKm;
  String? get adminCommision => _adminCommision;
  String? get totalTime => _totalTime;
  String? get cancelCharge => _cancelCharge;
  String? get carCategories => _carCategories;
  String? get taxiId => _taxiId;
  String? get hours => _hours;
  String? get bookingTime => _bookingTime;
  String? get shareingType => _shareingType;
  String? get sharingUserId => _sharingUserId;
  String? get promoDiscount => _promoDiscount;
  String? get paymentStatus => _paymentStatus;
  String? get bookingsType => _bookingsType;
  dynamic get category => _category;
  dynamic get unit => _unit;
  String? get dateAdded => _dateAdded;
  String? get passengerName => _passengerName;
  String? get mobile => _mobile;
  String? get noOfPerson => _noOfPerson;
  String? get note => _note;
  String? get sharing => _sharing;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['pickup_address'] = _pickupAddress;
    map['drop_address'] = _dropAddress;
    map['type'] = _type;
    map['departure_time'] = _departureTime;
    map['departure_date'] = _departureDate;
    map['return_date'] = _returnDate;
    map['flight_number'] = _flightNumber;
    map['package'] = _package;
    map['promo_code'] = _promoCode;
    map['distance'] = _distance;
    map['amount'] = _amount;
    map['paid_amount'] = _paidAmount;
    map['address'] = _address;
    map['transfer'] = _transfer;
    map['item_status'] = _itemStatus;
    map['transaction'] = _transaction;
    map['payment_media'] = _paymentMedia;
    map['km'] = _km;
    map['timetype'] = _timetype;
    map['assigned_for'] = _assignedFor;
    map['is_paid_advance'] = _isPaidAdvance;
    map['status'] = _status;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['drop_latitude'] = _dropLatitude;
    map['drop_longitude'] = _dropLongitude;
    map['booking_type'] = _bookingType;
    map['accept_reject'] = _acceptReject;
    map['created_date'] = _createdDate;
    map['reason'] = _reason;
    map['surge_amount'] = _surgeAmount;
    map['gst_amount'] = _gstAmount;
    map['base_fare'] = _baseFare;
    map['time_amount'] = _timeAmount;
    map['rate_per_km'] = _ratePerKm;
    map['admin_commision'] = _adminCommision;
    map['total_time'] = _totalTime;
    map['cancel_charge'] = _cancelCharge;
    map['car_categories'] = _carCategories;
    map['taxi_id'] = _taxiId;
    map['hours'] = _hours;
    map['booking_time'] = _bookingTime;
    map['shareing_type'] = _shareingType;
    map['sharing_user_id'] = _sharingUserId;
    map['promo_discount'] = _promoDiscount;
    map['payment_status'] = _paymentStatus;
    map['bookings_type'] = _bookingsType;
    map['category'] = _category;
    map['unit'] = _unit;
    map['date_added'] = _dateAdded;
    map['passenger_name'] = _passengerName;
    map['mobile'] = _mobile;
    map['no_of_person'] = _noOfPerson;
    map['note'] = _note;
    map['sharing'] = _sharing;
    return map;
  }

}