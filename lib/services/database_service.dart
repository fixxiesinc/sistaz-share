import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class DatabaseService {
  static final users = db.collection('users');
  static final chats = db.collection('chats');
  static final counsellors = db.collection('counsellors');

  static String get generateID => users.doc().id;

  static Future<bool> addUser(User user) async {
    try {
      await users.doc(user.id).set(user.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> addChat(Chat chat) async {
    try {
      await chats.doc(chat.id).set(chat.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<List<Counsellor>> fetchCounsellors() async {
    List<Counsellor> data = [];
    try {
      final querySnap = await counsellors.get();
      for (var docSnap in querySnap.docs) {
        data.add(Counsellor.fromMap(docSnap.data()));
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    return data;
  }

  static Future<Counsellor?> fetchCounsellor(String id) async {
    try {
      final docSnap = await counsellors.doc(id).get();
      return Counsellor.fromMap(docSnap.data()!);
    } catch (e) {
      debugPrint(e.toString());

      return null;
    }
  }

  static Future<User?> fetchUser() async {
    try {
      String username = FormController.username;

      final querySnap =
          await users.where('username', isEqualTo: username).get();

      bool valid = BCrypt.checkpw(
        FormController.pincode,
        querySnap.docs.first.data()['secret'],
      );

      if (valid) {
        return User.fromMap(querySnap.docs.first.data());
      }

      return null;
    } catch (e) {
      debugPrint(e.toString());

      return null;
    }
  }
}
