import 'package:angular/angular.dart';
import 'package:angular_app/pages/navbar/navbar.dart';
import 'package:angular_app/route_paths.dart';
import 'package:angular_app/routes.dart';
import 'package:angular_app/utils/utils.dart';
import 'package:angular_router/angular_router.dart';

@Component(
  selector: 'my-app',
  templateUrl: 'app_component.html',
  styleUrls: [
    'app_component.css',
  ],
  directives: [coreDirectives, routerDirectives, Navbar],
  exports: [RoutePaths, Routes],
  providers: [ClassProvider(Utils),ClassProvider(Navbar)]
)
class AppComponent{

}
