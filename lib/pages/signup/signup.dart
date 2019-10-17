import 'dart:convert';
import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_app/utils/utils.dart';
import 'package:angular_router/angular_router.dart';
import 'package:http/http.dart' as http;
import 'package:angular_forms/angular_forms.dart';

@Component(
  selector: 'signup',
  templateUrl: 'signup.html',
  styleUrls: [
    '../../app_component.css',
    'signup.css',
  ],
  directives: [coreDirectives, routerDirectives, formDirectives],
)
class Signup {
  @ViewChild('modal')
  Element modal;

  String name;
  String email;
  String password;

  handleSignup() async {
    var response = await http.post("${Utils.baseUrl}/user",
        body: jsonEncode({'name': name,'email': email, 'password': password}),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        });
    toggleModal();
    print(response.body);
  }

  toggleModal() {
    this.modal.classes.toggle('is-active');
  }
  
}
