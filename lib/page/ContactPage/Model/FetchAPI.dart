import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import '../ViewModel/User.dart';

class FetchAPI {
  static Future<List<User>> getUser() async {
    var userData =
        await http.get(Uri.parse('https://reqres.in/api/users?per_page=12'));

    var jsonData = json.decode(userData.body)['data'];

    List<User> users = [];

    for (var el in jsonData) {
      User user = User(
        el['id'],
        el['email'],
        el['firstName'] = el['first_name'],
        el['lastName'] = el['last_name'],
        el['avatar'],
      );
      users.add(user);
    }
    return users;
  }
}
