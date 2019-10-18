import 'dart:convert';
import 'dart:html' hide Client;

import 'package:angular/angular.dart';
import 'package:angular_app/route_paths.dart';
import 'package:angular_app/utils/utils.dart';
import 'package:angular_router/angular_router.dart';
import 'package:http/http.dart' as http;
import 'package:angular_forms/angular_forms.dart';

@Component(
  selector: 'login',
  templateUrl: 'login.html',
  styleUrls: [
    '../../app_component.css',
  ],
  directives: [coreDirectives, routerDirectives, formDirectives],
)
class Login {
  @ViewChild('modal')
  Element modal;

  final Router _router;

  String email;
  String password;

  Utils utils;

  Login(this._router, this.utils);

  handleLogin() async {
    var response = await http.post("${Utils.baseUrl}/session",
        body: jsonEncode({'email': email, 'password': password}),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        });

    var responseBody = jsonDecode(response.body);
    if(responseBody['auth']){
      window.localStorage['token'] = responseBody['token'];
      utils.isLoggedIn = true;
      _router.navigate(RoutePaths.dashboard.toUrl());
    }
    else{
      toggleModal();
    }
  }

  toggleModal() {
    this.modal.classes.toggle('is-active');
  }
}
