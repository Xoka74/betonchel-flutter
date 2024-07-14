import 'package:auto_route/auto_route.dart';
import 'package:betonchel_manager/navigation/app_router.gr.dart';
import 'package:betonchel_manager/navigation/constants/locations.dart';
import 'package:betonchel_manager/navigation/custom_routes/dialog_modal_route.dart';
import 'package:injectable/injectable.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Popup|Router,Page')
@lazySingleton
class AppRouter extends $AppRouter {
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
              path: Locations.employeesCreate,
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
              page: HomeRootPage.page,
              path: '',
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
                  page: EmployeesListPage.page,
                  path: Locations.employees,
                ),
                AutoRoute(
                  page: NotificationsListPage.page,
                  path: Locations.notifications,
                ),
                AutoRoute(
                  page: NewOrderPage.page,
                  path: Locations.orders,
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
      ];
}
