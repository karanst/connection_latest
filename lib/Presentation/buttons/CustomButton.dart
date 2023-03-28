import 'package:flutter/material.dart';
import '../../Helper/CustomColors.dart';


class CustomAppBtn extends StatelessWidget {
  final String? title;
  final VoidCallback? onPress;
  double? height;
  double? width;
  double? fSize;
  IconData? icon;
  CustomAppBtn({Key? key,
    this.title, this.onPress, this.height, this.width, this.fSize, this.icon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.bottomRight,
                colors: [
                  CustomColors.AppBtnColor1,
                  CustomColors.AppbarColor2,
                ],
                stops: [
                  0,
                  1,
                ]),
             borderRadius: BorderRadius.circular(60),
             border: Border.all(color:CustomColors.secondaryColor)
        ),
        height: height,
        width: width,
        child: Center(
          child: Text(
            "$title",
            style:  TextStyle(
              color: CustomColors.primaryColor,
              fontSize: fSize,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
