import 'dart:convert';
import 'dart:io';
import 'package:connection/Helper/Api.path.dart';
import 'package:connection/Models/cities_model.dart';
import 'package:connection/Presentation/AppBar/CustomAppBar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import '../../Helper/CustomColors.dart';
import 'package:http/http.dart' as http;

import 'buttons/CustomButton.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';


class AccomodationCreatePost extends StatefulWidget {
  const AccomodationCreatePost({Key? key}) : super(key: key);

  @override
  State<AccomodationCreatePost> createState() => _AccomodationCreatePostState();
}

class _AccomodationCreatePostState extends State<AccomodationCreatePost> {


  List<Data> cityList = [];
  String? categoryValue;
  int _value = 1;
  int _value1 = 1;
  int _value2 = 1;
  int _value3 = 1;
  int _value4 = 1;
  int _value5 = 1;
  String sharing = 'private';
  String roomType = 'room';
  String availableFor = 'girl';
  String availability = '0';
  String rentType = 'perperson';
  String utilities = 'included';

  TextEditingController addressController = TextEditingController();
  TextEditingController foodController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController noPersonController = TextEditingController();
  TextEditingController serviceNameController = TextEditingController();
  TextEditingController amountController = TextEditingController();


  _getCities() async {
    var uri = Uri.parse('${ApiPath.getCitiesUrl}');
    var request =  http.MultipartRequest("GET", uri);
    Map<String, String> headers = {
      "Accept": "application/json",
    };
    // print(baseUrl.toString());

    request.headers.addAll(headers);
    // request.fields['type_id'] = "1";
    // request.fields['vendor_id'] = userID;
    var response = await request.send();
    print(response.statusCode);
    String responseData = await response.stream.transform(utf8.decoder).join();
    var userData = json.decode(responseData);

    if (mounted) {
      setState(() {
        // collectionModal = AllCateModel.fromJson(userData);
        cityList = CitiesModel.fromJson(userData).data!;
        // print(
        //     "ooooo ${collectionModal!.status} and ${collectionModal!.categories!.length} and ${userID}");
      });
    }
    print(responseData);
  }

  String _dateValue = '';
  String dateFormate = '';

  // String convertDateTimeDisplay(String date) {
  //   final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
  //   final DateFormat serverFormater = DateFormat('yyyy-MM-dd');
  //   final DateTime displayDate = displayFormater.parse(date);
  //   final String formatted = serverFormater.format(displayDate);
  //   return formatted;
  // }
  Future _selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate:  DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2025),
        //firstDate: DateTime.now().subtract(Duration(days: 1)),
        // lastDate: new DateTime(2022),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
                primaryColor: CustomColors.secondaryColor,
                accentColor: Colors.black,
                colorScheme:  ColorScheme.light(primary:  CustomColors.secondaryColor),
                // ColorScheme.light(primary: const Color(0xFFEB6C67)),
                buttonTheme:
                ButtonThemeData(textTheme: ButtonTextTheme.accent)),
            child: child!,
          );
        });
    if (picked != null) {
      setState(() {
        String yourDate = picked.toString();
        // _dateValue = convertDateTimeDisplay(yourDate);
        print(_dateValue);
        dateFormate = yourDate;
            //DateFormat("dd/MM/yyyy").format(DateTime.parse(_dateValue ?? ""));
        //submissionDateController = TextEditingController(text: _dateValue);
      });
    }
  }

  createAccomodationForm() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('user_id');

    var headers = {
      'Cookie': 'ci_session=43aff87f68a58e20a70c2d26db1788da55160f34'
    };
    var request = http.MultipartRequest('POST', Uri.parse(ApiPath.sendAccomodationRequest));
    request.fields.addAll({
      'service_name': serviceNameController.text.toString(),
      'user_id': '$userId',
      'price': amountController.text.toString(),
      'city_id': categoryValue.toString(),
      'date': dateFormate,
      'availabilty': availability.toString(),
      'no_of_person': noPersonController.text.toString(),
      'available_for': availableFor,
      'sharing': sharing,
      'room_type': roomType,
      'rent_type': rentType,
      'utilities': utilities,
      'address': addressController.text.toString(),
      'food_type': foodController.text.toString(),
      'mobile': mobileController.text.toString(),
      'note': notesController.text.toString(),
    });
    for (var i = 0; i < imagePathList.length; i++) {
      imagePathList == null
          ? null
          : request.files.add(await http.MultipartFile.fromPath(
          'services_image[]', imagePathList[i].toString()));
    }
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

  ///MULTI IMAGE PICKER
  ///
  ///
  ///
  var imagePathList;
  bool isImages = false;
  Future<void> getFromGallery() async {
    var result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );
    if (result != null) {
      setState(() {
        isImages = true;
        // servicePic = File(result.files.single.path.toString());
      });
      imagePathList = result.paths.toList();
      // imagePathList.add(result.paths.toString()).toList();
      print("SERVICE PIC === ${imagePathList.length}");
    } else {
      // User canceled the picker
    }
  }
  Widget uploadMultiImage() {
    return Visibility(
        visible: isImages,
        child: imagePathList != null ? buildGridView() : SizedBox.shrink()
    );
  }
  Widget buildGridView() {
    return Container(
      // height: MediaQuery.of(context).size.height/3,
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imagePathList.length,
        // gridDelegate:
        // SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            children: [
              Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width/5,
                    height: MediaQuery.of(context).size.height/8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      child: Image.file(File(imagePathList[index]),
                          fit: BoxFit.cover),
                    ),
                  )),
              Positioned(
                top: 5,
                right: 10,
                child: InkWell(
                  onTap: (){
                    setState((){
                      imagePathList.remove(imagePathList[index]);
                    });

                  },
                  child: Icon(
                    Icons.remove_circle,
                    size: 30,
                    color: Colors.red.withOpacity(0.7),),
                ),
              )
            ],
          );
        },
      ),
    );
  }
  ///MULTI IMAGE PICKER
  ///
  ///

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCities();
  }
  @override
  Widget build(BuildContext context) {
   //  int? value;
   // _value1=_value1!
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            Stack(
              children: [
                Container(
                    height: MediaQuery.of(context).size.height / 3,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/images/rideScreenimage3.png'),
                            fit: BoxFit.fill)),
                    child: CustomAppbar2(
                      Text2: 'Create Post',
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 130.0,left: 5,right: 5),
                  child: Container(
                    // height: MediaQuery.of(context).size.height /0.8,
                    width: MediaQuery.of(context).size.width/1.02,
                    child: Card(
                      elevation: 40,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                            const EdgeInsets.only(top: 5.0, bottom: 10),
                            child: Material(
                              // color: splashcolor,
                              elevation: 1,
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                padding: EdgeInsets.all(12),
                                width: MediaQuery.of(context).size.width,
                                height: 60,
                                child:
                            Row(
                              children: [
                                Image.asset('assets/images/FormCityimage.png',height: 25,width: 25,),
                                const SizedBox(width: 15,),
                                Container(
                                  width: MediaQuery.of(context).size.width -80,
                                  child: DropdownButton(
                                    // Initial Value
                                    value: categoryValue,
                                    underline: Container(),
                                    isExpanded: true,
                                    // Down Arrow Icon
                                    icon: const Icon(Icons.keyboard_arrow_down, color: CustomColors.lightblack,),
                                    hint: const Text("Select City", style: TextStyle(
                                        color: CustomColors.lightblack
                                    ),),
                                    // Array list of items
                                    items: cityList.map((items) {
                                      return DropdownMenuItem(
                                        value: items.id,
                                        child: Container(
                                            child: Text(items.name.toString())),
                                      );
                                    }).toList(),
                                    // After selecting the desired option,it will
                                    // change button value to selected value
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        categoryValue = newValue!;

                                        print(
                                            "selected category ${categoryValue}");
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                              )
                            )
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 14.0),
                            child: Material(
                              // color: splashcolor,
                              elevation: 1,
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                padding: EdgeInsets.all(12),
                                  width: MediaQuery.of(context).size.width / 1.0,
                                  // height: 110,
                                  child: Column(children: [
                                    Row(
                                      children:  [
                                        Image.asset('assets/images/CreatPostSearchimage.png',height: 25,width: 25,),
                                      const  SizedBox(width: 20,),
                                       const Text('I am looking accommodation for..'),
                                        Radio(
                                            fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
                                            value: 1,
                                            groupValue: _value,
                                            onChanged: (int? value) {
                                              setState(() {
                                                _value= value!;
                                                availability = "0";
                                              });
                                            }),
                                      ],
                                    ),
                                    Container(
                                      // width: 380,
                                      child: const Divider(
                                        color: CustomColors.lightgray,
                                        thickness: 0.7,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Image.asset('assets/images/CreatPostAccomondationimage.png',height: 25,width: 25,),
                                        SizedBox(width: 15,),
                                        Text('I have accommodation available for.'),
                                        Radio(
                                            fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
                                            value: 2,
                                            groupValue: _value,
                                            onChanged: (int? value) {
                                              setState(() {
                                                _value = value!;
                                                availability = "1";
                                              });
                                            }),
                                      ],
                                    ),
                                  ],)
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 14.0),
                            child: Material(
                              // color: splashcolor,
                              elevation: 1,
                              borderRadius: BorderRadius.circular(10),
                              child: InkWell(
                                onTap: (){
                                  _selectDate();
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                    width: MediaQuery.of(context).size.width ,
                                    height: 60,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      // mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset('assets/images/CreateFormimage2.png',height: 25,width: 25,),
                                        const SizedBox(width: 10,),
                                         Text(dateFormate != ''? dateFormate : 'Move in Date'),
                                        // const SizedBox(width: 150,),
                                        // const Icon(Icons.date_range,size: 30,color: Colors.lightBlue,)
                                      ],
                                    )
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 14.0),
                            child: Material(
                              // color: splashcolor,
                              elevation: 1,
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                padding: EdgeInsets.only(left: 12),
                                  width: MediaQuery.of(context).size.width / 1.0,
                                  height: 60,
                                  child: Column(children: [
                                    Row(
                                      children: [
                                        Image.asset('assets/images/usericon.png',height: 25,width: 25,),
                                        const SizedBox(width: 10,),
                                        Container(
                                          width: MediaQuery.of(context).size.width - 100,
                                          child: TextField(
                                            controller: noPersonController,
                                            keyboardType: TextInputType.number,
                                            decoration: const InputDecoration(
                                              hintText: "How many Person",
                                              border: InputBorder.none
                                            ),
                                          ),
                                        )
                                      ],
                                    ),


                                  ],)
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 14.0),
                            child: Material(
                              // color: splashcolor,
                              elevation: 1,
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                  padding: EdgeInsets.only(left: 12),
                                  width: MediaQuery.of(context).size.width / 1.0,
                                  height: 60,
                                  child: Column(children: [
                                    Row(
                                      children: [
                                        Icon(Icons.home_work_outlined, color: Colors.red, size: 25,),
                                        // Image.asset('assets/images/usericon.png',height: 25,width: 25,),
                                        const SizedBox(width: 10,),
                                        Container(
                                          width: MediaQuery.of(context).size.width - 100,
                                          child: TextField(
                                            controller: serviceNameController,
                                            // keyboardType: TextInputType.number,
                                            decoration: const InputDecoration(
                                                hintText: "Service/Hotel Name",
                                                border: InputBorder.none
                                            ),
                                          ),
                                        )
                                      ],
                                    ),


                                  ],)
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 14.0),
                            child: Material(
                              // color: splashcolor,
                              elevation: 1,
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                padding: EdgeInsets.only(left: 12),
                                  width: MediaQuery.of(context).size.width / 1.0,
                                  // height: 60,
                                  child: Column(children: [
                                    Row(
                                      children: [
                                        Image.asset('assets/images/CreatPostCalendarImage.png', height: 25, width: 25,),
                                        SizedBox(width: 12,),
                                        Text('Available For :'),
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
                                                        availableFor = "girl";
                                                      });
                                                    }),
                                                Text(
                                                  "Girl",
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
                                                        availableFor = "boy";
                                                      });
                                                    }),

                                                Text(
                                                  "Boy",
                                                 ),

                                              ],
                                            ),
                                          ],
                                        ),

                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Radio(
                                                value: 3,
                                                fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
                                                groupValue: _value1,
                                                onChanged: (int? value) {
                                                  setState(() {
                                                    _value1 = value!;
                                                    availableFor = "couple";
                                                  });
                                                }),
                                            Text(
                                              "Couple",
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Radio(
                                                fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
                                                value: 4,
                                                groupValue: _value1,
                                                onChanged: (int? value) {
                                                  setState(() {
                                                    _value1 = value!;
                                                    availableFor = "any";
                                                  });
                                                }),

                                            Text(
                                              "Any",
                                            ),

                                          ],
                                        ),
                                      ],
                                    )


                                  ],)
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 14.0),
                            child: Material(
                              // color: splashcolor,
                              elevation: 1,
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                padding: EdgeInsets.only(left: 12),
                                  width: MediaQuery.of(context).size.width / 1.0,
                                  height: 60,
                                  child: Column(children: [
                                    Row(
                                      children: [
                                        Image.asset('assets/images/CreatPostSharingimage.png',height: 25,width: 25,),
                                        SizedBox(width: 12,),
                                        Text('Sharing :'),
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
                                                    groupValue: _value2,
                                                    onChanged: (int? value) {
                                                      setState(() {
                                                        _value2 = value!;
                                                        sharing = "shared";
                                                      });
                                                    }),

                                                Text(
                                                  "Shared",
                                                ),

                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),


                                  ],)
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 14.0),
                            child: Material(
                              // color: splashcolor,
                              elevation: 1,
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                  width: MediaQuery.of(context).size.width / 1.0,
                                  height: 125,
                                  child: Column(
                                    children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 240.0),
                                      child: Text('Upload Photo',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15.0, top: 20),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          InkWell(
                                            onTap:(){
                                              getFromGallery();
                                            },
                                              child: Image.asset('assets/images/CreatePostuploadImage.png',height: 70,width: 70,)),
                                          SizedBox(width: 12,),
                                          Container(
                                            width: MediaQuery.of(context).size.width - 120,
                                              child: uploadMultiImage())

                                        ],
                                      ),
                                    ),


                                  ],)
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 14.0),
                            child: Material(
                              // color: splashcolor,
                              elevation: 1,
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                  padding: EdgeInsets.only(left: 12),
                                  width: MediaQuery.of(context).size.width / 1.0,
                                  height: 60,
                                  child: Column(children: [
                                    Row(
                                      children: [
                                        Icon(Icons.attach_money_outlined, size: 25, color: Colors.red,),
                                        // Image.asset('assets/images/usericon.png',height: 25,width: 25,),
                                        const SizedBox(width: 10,),
                                        Container(
                                          width: MediaQuery.of(context).size.width - 100,
                                          child: TextField(
                                            controller: amountController,
                                            keyboardType: TextInputType.number,
                                            decoration: const InputDecoration(
                                                hintText: "Expected Amount",
                                                border: InputBorder.none
                                            ),
                                          ),
                                        )
                                      ],
                                    ),


                                  ],)
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 14.0,),
                            child: Material(
                              // color: splashcolor,
                              elevation: 1,
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                  width: MediaQuery.of(context).size.width / 1.0,
                                  height: 110,
                                  child: Column(children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset('assets/images/CreatePostImageIcon1.png',height: 25,width: 25,),
                                        ),
                                        SizedBox(width: 12,),
                                        Text('Types:'),
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
                                                    groupValue: _value3,
                                                    onChanged: (int? value) {
                                                      setState(() {
                                                        _value3 = value!;
                                                        roomType = "room";
                                                      });
                                                    }),
                                                Text(
                                                  "Room",
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Radio(
                                                    fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
                                                    value: 2,
                                                    groupValue: _value3,
                                                    onChanged: (int? value) {
                                                      setState(() {
                                                        _value3 = value!;
                                                        roomType = "apartment";
                                                      });
                                                    }),

                                                Text(
                                                  "Apartment",
                                                ),

                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Radio(
                                                value: 3,
                                                fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
                                                groupValue: _value3,
                                                onChanged: (int? value) {
                                                  setState(() {
                                                    _value3 = value!;
                                                    roomType = "house";
                                                  });
                                                }),
                                            Text(
                                              "House",
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Radio(
                                                fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
                                                value: 4,
                                                groupValue: _value3,
                                                onChanged: (int? value) {
                                                  setState(() {
                                                    _value3 = value!;
                                                    roomType = "basement";
                                                  });
                                                }),

                                            Text(
                                              "Basement",
                                            ),

                                          ],
                                        ),
                                      ],
                                    )
                                  ],)
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 14.0,),
                            child: Material(
                              // color: splashcolor,
                              elevation: 1,
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                  width: MediaQuery.of(context).size.width / 1.0,
                                  height: 110,
                                  child: Column(children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset('assets/images/rent.png',height: 25,width: 25,),
                                        ),
                                        SizedBox(width: 12,),
                                        Text('Rent:'),
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
                                                    groupValue: _value5,
                                                    onChanged: (int? value) {
                                                      setState(() {
                                                        _value5 = value!;
                                                        rentType= "perperson";
                                                      });
                                                    }),
                                                Text(
                                                  "per person",
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Radio(
                                                    fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
                                                    value: 2,
                                                    groupValue: _value5,
                                                    onChanged: (int? value) {
                                                      setState(() {
                                                        _value5 = value!;
                                                        rentType = "room";
                                                      });
                                                    }),

                                                const Text(
                                                  "room",
                                                ),

                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Radio(
                                                value: 3,
                                                fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
                                                groupValue: _value5,
                                                onChanged: (int? value) {
                                                  setState(() {
                                                    _value5 = value!;
                                                    rentType = "entire place";
                                                  });
                                                }),
                                            Text(
                                              "entire place",
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],)
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 14.0),
                            child: Material(
                              // color: splashcolor,
                              elevation: 1,
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                  padding: EdgeInsets.only(left: 12),
                                  width: MediaQuery.of(context).size.width / 1.0,
                                  height: 60,
                                  child: Column(children: [
                                    Row(
                                      children: [
                                        Image.asset('assets/images/utility.png',height: 25,width: 25,),
                                        SizedBox(width: 12,),
                                        Text('Utilities :'),
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
                                                    groupValue: _value4,
                                                    onChanged: (int? value) {
                                                      setState(() {
                                                        _value4 = value!;
                                                        utilities = "included";
                                                      });
                                                    }),
                                                Text(
                                                  "included",
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Radio(
                                                    fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
                                                    value: 2,
                                                    groupValue: _value4,
                                                    onChanged: (int? value) {
                                                      setState(() {
                                                        _value4 = value!;
                                                        utilities = "excluded";
                                                      });
                                                    }),

                                                Text(
                                                  "excluded",
                                                ),

                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),



                                  ],)
                              ),
                            ),
                          ),
                          Padding(
                      padding: const EdgeInsets.only(top: 14.0),
                      child: Material(
                        // color: splashcolor,
                        elevation: 1,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: EdgeInsets.only(left: 12),
                          width: MediaQuery.of(context).size.width / 1.0,
                          height: 70,
                          child:
                          Row(
                            children: [
                              Image.asset('assets/images/location.png',height: 25,width: 25,),
                              SizedBox(width: 12,),
                              Container(
                                width: MediaQuery.of(context).size.width - 100,
                                child: InkWell(
                                  onTap: () {
                                    // _getPickLocation();
                                  },
                                  child: TextFormField(
                                      maxLines: 1,
                                      controller: addressController,
                                      validator: (msg) {
                                        if (msg!.isEmpty) {
                                          return "Please Enter Address ";
                                        }
                                      },
                                      onTap: () {
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //     builder: (context) => PlacePicker(
                                        //       apiKey: Platform.isAndroid
                                        //           ? "AIzaSyB0uPBgryG9RisP8_0v50Meds1ZePMwsoY"
                                        //           : "AIzaSyB0uPBgryG9RisP8_0v50Meds1ZePMwsoY",
                                        //       onPlacePicked: (result) {
                                        //         print(result.formattedAddress);
                                        //         setState(() {
                                        //           addressController.text =
                                        //               result.formattedAddress.toString();
                                        //           // pickLat =
                                        //           //     result.geometry!.location.lat;
                                        //           // pickLong =
                                        //           //     result.geometry!.location.lng;
                                        //         });
                                        //         Navigator.of(context).pop();
                                        //       },
                                        //       initialPosition: LatLng(
                                        //         22.719568,75.857727
                                        //           // double.parse(widget.lat.toString()), double.parse(widget.long.toString())
                                        //       ),
                                        //       useCurrentLocation: true,
                                        //     ),
                                        //   ),
                                        // );


                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //     builder: (context) => PlacePicker(
                                        //       apiKey: Platform.isAndroid
                                        //           ? "AIzaSyBxsWdUSLMXzjxD6X-IOKjZMp3aMoxJfKc"
                                        //           : "AIzaSyBxsWdUSLMXzjxD6X-IOKjZMp3aMoxJfKc",
                                        //       onPlacePicked: (result) {
                                        //         print(result.formattedAddress);
                                        //         setState(() {
                                        //           addressController.text =
                                        //               result.formattedAddress.toString();
                                        //           pickLat =
                                        //               result.geometry!.location.lat;
                                        //           pickLong =
                                        //               result.geometry!.location.lng;
                                        //         });
                                        //         Navigator.of(context).pop();
                                        //       },
                                        //       initialPosition: LatLng(22.719568,75.857727
                                        //           // double.parse(widget.lat.toString()), double.parse(widget.long.toString())
                                        //   ),
                                        //       useCurrentLocation: true,
                                        //     ),
                                        //   ),
                                        // );
                                        // _getPickLocation();
                                      },
                                      decoration: const InputDecoration(
                                        hintText: "Address",
                                          hintStyle: TextStyle(color: Colors.black),
                                          contentPadding: EdgeInsets.only(left: 10),
                                          border: InputBorder.none
                                      )
                                    // decoration: InputDecoration(
                                    //   border: OutlineInputBorder(),
                                    // ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      )
                    ),
                          Padding(
                              padding: const EdgeInsets.only(top: 14.0),
                              child: Material(
                                // color: splashcolor,
                                  elevation: 1,
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    padding: EdgeInsets.only(left: 12),
                                    width: MediaQuery.of(context).size.width / 1.0,
                                    height: 60,
                                    child:
                                    Row(
                                      children: [
                                        Image.asset('assets/images/food.png',height: 25,width: 25,),
                                        SizedBox(width: 12,),
                                        Container(
                                          width: MediaQuery.of(context).size.width - 100,
                                          child: InkWell(
                                            onTap: () {
                                              // _getPickLocation();
                                            },
                                            child: TextFormField(
                                                maxLines: 1,
                                                controller: foodController,
                                                validator: (msg) {
                                                  if (msg!.isEmpty) {
                                                    return "Please Enter preferred food ";
                                                  }
                                                },
                                                onTap: () {
                                                  // Navigator.push(
                                                  //   context,
                                                  //   MaterialPageRoute(
                                                  //     builder: (context) => PlacePicker(
                                                  //       apiKey: Platform.isAndroid
                                                  //           ? "AIzaSyB0uPBgryG9RisP8_0v50Meds1ZePMwsoY"
                                                  //           : "AIzaSyB0uPBgryG9RisP8_0v50Meds1ZePMwsoY",
                                                  //       onPlacePicked: (result) {
                                                  //         print(result.formattedAddress);
                                                  //         setState(() {
                                                  //           addressController.text =
                                                  //               result.formattedAddress.toString();
                                                  //           // pickLat =
                                                  //           //     result.geometry!.location.lat;
                                                  //           // pickLong =
                                                  //           //     result.geometry!.location.lng;
                                                  //         });
                                                  //         Navigator.of(context).pop();
                                                  //       },
                                                  //       initialPosition: LatLng(
                                                  //         22.719568,75.857727
                                                  //           // double.parse(widget.lat.toString()), double.parse(widget.long.toString())
                                                  //       ),
                                                  //       useCurrentLocation: true,
                                                  //     ),
                                                  //   ),
                                                  // );


                                                  // Navigator.push(
                                                  //   context,
                                                  //   MaterialPageRoute(
                                                  //     builder: (context) => PlacePicker(
                                                  //       apiKey: Platform.isAndroid
                                                  //           ? "AIzaSyBxsWdUSLMXzjxD6X-IOKjZMp3aMoxJfKc"
                                                  //           : "AIzaSyBxsWdUSLMXzjxD6X-IOKjZMp3aMoxJfKc",
                                                  //       onPlacePicked: (result) {
                                                  //         print(result.formattedAddress);
                                                  //         setState(() {
                                                  //           addressController.text =
                                                  //               result.formattedAddress.toString();
                                                  //           pickLat =
                                                  //               result.geometry!.location.lat;
                                                  //           pickLong =
                                                  //               result.geometry!.location.lng;
                                                  //         });
                                                  //         Navigator.of(context).pop();
                                                  //       },
                                                  //       initialPosition: LatLng(22.719568,75.857727
                                                  //           // double.parse(widget.lat.toString()), double.parse(widget.long.toString())
                                                  //   ),
                                                  //       useCurrentLocation: true,
                                                  //     ),
                                                  //   ),
                                                  // );
                                                  // _getPickLocation();
                                                },
                                                decoration: const InputDecoration(
                                                    hintText: "Preferred Food: veg, non-veg, punjabi etc.",
                                                    hintStyle: TextStyle(color: Colors.black),
                                                    contentPadding: EdgeInsets.only(left: 10),
                                                    border: InputBorder.none
                                                )
                                              // decoration: InputDecoration(
                                              //   border: OutlineInputBorder(),
                                              // ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                              )
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 14.0),
                              child: Material(
                                // color: splashcolor,
                                  elevation: 1,
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    padding: EdgeInsets.only(left: 12),
                                    width: MediaQuery.of(context).size.width / 1.0,
                                    height: 60,
                                    child:
                                    Row(
                                      children: [
                                        Image.asset('assets/images/contact.png',height: 25,width: 25,),
                                        SizedBox(width: 12,),
                                        Container(
                                          width: MediaQuery.of(context).size.width - 100,
                                          child: InkWell(
                                            onTap: () {
                                              // _getPickLocation();
                                            },
                                            child: TextFormField(
                                                maxLines: 1,
                                                maxLength: 10,
                                                keyboardType: TextInputType.number,
                                                controller: mobileController,
                                                validator: (msg) {
                                                  if (msg!.isEmpty) {
                                                    return "Please Enter Contact Details ";
                                                  }
                                                },
                                                onTap: () {
                                                  // Navigator.push(
                                                  //   context,
                                                  //   MaterialPageRoute(
                                                  //     builder: (context) => PlacePicker(
                                                  //       apiKey: Platform.isAndroid
                                                  //           ? "AIzaSyB0uPBgryG9RisP8_0v50Meds1ZePMwsoY"
                                                  //           : "AIzaSyB0uPBgryG9RisP8_0v50Meds1ZePMwsoY",
                                                  //       onPlacePicked: (result) {
                                                  //         print(result.formattedAddress);
                                                  //         setState(() {
                                                  //           addressController.text =
                                                  //               result.formattedAddress.toString();
                                                  //           // pickLat =
                                                  //           //     result.geometry!.location.lat;
                                                  //           // pickLong =
                                                  //           //     result.geometry!.location.lng;
                                                  //         });
                                                  //         Navigator.of(context).pop();
                                                  //       },
                                                  //       initialPosition: LatLng(
                                                  //         22.719568,75.857727
                                                  //           // double.parse(widget.lat.toString()), double.parse(widget.long.toString())
                                                  //       ),
                                                  //       useCurrentLocation: true,
                                                  //     ),
                                                  //   ),
                                                  // );


                                                  // Navigator.push(
                                                  //   context,
                                                  //   MaterialPageRoute(
                                                  //     builder: (context) => PlacePicker(
                                                  //       apiKey: Platform.isAndroid
                                                  //           ? "AIzaSyBxsWdUSLMXzjxD6X-IOKjZMp3aMoxJfKc"
                                                  //           : "AIzaSyBxsWdUSLMXzjxD6X-IOKjZMp3aMoxJfKc",
                                                  //       onPlacePicked: (result) {
                                                  //         print(result.formattedAddress);
                                                  //         setState(() {
                                                  //           addressController.text =
                                                  //               result.formattedAddress.toString();
                                                  //           pickLat =
                                                  //               result.geometry!.location.lat;
                                                  //           pickLong =
                                                  //               result.geometry!.location.lng;
                                                  //         });
                                                  //         Navigator.of(context).pop();
                                                  //       },
                                                  //       initialPosition: LatLng(22.719568,75.857727
                                                  //           // double.parse(widget.lat.toString()), double.parse(widget.long.toString())
                                                  //   ),
                                                  //       useCurrentLocation: true,
                                                  //     ),
                                                  //   ),
                                                  // );
                                                  // _getPickLocation();
                                                },
                                                decoration: const InputDecoration(
                                                  counterText: '',
                                                    hintText: "Contact:DM, phone, whatsapp",
                                                    hintStyle: TextStyle(color: Colors.black),
                                                    contentPadding: EdgeInsets.only(left: 10),
                                                    border: InputBorder.none
                                                )
                                              // decoration: InputDecoration(
                                              //   border: OutlineInputBorder(),
                                              // ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                              )
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 14.0),
                              child: Material(
                                // color: splashcolor,
                                  elevation: 1,
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    padding: EdgeInsets.only(left: 12),
                                    width: MediaQuery.of(context).size.width / 1.0,
                                    height: 60,
                                    child:
                                    Row(
                                      children: [
                                        Image.asset('assets/images/notes.png',height: 25,width: 25,),
                                        SizedBox(width: 12,),
                                        Container(
                                          width: MediaQuery.of(context).size.width - 100,
                                          child: InkWell(
                                            onTap: () {
                                              // _getPickLocation();
                                            },
                                            child: TextFormField(
                                                maxLines: 1,
                                                controller: notesController,
                                                validator: (msg) {
                                                  if (msg!.isEmpty) {
                                                    return "Please Enter notes";
                                                  }
                                                },
                                                onTap: () {
                                                  // Navigator.push(
                                                  //   context,
                                                  //   MaterialPageRoute(
                                                  //     builder: (context) => PlacePicker(
                                                  //       apiKey: Platform.isAndroid
                                                  //           ? "AIzaSyB0uPBgryG9RisP8_0v50Meds1ZePMwsoY"
                                                  //           : "AIzaSyB0uPBgryG9RisP8_0v50Meds1ZePMwsoY",
                                                  //       onPlacePicked: (result) {
                                                  //         print(result.formattedAddress);
                                                  //         setState(() {
                                                  //           addressController.text =
                                                  //               result.formattedAddress.toString();
                                                  //           // pickLat =
                                                  //           //     result.geometry!.location.lat;
                                                  //           // pickLong =
                                                  //           //     result.geometry!.location.lng;
                                                  //         });
                                                  //         Navigator.of(context).pop();
                                                  //       },
                                                  //       initialPosition: LatLng(
                                                  //         22.719568,75.857727
                                                  //           // double.parse(widget.lat.toString()), double.parse(widget.long.toString())
                                                  //       ),
                                                  //       useCurrentLocation: true,
                                                  //     ),
                                                  //   ),
                                                  // );


                                                  // Navigator.push(
                                                  //   context,
                                                  //   MaterialPageRoute(
                                                  //     builder: (context) => PlacePicker(
                                                  //       apiKey: Platform.isAndroid
                                                  //           ? "AIzaSyBxsWdUSLMXzjxD6X-IOKjZMp3aMoxJfKc"
                                                  //           : "AIzaSyBxsWdUSLMXzjxD6X-IOKjZMp3aMoxJfKc",
                                                  //       onPlacePicked: (result) {
                                                  //         print(result.formattedAddress);
                                                  //         setState(() {
                                                  //           addressController.text =
                                                  //               result.formattedAddress.toString();
                                                  //           pickLat =
                                                  //               result.geometry!.location.lat;
                                                  //           pickLong =
                                                  //               result.geometry!.location.lng;
                                                  //         });
                                                  //         Navigator.of(context).pop();
                                                  //       },
                                                  //       initialPosition: LatLng(22.719568,75.857727
                                                  //           // double.parse(widget.lat.toString()), double.parse(widget.long.toString())
                                                  //   ),
                                                  //       useCurrentLocation: true,
                                                  //     ),
                                                  //   ),
                                                  // );
                                                  // _getPickLocation();
                                                },
                                                decoration: const InputDecoration(
                                                    hintText: "Notes:additional info, lease etc.",
                                                    hintStyle: TextStyle(color: Colors.black),
                                                    contentPadding: EdgeInsets.only(left: 10),
                                                    border: InputBorder.none
                                                )
                                              // decoration: InputDecoration(
                                              //   border: OutlineInputBorder(),
                                              // ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                              )
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset('assets/images/info.png',height: 20,width: 20,),
                                const SizedBox(width: 12,),
                                Text(
                                  "Disclaimer from Admin: to make sure reliable \nperson, legal and not responsible for \nany kind of spam , fraud etc.",
                                maxLines: 3,)
                              ],
                            ),
                          ),
                         Padding(
                           padding: const EdgeInsets.all(20.0),
                           child: CustomAppBtn(
                             height: 45,
                             width: MediaQuery.of(context).size.width - 20,
                             onPress: (){
                               if(serviceNameController.text.isNotEmpty &&
                                   addressController.text.isNotEmpty &&
                                   mobileController.text.isNotEmpty &&
                               foodController.text.isNotEmpty && foodController.text.isNotEmpty &&
                               notesController.text.isNotEmpty &&
                                    sharing != '' &&
                                roomType != '' &&
                                availableFor != '' &&
                                availability != '' &&
                                rentType != '' &&
                                utilities != ''
                               ){
                                 createAccomodationForm();
                               }else{
                                 Fluttertoast.showToast(msg: "All fields are required!");
                               }

                             },
                             title: "Post",
                           ),
                         )

                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
