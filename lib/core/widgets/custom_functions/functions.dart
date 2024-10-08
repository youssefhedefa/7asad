import 'dart:io';

import 'package:final_project/core/helpers/assets_helper/icon_helper.dart';
import 'package:final_project/core/helpers/assets_helper/image_helper.dart';
import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/core/widgets/seller_contacts_buttons.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';


void showAlertContact(BuildContext context,String phoneNumber) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: ColorHelper.alertColor,
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SizedBox(
                      height: 16,
                      width: 16,
                      child: Image.asset(
                        IconHelper.deleteIcon,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 50,
                child: Image.asset(
                  ImageHelper.mohamedImage,
                  fit: BoxFit.fill,
                ),
              ),
              Text(
                'محمد الشوال',
                style: TextStyleHelper.font22MediumDarkestGreen,
              ),
              Text(
                'تاجر قمح \\ كفرالشيخ',
                style: TextStyleHelper.font12RegularDarkGreen,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SellerContactsButtons(
                    phoneOnTap: () async {
                    await makingPhoneCall(phoneNumber);
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

// void launchPhoneApp() async {
//   var url = Uri.parse('tel:9776765434');
//   if (await canLaunchUrl(url)) {
//     await launchUrl(url);
//   } else {
//     throw 'Could not launch $url';
//   }
// }

makingPhoneCall(String phoneNumber) async {
  final Uri url = Uri(
      scheme: 'tel',
    path: phoneNumber,
  );
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

String getDayOfWeek(DateTime date) {
  List<String> daysOfWeek = ['الاثنين', 'الثلاثاء', 'الاربعاء', 'الخميس', 'الجمعه', 'السبت', 'الحد'];
  return daysOfWeek[date.weekday - 1];
}

Future<File?> pickImageFromGallery() async {
  File? image;
  final picker = ImagePicker();
  final file = await picker.pickImage(
    source: ImageSource.gallery,
  );
  if (file != null) {
    image = File(file.path);
  }
  return image;
}

Future<File?> pickImageFromCamera() async {
  File? image;
  final picker = ImagePicker();
  final file = await picker.pickImage(
    source: ImageSource.camera,
  );
  if (file != null) {
    image = File(file.path);
  }
  return image;
}