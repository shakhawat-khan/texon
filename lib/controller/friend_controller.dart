import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texon/model/friend.dart';
import 'package:http/http.dart' as http;

class FriendController extends GetxController {
  var isLoading = false.obs;

  Friend? friend;

  @override
  Future<void> onInit() async {
    super.onInit();
    await fetchData();
  }

  fetchData() async {
    isLoading(true);
    http.Response response =
        await http.get(Uri.tryParse('https://randomuser.me/api/?results=10')!);
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      friend = Friend.fromJson(result);
    } else {
      debugPrint('error');
    }
    isLoading(false);
  }
}
