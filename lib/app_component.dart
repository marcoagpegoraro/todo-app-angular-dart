import 'package:angular/angular.dart';
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
  ],
)
class AppComponent {
  var name = 'Marco';
}
