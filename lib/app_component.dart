import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_router/angular_router.dart';

@Component(
  selector: 'my-app',
  templateUrl: 'app_component.html',
  styleUrls: [
    'app_component.css',
    'package:angular_components/app_layout/layout.scss.css',
  ],
  directives: [
    coreDirectives,
    routerDirectives,
    DeferredContentDirective,
    MaterialButtonComponent,
    MaterialIconComponent,
    MaterialPersistentDrawerDirective,
    MaterialToggleComponent,
    MaterialListComponent,
    MaterialListItemComponent
  ],
  providers: [
    materialProviders,
    ExistingProvider(DeferredContentAware, MaterialTemporaryDrawerComponent)
  ],
)
class AppComponent extends MaterialDrawerBase {
  AppComponent() : super(visible: false);
  var name = 'World';

  @HostListener('click')
  @override
  void toggle() {
    if (visible && !canClose) return;
    super.toggle();
  }

  @Input()
  bool canClose = true;
}
