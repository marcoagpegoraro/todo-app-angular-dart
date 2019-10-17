import 'package:angular_router/angular_router.dart';

import 'route_paths.dart';
import 'pages/login/login.template.dart' as login_template;
import 'pages/signup/signup.template.dart' as signup_template;
import 'pages/dashboard/dashboard.template.dart' as dashboard_template;

export 'route_paths.dart';

class Routes {
  static final login = RouteDefinition(
    routePath: RoutePaths.login,
    component: login_template.LoginNgFactory,
  );
  static final signup = RouteDefinition(
    routePath: RoutePaths.signup,
    // ignore: undefined_prefixed_name
    component: signup_template.SignupNgFactory,
  );
  static final dashboard = RouteDefinition(
    routePath: RoutePaths.dashboard,
    component: dashboard_template.DashboardNgFactory,
  );

  static final all = <RouteDefinition>[
    login,
    signup,
    dashboard
  ];
}