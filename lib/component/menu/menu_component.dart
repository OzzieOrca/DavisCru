library menu;

import 'package:angular2/angular2.dart';

// These imports will go away soon:
import 'package:angular2/src/reflection/reflection.dart' show reflector;
import 'package:angular2/src/reflection/reflection_capabilities.dart' show ReflectionCapabilities;

import 'package:path/path.dart' as path;
//import 'package:daviscru/service/authentication.dart';

part 'package:daviscru/models/menu_item.dart';
part 'package:daviscru/service/repositories/menu_repository.dart';

@Component(
    selector: 'main-menu',
    injectables: const[MenuRepository]
)
@View(
    templateUrl: 'packages/daviscru/component/menu/menu.html'
)
class MenuComponent {
  final MenuRepository _repo;
  //final Authentication auth;
  List<MenuItem> menuItems;
  String loadStatus = "loading";
  String currentUrl;

  MenuComponent(this._repo/*, this.auth, Router router*/) {
   /*router.onRouteStart.listen((RouteStartEvent event) {
      event.completed.then((_) {
        if (router.activePath.length > 0) {
          currentUrl = router.activePath[0].parameters['pageUrl*'];
        } else {
          currentUrl = null;
        }
      });
    });*/

      _repo.getMenuItems().then((returnedMenuItems){
      menuItems = returnedMenuItems;
      loadStatus = "success";
    }).catchError((_) => loadStatus = "error");
  }

  bool isActive(String menuItemUrl){
    if(currentUrl == null){
      return false;
    }
    return path.split(currentUrl)[0] == menuItemUrl;
  }
}