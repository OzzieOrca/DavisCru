library daviscru_web;

import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';
import 'package:angular/routing/module.dart';
//import 'package:logging/logging.dart';

import 'package:daviscru_web/routing/daviscru_router.dart';
import 'package:daviscru_web/component/title/title_component.dart';
import 'package:daviscru_web/component/menu/menu_component.dart';
import 'package:daviscru_web/component/page/page_component.dart';
import 'package:daviscru_web/component/stats/stats_panel_component.dart';
import 'package:daviscru_web/service/authentication.dart';
import 'package:daviscru_web/service/global.dart';

class RoutingModule extends Module {
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
}

void main() {
  /*Logger.root..level = Level.FINEST
    ..onRecord.listen((LogRecord r) => print(r.message));*/
  applicationFactory()
      .addModule(new RoutingModule())
      .addModule(new TitleModule())
      .addModule(new MenuModule())
      .addModule(new PageModule())
      .addModule(new StatsModule())
      .run();
}