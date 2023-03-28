/// response_code : "1"
/// message : "User Found"
/// user : {"username":"devesh singh parihar","email":"deveshalphawizz@gmail.com","mobile":"9993224906","profile_pic":"https://developmentalphawizz.com/connection/uploads/profile_pics/640ef5d938e61.jpg","profile_created":"01 Jan 1970"}
/// status : "success"

class MyProfileModel {
  MyProfileModel({
      String? responseCode, 
      String? message, 
      User? user, 
      String? status,}){
    _responseCode = responseCode;
    _message = message;
    _user = user;
    _status = status;
}

  MyProfileModel.fromJson(dynamic json) {
    _responseCode = json['response_code'];
    _message = json['message'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _status = json['status'];
  }
  String? _responseCode;
  String? _message;
  User? _user;
  String? _status;
MyProfileModel copyWith({  String? responseCode,
  String? message,
  User? user,
  String? status,
}) => MyProfileModel(  responseCode: responseCode ?? _responseCode,
  message: message ?? _message,
  user: user ?? _user,
  status: status ?? _status,
);
  String? get responseCode => _responseCode;
  String? get message => _message;
  User? get user => _user;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['response_code'] = _responseCode;
    map['message'] = _message;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['status'] = _status;
    return map;
  }

}

/// username : "devesh singh parihar"
/// email : "deveshalphawizz@gmail.com"
/// mobile : "9993224906"
/// profile_pic : "https://developmentalphawizz.com/connection/uploads/profile_pics/640ef5d938e61.jpg"
/// profile_created : "01 Jan 1970"

class User {
  User({
      String? username, 
      String? email, 
      String? mobile, 
      String? profilePic, 
      String? profileCreated,}){
    _username = username;
    _email = email;
    _mobile = mobile;
    _profilePic = profilePic;
    _profileCreated = profileCreated;
}

  User.fromJson(dynamic json) {
    _username = json['username'];
    _email = json['email'];
    _mobile = json['mobile'];
    _profilePic = json['profile_pic'];
    _profileCreated = json['profile_created'];
  }
  String? _username;
  String? _email;
  String? _mobile;
  String? _profilePic;
  String? _profileCreated;
User copyWith({  String? username,
  String? email,
  String? mobile,
  String? profilePic,
  String? profileCreated,
}) => User(  username: username ?? _username,
  email: email ?? _email,
  mobile: mobile ?? _mobile,
  profilePic: profilePic ?? _profilePic,
  profileCreated: profileCreated ?? _profileCreated,
);
  String? get username => _username;
  String? get email => _email;
  String? get mobile => _mobile;
  String? get profilePic => _profilePic;
  String? get profileCreated => _profileCreated;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = _username;
    map['email'] = _email;
    map['mobile'] = _mobile;
    map['profile_pic'] = _profilePic;
    map['profile_created'] = _profileCreated;
    return map;
  }

}