// ignore_for_file: avoid_print

import 'package:final_project/core/networking/remote/firebase_services.dart';
import 'package:final_project/core/routing/routes.dart';
import 'package:final_project/features/registration/logic/auth_services.dart';
import 'package:final_project/features/registration/ui/phone_auth/widgets/custom_digit_field.dart';
import 'package:flutter/material.dart';

class CustomDigitForm extends StatefulWidget {
  const CustomDigitForm({super.key, required this.phoneNumber});
  final String phoneNumber;

  @override
  State<CustomDigitForm> createState() => _CustomDigitFormState();
}

class _CustomDigitFormState extends State<CustomDigitForm> {
  List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  FirebaseServices firebaseServices = FirebaseServices();
  String fullCode = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CustomDigitField(
                  autoFocus: true,
                  controller: controllers[0],
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: CustomDigitField(
                  controller: controllers[1],
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: CustomDigitField(
                  controller: controllers[2],
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: CustomDigitField(
                  controller: controllers[3],
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: CustomDigitField(
                  controller: controllers[4],
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: CustomDigitField(
                  controller: controllers[5],
                  onChanged: (value) async{
                    fullCode = controllers[0].text + controllers[1].text + controllers[2].text + controllers[3].text + controllers[4].text + controllers[5].text;
                      print(fullCode);
                      await AuthService.loginWithOTP(otp: fullCode).then((value) {
                        if(value == 'Success'){
                          Navigator.pushNamedAndRemoveUntil(context, RoutesManager.landScreen, (route) => false);
                        }
                        else{
                          print('error $value');
                        }
                      }).catchError((er){
                        print('error in custom digit form $er');
                      });


                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    for (int i = 0; i < controllers.length; i++) {
      controllers[i].dispose();
    }
    super.dispose();
  }

  String getFullCode() {
    for (int i = 0; i < controllers.length; i++) {
      fullCode += controllers[i].text;
    }
    return fullCode;
  }
}
