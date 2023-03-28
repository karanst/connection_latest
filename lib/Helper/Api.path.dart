class ApiPath{

  static const String baseUrl ="https://developmentalphawizz.com/connection/api/";
  static const String imgUrl = 'https://developmentalphawizz.com/connection/uploads/';

  static const String send_otp = baseUrl +'send_otp';
  static const String register = baseUrl +'register';
  static const String verify_otp = baseUrl +'verify_otp';
  static const String user_data = baseUrl +'user_data';
  static const String user_edit = baseUrl +'user_edit';
  static const String get_tiffin_vendor = baseUrl +'get_tiffin_vendor';
  static const String get_main_categories = baseUrl+ 'get_main_categories';
  static const String get_accodomation_list = baseUrl+ 'get_accodomation_list';
  static const String getCitiesUrl = baseUrl + 'get_city';
  static const String sendAccomodationRequest = '${baseUrl}create_accodomation';
  static const String getRideList = '${baseUrl}get_ride_list';
  static const String getPassengersList = '${baseUrl}get_passenger_list';

  static const String submitRideRequest = '${baseUrl}ride_booking';
  static const String submitPassengerRequest = '${baseUrl}passenger_booking';



}