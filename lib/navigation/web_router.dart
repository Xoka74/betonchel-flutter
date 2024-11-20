import 'package:auto_route/auto_route.dart';
import 'package:betonchel_manager/navigation/constants/locations.dart';
import 'package:betonchel_manager/navigation/custom_routes/dialog_modal_route.dart';
import 'package:betonchel_manager/navigation/web_router.gr.dart';
import 'package:injectable/injectable.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Popup|Router,Page')
@lazySingleton
class WebRouter extends $WebRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: AuthPage.page,
          path: Locations.root,
          initial: true,
          children: [
            AutoRoute(
              page: LoadingPage.page,
              path: Locations.loading,
              initial: true,
            ),
            AutoRoute(
              page: UnauthorizedPage.page,
              path: Locations.auth,
              children: [
                AutoRoute(
                  page: LoginPage.page,
                  path: Locations.login,
                  initial: true,
                ),
              ],
            ),
            AutoRoute(
              page: AuthorizedPage.page,
              path: '',
              children: [
                DialogModalRoute(
                  page: ConcreteGradeEditPage.page,
                  path: Locations.concreteGradesEdit,
                ),
                DialogModalRoute(
                  page: NewConcreteGradePage.page,
                  path: Locations.concreteGradesNew,
                ),
                DialogModalRoute(
                  page: EmployeeCreatePage.page,
                  path: Locations.usersCreate,
                ),
                AutoRoute(
                  page: OrdersMapPage.page,
                  path: Locations.ordersMap,
                  children: [
                    AutoRoute(
                      page: OrderGroupListPage.page,
                      path: 'asdasd',
                      initial: true,
                    ),
                    AutoRoute(
                      page: OrderMapDetailsPage.page,
                      path: '213e',
                    ),
                  ],
                ),
                AutoRoute(
                  page: HomeRootPage.page,
                  path: '',
                  initial: true,
                  children: [
                    AutoRoute(
                      page: ApplicationListPage.page,
                      path: Locations.home,
                      initial: true,
                    ),
                    AutoRoute(
                      page: OrderDetailsPage.page,
                      path: Locations.orderDetails,
                    ),
                    AutoRoute(
                      page: UsersListPage.page,
                      path: Locations.users,
                    ),
                    AutoRoute(
                      page: CreateOrderPage.page,
                      path: Locations.orders,
                    ),
                    AutoRoute(
                      page: LocationSearchPage.page,
                      path: Locations.locationsSearch,
                    ),
                    AutoRoute(
                      page: EditOrderPage.page,
                      path: Locations.orders,
                    ),
                    AutoRoute(
                      page: SettingsPage.page,
                      path: Locations.settings,
                    ),
                    AutoRoute(
                      page: ProfilePage.page,
                      path: Locations.profile,
                    ),
                    AutoRoute(
                      page: ConcreteGradeListPage.page,
                      path: Locations.concreteGrades,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ];
}
