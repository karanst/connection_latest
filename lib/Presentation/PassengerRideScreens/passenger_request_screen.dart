import 'package:connection/Helper/Api.path.dart';
import 'package:connection/Presentation/AppBar/CustomAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../Helper/CustomColors.dart';
import '../buttons/CustomButton.dart';

class PassengerRequestScreen extends StatefulWidget {
  const PassengerRequestScreen({Key? key}) : super(key: key);

  @override
  State<PassengerRequestScreen> createState() => _PassengerRequestScreenState();
}

class _PassengerRequestScreenState extends State<PassengerRequestScreen> {
  DateTime date = DateTime(2016, 10, 26);
  DateTime time = DateTime(2016, 5, 10, 22, 35);
  DateTime dateTime = DateTime(2016, 8, 3, 17, 45);

  // This function displays a CupertinoModalPopup with a reasonable fixed height
  // which hosts CupertinoDatePicker.
  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
          height: 216,
          padding: const EdgeInsets.only(top: 6.0),
          // The Bottom margin is provided to align the popup above the system
          // navigation bar.
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          // Provide a background color for the popup.
          color: CupertinoColors.systemBackground.resolveFrom(context),
          // Use a SafeArea widget to avoid system overlaps.
          child: SafeArea(
            top: false,
            child: child,
          ),
        ));
  }
  int _value1= 1;
  String sharing = 'private';
  int _value2= 1;
  String booking = 'urgent';

  TextEditingController pickUpController = TextEditingController();
  TextEditingController dropController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  TextEditingController noPersonController = TextEditingController();

  submitRideRequest() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('user_id');

    var headers = {
      'Cookie': 'ci_session=43aff87f68a58e20a70c2d26db1788da55160f34'
    };
    var request = http.MultipartRequest('POST', Uri.parse(ApiPath.submitPassengerRequest));
    request.fields.addAll({
      'pickup_address':pickUpController.text.toString(),
      'drop_address': dropController.text.toString(),
      'user_id': userId.toString(),
      'drop_latitude':'44',
      'drop_longitude':'45',
      'pickup_longitude':'46',
      'pickup_latitude':'47',
      'passenger_name': nameController.text.toString(),
      'mobile': mobileController.text.toString(),
      'no_of_person': noPersonController.text.toString(),
      'date': '${date.month}-${date.day}-${date.year}',
      'note': notesController.text.toString(),
      'sharing': sharing.toString(),
      'booking_type': booking.toString()

    });

    print("this is accodmodation request ${request.fields.toString()}  and ${request.files.toString()} ");
    // request.files.add(await http.MultipartFile.fromPath('services_image[]', '/C:/Users/Alphawizz/Downloads/Screenshot_20230310-193717.png'));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Fluttertoast.showToast(msg: "Request sent Success!");
      Navigator.pop(context);
      print(await response.stream.bytesToString());
    }
    else {
      Fluttertoast.showToast(msg: "Something went wrong!");
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            Stack(
              children: [
                Container(
                    height: MediaQuery.of(context).size.height/3,
                    decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/rideScreenimage3.png'),fit:BoxFit.fill)),
                    child: CustomAppbar2(Text2: 'New Request info',)
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 110.0,left: 5,right: 5),
                  child: Container(
                    width:MediaQuery.of(context).size.width/1.02,
                    // height:MediaQuery.of(context).size.height/1,
                    child: Card(
                      elevation: 40,
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              // Navigator.push(context, MaterialPageRoute(builder: (context)=>RideScreen2()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10.0, left: 10, right: 10),
                              child: Container(
                                // height: 135,
                                // width: 420,
                                child: Center(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Material(
                                        // color: splashcolor,
                                        elevation: 1,
                                        borderRadius: BorderRadius.circular(10),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width /
                                              1.0,
                                          height: 60,
                                          child: TextFormField(
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Enter Name';
                                              }
                                              return null;
                                            },
                                            // controller: senderNameController,
                                            decoration: InputDecoration(
                                              border: const OutlineInputBorder(
                                                  borderSide: BorderSide.none),
                                              hintText: " Passenger Name",
                                              prefixIcon: Image.asset(
                                                'assets/images/usericon.png',
                                                scale: 5.1,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Material(
                                        // color: splashcolor,
                                        elevation: 1,
                                        borderRadius: BorderRadius.circular(10),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width /
                                              1.0,
                                          height: 60,
                                          child: TextFormField(
                                            maxLength: 10,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return "Phone No.";
                                              }
                                              return null;
                                            },
                                            // controller: senderMobileController,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              border: const OutlineInputBorder(
                                                  borderSide: BorderSide.none),
                                              hintText: "Phone No.",
                                              counterText: "",
                                              prefixIcon: Image.asset(
                                                'assets/images/callicon.png',
                                                scale: 5.1,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Material(
                                        // color: splashcolor,
                                        elevation: 1,
                                        borderRadius: BorderRadius.circular(10),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width /
                                              1.0,
                                          height: 60,
                                          child: TextFormField(
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Enter Name';
                                              }
                                              return null;
                                            },
                                            // controller: senderNameController,
                                            decoration: InputDecoration(
                                              border: const OutlineInputBorder(
                                                  borderSide: BorderSide.none),
                                              hintText: "Number Of Person",
                                              prefixIcon: Image.asset(
                                                'assets/images/usericon.png',
                                                scale: 5.1,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Material(
                                        // color: splashcolor,
                                        elevation: 1,
                                        borderRadius: BorderRadius.circular(10),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width /
                                              1.0,
                                          height: 60,
                                          child: TextFormField(
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Enter Name';
                                              }
                                              return null;
                                            },
                                            // controller: senderNameController,
                                            decoration: InputDecoration(
                                              border: const OutlineInputBorder(
                                                  borderSide: BorderSide.none),
                                              hintText: "Address",
                                              prefixIcon: Image.asset(
                                                'assets/images/location.png',
                                                scale: 5.1,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      // _addressField(context),
                                      // Material(
                                      //   // color: splashcolor,
                                      //   elevation: 1,
                                      //   borderRadius: BorderRadius.circular(10),
                                      //   child: Container(
                                      //     width: MediaQuery.of(context)
                                      //             .size
                                      //             .width /
                                      //         1.0,
                                      //     height: 60,
                                      //     child: TextFormField(
                                      //       validator: (value) {
                                      //         if (value == null ||
                                      //             value.isEmpty) {
                                      //           return 'Please Enter Sender Address';
                                      //         }
                                      //         return null;
                                      //       },
                                      //       readOnly: true,
                                      //       // controller: senderAddressCtr,
                                      //       maxLines: 1,
                                      //       onTap: () {
                                      //         // _getLocation1();
                                      //       },
                                      //       textInputAction:
                                      //           TextInputAction.next,
                                      //       decoration: InputDecoration(
                                      //         border: const OutlineInputBorder(
                                      //             borderSide: BorderSide.none),
                                      //         hintText: "Enter Date",
                                      //         prefixIcon: Image.asset(
                                      //           'assets/images/dateicon.png',
                                      //           scale: 5.5,
                                      //         ),
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),
                                      // const  SizedBox(
                                      //     height: 20,
                                      //   ),
                                      Material(
                                        // color: splashcolor,
                                        elevation: 1,
                                        borderRadius: BorderRadius.circular(10),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width /
                                              1.0,
                                          height: 80,
                                          child: TextFormField(
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'This Field Is Required';
                                              }
                                              return null;
                                            },
                                            // controller: senderfulladdressCtr,
                                            decoration: InputDecoration(
                                              border: const OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                              ),
                                              hintText: "Notes",
                                              prefixIcon: Image.asset(
                                                'assets/images/editenotes.png',
                                                scale: 5.7,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Material(
                                        // color: splashcolor,
                                        elevation: 1,
                                        borderRadius: BorderRadius.circular(10),
                                        child: Container(
                                            width: MediaQuery.of(context).size.width / 1.0,
                                            height: 60,
                                            child: Row(
                                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [
                                                Image.asset(
                                                  "assets/images/carusr.png",
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                Text('Sharing:'),
                                                Row(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Radio(
                                                            value: 1,
                                                            fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
                                                            groupValue: _value1,
                                                            onChanged: (int? value) {
                                                              setState(() {
                                                                _value1 = value!;
                                                                sharing = "private";
                                                              });
                                                            }),
                                                        Text(
                                                          "Private",
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Radio(
                                                            fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
                                                            value: 2,
                                                            groupValue: _value1,
                                                            onChanged: (int? value) {
                                                              setState(() {
                                                                _value1 = value!;
                                                                sharing = "shared";
                                                              });
                                                            }),

                                                        Text(
                                                          "Shared",
                                                        ),

                                                      ],
                                                    ),
                                                  ],
                                                ),

                                              ],
                                            )),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Material(
                                        // color: splashcolor,
                                        elevation: 1,
                                        borderRadius: BorderRadius.circular(10),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width /
                                              1.0,
                                          // height: 60,
                                          // child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Expanded(
                                            child: Column(
                                              children: [
                                                Row(
                                                  // mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Image.asset(
                                                      "assets/images/caricon.png",
                                                      height: 30,
                                                      width: 30,
                                                    ),
                                                    Text('Booking:'),
                                                    Row(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Radio(
                                                                value: 1,
                                                                fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
                                                                groupValue: _value2,
                                                                onChanged: (int? value) {
                                                                  setState(() {
                                                                    _value2 = value!;
                                                                    booking = "urgent";
                                                                  });
                                                                }),
                                                            Text(
                                                              "Urgent",
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Radio(
                                                                fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
                                                                value: 2,
                                                                groupValue: _value2,
                                                                onChanged: (int? value) {
                                                                  setState(() {
                                                                    _value2 = value!;
                                                                    booking = "flexible";
                                                                  });
                                                                }),

                                                            Text(
                                                              "Flexible",
                                                            ),

                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    // Text('Scheduled'),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Radio(
                                                        fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
                                                        value: 3,
                                                        groupValue: _value2,
                                                        onChanged: (int? value) {
                                                          setState(() {
                                                            _value2 = value!;
                                                            booking = "scheduled";
                                                          });
                                                        }),

                                                    Text(
                                                      "Scheduled",
                                                    ),

                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              _showDialog(
                                                CupertinoDatePicker(
                                                  initialDateTime: date,
                                                  mode: CupertinoDatePickerMode
                                                      .date,
                                                  use24hFormat: true,
                                                  // This is called when the user changes the date.
                                                  onDateTimeChanged:
                                                      (DateTime newDate) {
                                                    setState(
                                                            () => date = newDate);
                                                  },
                                                ),
                                              );
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(20),
                                                  color: CustomColors
                                                      .AppbarColor1),
                                              child: Center(
                                                  child: Text(
                                                    'Date',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )),
                                              height: 30,
                                              width: 60,
                                            ),
                                          ),
                                          // CupertinoButton(
                                          //   // Display a CupertinoDatePicker in date picker mode.
                                          //   onPressed: () => _showDialog(
                                          //     CupertinoDatePicker(
                                          //       initialDateTime: date,
                                          //       mode: CupertinoDatePickerMode.date,
                                          //       use24hFormat: true,
                                          //       // This is called when the user changes the date.
                                          //       onDateTimeChanged: (DateTime newDate) {
                                          //         setState(() => date = newDate);
                                          //       },
                                          //     ),
                                          //   ),
                                          //   // In this example, the date is formatted manually. You can
                                          //   // use the intl package to format the value based on the
                                          //   // user's locale settings.
                                          //   child: Text(
                                          //     '${date.month}-${date.day}-${date.year}',
                                          //     style: const TextStyle(
                                          //       fontSize: 22.0,
                                          //     ),
                                          //   ),
                                          // ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              _showDialog(
                                                CupertinoDatePicker(
                                                  initialDateTime: time,
                                                  mode: CupertinoDatePickerMode
                                                      .time,
                                                  use24hFormat: true,
                                                  // This is called when the user changes the time.
                                                  onDateTimeChanged:
                                                      (DateTime newTime) {
                                                    setState(
                                                            () => time = newTime);
                                                  },
                                                ),
                                              );
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(20),
                                                  color: CustomColors
                                                      .AppbarColor1),
                                              child: Center(
                                                  child: Text(
                                                    'Time',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )),
                                              height: 30,
                                              width: 60,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '${date.month}-${date.day}-${date.year}',
                                            style: const TextStyle(
                                              fontSize: 16.0,
                                            ),
                                          ),
                                          Text(
                                            '${time.hour}:${time.minute}',
                                            style: const TextStyle(
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      CustomAppBtn(
                                        height: 50,
                                        width: 300,
                                        title: 'Post Request',
                                        onPress: () {
                                          if(nameController.text.isNotEmpty &&
                                              notesController.text.isNotEmpty &&
                                              mobileController.text.isNotEmpty &&
                                              noPersonController.text.isNotEmpty &&
                                              pickUpController.text.isNotEmpty &&
                                              dropController.text.isNotEmpty &&
                                              sharing != '' && booking != ''
                                          ){
                                            submitRideRequest();
                                          }else{
                                            Fluttertoast.showToast(msg: "All fields are required!");
                                          }

                                          // Navigator.push(context,
                                          //     MaterialPageRoute(builder: (context) => PassengerRide()));
                                        },
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                          // Image.asset('assets/images/requestinfoimage.png',height: 150,width:400,),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),



          ]),
        ),
      ),
    );
  }
}
