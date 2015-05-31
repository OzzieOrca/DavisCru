library daviscru;

import 'package:angular2/angular2.dart';

// These imports will go away soon:
import 'package:angular2/src/reflection/reflection.dart' show reflector;
import 'package:angular2/src/reflection/reflection_capabilities.dart' show ReflectionCapabilities;

/*import 'package:daviscru/routing/daviscru_router.dart';
import 'package:daviscru/component/title/title_component.dart';*/
import 'package:daviscru/component/menu/menu_component.dart';
/*import 'package:daviscru/component/page/page_component.dart';
import 'package:daviscru/component/stats/stats_panel_component.dart';
import 'package:daviscru/service/authentication.dart';
import 'package:daviscru/service/global.dart';*/

/*class RoutingModule extends Module {
  RoutingModule() {
    bind(RouteInitializerFn, toValue: davisCruRouteInitializer);
    //bind(NgRoutingUsePushState, toValue: new NgRoutingUsePushState.value(false));
  }
}

class TitleModule extends Module {
  TitleModule() {
    bind(TitleComponent);
    bind(Global);
  }
}

class MenuModule extends Module {
  MenuModule() {
    bind(MenuComponent);
    bind(MenuRepository);
    bind(Authentication);
  }
}

class PageModule extends Module {
  PageModule() {
    bind(PageComponent);
    bind(PageRepository);
    bind(Global);
  }
}

class StatsModule extends Module {
  StatsModule() {
    bind(StatsPanelComponent);
    bind(StatsRepository);
  }
}*/

@Component(
    selector: 'daviscru-app'
)
@View(
    template: '''
      <main-menu></main-menu>
      <ng-view></ng-view>
    ''',
    directives: const[MenuComponent]
)
class DavisCruApp {
}

void main() {
  /*Logger.root..level = Level.FINEST
    ..onRecord.listen((LogRecord r) => print(r.message));*/
  /*applicationFactory()
      .addModule(new RoutingModule())
      .addModule(new TitleModule())
      .addModule(new MenuModule())
      .addModule(new PageModule())
      .addModule(new StatsModule())
      .run();*/
  reflector.reflectionCapabilities = new ReflectionCapabilities();

  bootstrap(DavisCruApp);
}