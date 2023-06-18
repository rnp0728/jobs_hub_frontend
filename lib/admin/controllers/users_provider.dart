import 'package:flutter/material.dart';
import 'package:jobs_hub/admin/models/users.dart';
import 'package:jobs_hub/admin/services/users_helper.dart';

class UsersNotifier extends ChangeNotifier {
  late Future<List<User>?> usersList;

  getUsers() {
    usersList = UsersHelper.getUsers();
  }

  late Future<User> user;

  getUserDetails(String userId) {
    user = UsersHelper.getUserDetails(userId: userId);
  }

  Future<bool> deleteUserByAdmin({required String userId}) {
    return UsersHelper.deleteUserByAdmin(userId: userId);
  }
}
