import 'dart:convert';

import 'package:angular/angular.dart';
import 'package:angular_app/utils/utils.dart';
import 'package:angular_router/angular_router.dart';
import 'package:http/http.dart' as http;
import 'package:angular_forms/angular_forms.dart';

@Component(
  selector: 'login',
  templateUrl: 'login.html',
  styleUrls: [
    '../../app_component.css',
    'login.css',
  ],
  directives: [
    coreDirectives,
    routerDirectives,
    formDirectives
  ],
)
class Login{

  String email;
  String password;

 handleLogin() async {
  var response = await http.post(
    "${Utils.baseUrl}/session", 
    body: jsonEncode({'email':email, 'password': password}),
    headers: {'Content-type' : 'application/json', 'Accept': 'application/json',});
  print(response.body);

  }
}