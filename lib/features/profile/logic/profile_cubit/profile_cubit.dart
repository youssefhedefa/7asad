

// ignore_for_file: avoid_print, depend_on_referenced_packages

import 'dart:io';
import 'package:final_project/core/component/upload_image/data/repo/upload_image_repo.dart';
import 'package:http_parser/http_parser.dart';
import 'package:dio/dio.dart';
import 'package:final_project/core/models/user_data.dart';
import 'package:final_project/core/networking/local/caching_helper.dart';
import 'package:final_project/core/networking/local/hive/constance.dart';
import 'package:final_project/core/networking/local/hive/local_servics.dart';
import 'package:final_project/features/profile/data/repo/edit_profile/edit_profile_repo.dart';
import 'package:final_project/features/profile/data/repo/log_out/log_out_repo.dart';
import 'package:final_project/features/profile/data/repo/profile/profile.dart';
import 'package:final_project/features/profile/logic/profile_cubit/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime_type/mime_type.dart';


class ProfileCubit extends Cubit<ProfileState>{

  final ProfileRepo profileRepo;

  User user = User();
  Experince experince = Experince();

  void getAllData()async{
    user = await LocalServices.getData(box: LocalBox.userBox, key: KeysConstance.userKey);
    experince = await LocalServices.getData(box: LocalBox.exprienceBox, key: KeysConstance.experinceKey);
    emit(ProfileState.successExperienceDataFromLocalStorage(experince));
    emit(ProfileState.successUserDataFromLocalStorage(user));
  }

  ProfileCubit( {required this.profileRepo,required this.editProfileRepo , required this.logOutRepo, required this.uploadImageRepo, }) : super(const ProfileState.initial()) {
    getAllData();
  }

  void emitGetProfileState({required String id}) async {
    emit(const ProfileState.loading());
    final response = await profileRepo.getProfile(id: id);
    response.when(
      success: (userDataResponse) {
        print('done from log out Cubit');
        emit(ProfileState.success(userDataResponse));
      },
      failure: (error) {
        emit(ProfileState.error(error: error.failure.message ?? 'error in log out'));
      },
    );
  }



  //--------------------------------- edit profile section ---------------------------------

  emitGetProfileMainUserDataFromLocalData() async {
    emit(const ProfileState.loadingUserDataFromLocalStorage());
    final response = await profileRepo.getProfileMainUserDataFromLocalData();
    response.when(
      success: (userData) {
        user = userData;
        // print(user!.name);
        emit(ProfileState.successUserDataFromLocalStorage(userData));
      },
      failure: (error) {
        print(error.failure.message);
        emit(ProfileState.error(error: error.failure.message ?? 'error in get user data from local storage'));
      },
    );
  }

  emitGetProfileExperinceDataFromLocalData() async {
    emit(const ProfileState.loadingExperienceDataFromLocalStorage());
    final response = await profileRepo.getProfileExperinceDataFromLocalData();
    response.when(
      success: (experinceData) {
        experince = experinceData;
        // print(experince!.title);
        emit(ProfileState.successExperienceDataFromLocalStorage(experinceData));
      },
      failure: (error) {
        print(error.failure.message);
        emit(ProfileState.error(error: error.failure.message ?? 'error in get experince data from local storage'));
      },
    );
  }

  final EditProfileRepo editProfileRepo;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int experienceNumber = 0;

  TextEditingController nameController = TextEditingController();
  TextEditingController jobDropDownController = TextEditingController();
  TextEditingController universityController = TextEditingController();
  TextEditingController facultyController = TextEditingController();
  TextEditingController educationController = TextEditingController();
  TextEditingController countryDropDownController = TextEditingController();
  TextEditingController townDropDownController = TextEditingController();
  TextEditingController courseDropDownController = TextEditingController();
  TextEditingController enterpriseDropDownController = TextEditingController();
  TextEditingController fromDropDownController = TextEditingController();
  TextEditingController toDropDownController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  updateUserDataEmitStates({required User userData}) async {
    emit(const ProfileState.loading());
    final response = await editProfileRepo.updateUserData(userData);
    response.when(
      success: (userData) {

          userData = userData;

          user = userData.data!.user;
          experince = user.experince!;

          LocalServices.clearData(box: LocalBox.userBox);
          LocalServices.clearData(box: LocalBox.exprienceBox);

          LocalServices.putData(
            lazyBox: LocalBox.userBox,
            key: KeysConstance.userKey,
            value: user,
          );

          LocalServices.putData(
            lazyBox: LocalBox.exprienceBox,
            key: KeysConstance.experinceKey,
            value: experince,
          );

          emit(ProfileState.successUpdateUserData(userData));

      },
      failure: (error) {
        emit(ProfileState.error(
            error: '${error.failure.message} +++ ${error.failure.code} '));
      },
    );
  }

  //------------------------ log out section------------------------//

  final LogOutRepo logOutRepo;

  void emitLogOutStates(BuildContext context) async {
    emit(const ProfileState.loading());
    final response = await logOutRepo.logOut();
    response.when(
      success: (logOutResponse) {
        print('done from log out Cubit');

        CachHelper.clearToken();

        LocalServices.clearData(box: LocalBox.userBox);
        LocalServices.clearData(box: LocalBox.exprienceBox);
        emit(ProfileState.successLogOut(logOutResponse));
      },
      failure: (error) {
        emit(ProfileState.error(error: error.failure.message ?? 'error in log out'));
      },
    );
  }

  //--------------------------------- edit image section ---------------------------------

  XFile? imageXFile;
  File? imageFile;
  String imageUrl = '';
  FormData? image;
  String? imageMimeType;

  final UploadImageRepo uploadImageRepo;

  Future<void> pickImages() async {
    final ImagePicker picker = ImagePicker();
    XFile? imageX = await picker.pickImage(source: ImageSource.gallery);
    if (imageX!.path.isNotEmpty) {
      imageXFile = imageX;
      imageFile = File(imageXFile!.path);
    }
    else{
      print('No image selected.');
    }
    imageMimeType = mime(imageFile!.path);
    String name = imageMimeType!.split('/')[0];
    String type = imageMimeType!.split('/')[1];
    image = FormData.fromMap({
      'image':
      await MultipartFile.fromFile(
        imageFile!.path,
        filename: imageFile!.path.split('/').last,
        contentType: MediaType(name, type),
      ),
    });
  }

  void emitUploadPersonalImageStates(
      FormData image,
      BuildContext context,
      ) async {
    emit(const ProfileState.loading());
    final response = await uploadImageRepo.uploadImage(image);
    response.when(
      success: (uploadImageResponse) {

        updateUserDataEmitStates(
          userData: User(
            name: user.name,
            job: user.job,
            unviersity: user.unviersity,
            faculty: user.faculty,
            educationalDegree: user.educationalDegree,
            country: user.country,
            city: user.city,
            phone: user.phone,
            photo: uploadImageResponse.image,
            background: user.background,
            userRating: user.userRating,
            role: user.role,
            id: user.id,
            date: user.date,
            email: user.email,
            iV: user.iV,
            experince: Experince(
              title: experince.title,
              company: experince.company,
              startDate: experince.startDate,
              endDate: experince.endDate,
            ),
          ),
        );


        emit(ProfileState.successUpdatePersonalImage(uploadImageResponse));
      },
      failure: (error) {
        emit(ProfileState.error(
            error: error.failure.message ?? 'error in upload image'));
      },
    );
  }

  void emitUploadBackGroundImageStates(
      FormData image,
      BuildContext context,
      ) async {
    emit(const ProfileState.loading());
    final response = await uploadImageRepo.uploadImage(image);
    response.when(
      success: (uploadImageResponse) {

        updateUserDataEmitStates(
          userData: User(
            name: user.name,
            job: user.job,
            unviersity: user.unviersity,
            faculty: user.faculty,
            educationalDegree: user.educationalDegree,
            country: user.country,
            city: user.city,
            phone: user.phone,
            photo: user.photo,
            background: uploadImageResponse.image,
            userRating: user.userRating,
            role: user.role,
            id: user.id,
            date: user.date,
            email: user.email,
            iV: user.iV,
            experince: Experince(
              title: experince.title,
              company: experince.company,
              startDate: experince.startDate,
              endDate: experince.endDate,
            ),
          ),
        );

        print(uploadImageResponse.image);

        emit(ProfileState.successUpdateBackGroundImage(uploadImageResponse));
      },
      failure: (error) {
        emit(ProfileState.error(
            error: error.failure.message ?? 'error in upload image'));
      },
    );
  }

}