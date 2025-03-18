import 'dart:async';
import 'package:myaplication/domain/services/model/user_data.dart';

abstract class UserDataServiceInterface {
  Future<UserData> getUserData();
  Future<void> addUserData({required String name, required String email});
  Future<void> updateUserData({required String name, required String description});
  Future<void> deleteUserData();
}