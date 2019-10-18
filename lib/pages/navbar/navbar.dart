import 'dart:html' hide Client;

import 'package:angular/angular.dart';
import 'package:angular_app/routes.dart';
import 'package:angular_app/utils/utils.dart';
import 'package:angular_router/angular_router.dart';
import 'package:http/http.dart' as http;
import 'package:angular_forms/angular_forms.dart';

@Component(
  selector: 'navbar',
  templateUrl: 'navbar.html',
  styleUrls: [
    '../../app_component.css',
  ],
  directives: [coreDirectives, routerDirectives, formDirectives],
  exports: [RoutePaths, Routes]
)
class Navbar extends OnInit{
  @ViewChild('navBurger')
  Element navBurger;
  @ViewChild('navMenu')
  Element navMenu;

  final Router _router;

  Utils utils;

  Navbar(this._router, this.utils);
  
  @override
  void ngOnInit() {
    if (window.localStorage['token'] == null) {
      utils.isLoggedIn = false;
    } else {
      utils.isLoggedIn = true;
    }

  }

  toggleNavbar() {
    this.navBurger.classes.toggle('is-active');
    this.navMenu.classes.toggle('is-active');
  }

  handleLogoff(){
    window.localStorage.remove('token');
    utils.isLoggedIn = false;
    _router.navigate(RoutePaths.login.toUrl());
  }
  
}
