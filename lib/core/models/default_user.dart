import 'package:final_project/core/constants.dart';
import 'package:final_project/core/models/user_data.dart';

User defaultUser(){
  User defaultUser = User(
    userRating: 3,
    id: '',
    name: 'البائع ملوش اسم',
    photo: Constants.imageStatic,
    phone: '01004176659',
    email: '',
    role: '',
    date: null,
    city: '',
    country: '',
    faculty: '',
    job: 'البائع ملوش مهنه',
    background: '',
    unviersity: '',
  );
  return defaultUser;
}