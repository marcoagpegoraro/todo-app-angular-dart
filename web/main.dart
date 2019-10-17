import 'package:angular/angular.dart';
import 'package:angular_app/app_component.template.dart' as ng;
import 'package:angular_router/angular_router.dart';
import 'main.template.dart' as self;

@GenerateInjector(
  routerProvidersHash, // You can use routerProviders in production
)
// ignore: undefined_prefixed_name
final InjectorFactory injector = self.injector$Injector;

void main() {
  runApp(ng.AppComponentNgFactory, createInjector: injector);
}
