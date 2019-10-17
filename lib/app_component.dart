import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_app/pages/login/login.dart';
import 'package:angular_app/pages/signup/signup.dart';
import 'package:angular_app/route_paths.dart';
import 'package:angular_app/routes.dart';
import 'package:angular_router/angular_router.dart';

@Component(
  selector: 'my-app',
  templateUrl: 'app_component.html',
  styleUrls: [
    'app_component.css',
  ],
  directives: [
    coreDirectives,
    routerDirectives,
    Login,
    Signup    
  ],
  exports: [RoutePaths, Routes],
)
class AppComponent {
  @ViewChild('navBurger')
  Element navBurger;
  @ViewChild('navMenu')
  Element navMenu;
  
  toggleNavbar() {
    this.navBurger.classes.toggle('is-active');
    this.navMenu.classes.toggle('is-active');
  }


  var name = 'Marco';
}
