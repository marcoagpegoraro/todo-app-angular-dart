import 'dart:convert';
import 'dart:html' hide Client;

import 'package:angular/angular.dart';
import 'package:angular_app/utils/utils.dart';
import 'package:angular_router/angular_router.dart';
import 'package:http/http.dart' as http;
import 'package:angular_forms/angular_forms.dart';

@Component(
  selector: 'dashboard',
  templateUrl: 'dashboard.html',
  styleUrls: [
    '../../app_component.css',
    'dashboard.css',
  ],
  directives: [coreDirectives, routerDirectives, formDirectives],
)
class Dashboard extends OnInit {
  @ViewChild('modal')
  Element modal;

  String name;
  String email;
  String password;

  var todos;

  @override
  void ngOnInit() async {
    var response = await http.get("${Utils.baseUrl}/todo", headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
          'Authorization': window.localStorage['token']
    });
    
    todos = jsonDecode(response.body);
  }

  toggleModal() {
    this.modal.classes.toggle('is-active');
  }
}
