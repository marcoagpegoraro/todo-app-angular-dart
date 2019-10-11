import 'package:angular/angular.dart';

@Component(
  selector: 'my-app',
  // styleUrls: const ['app_component.css'],
  templateUrl: 'app_component.html',
  // TODO: Remove MaterialIconComponent from directives.
  // (Blocked on https://github.com/dart-lang/angular_components/issues/145.)
  // directives: const [CORE_DIRECTIVES, materialDirectives, MaterialIconComponent],
  // providers: const [materialProviders],
)
class AppComponent {
  var name = 'Angular';
}
