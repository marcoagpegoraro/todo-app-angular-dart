import 'package:angular_router/angular_router.dart';

import 'route_paths.dart';
import 'pages/login/login.template.dart' as login_template;

export 'route_paths.dart';

class Routes {
  static final login = RouteDefinition(
    routePath: RoutePaths.login,
    component: login_template.LoginNgFactory,
  );

  static final all = <RouteDefinition>[
    login,
  ];
}