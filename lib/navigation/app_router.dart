import 'package:auto_route/auto_route.dart';
import 'package:betonchel_manager/navigation/app_router.gr.dart';
import 'package:betonchel_manager/navigation/constants/locations.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Popup|Router,Page')
class AppRouter extends $AppRouter {
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
              page: AuthorizedPage.page,
              path: '',
              children: [
                AutoRoute(
                  page: HomePage.page,
                  path: Locations.home,
                  initial: true,
                ),
                AutoRoute(
                  page: ApplicationDetailsPage.page,
                  path: Locations.applicationDetails,
                ),
                AutoRoute(
                  page: NewApplicationPage.page,
                  path: Locations.applicationNew,
                ),
                AutoRoute(
                  page: NotificationsListPage.page,
                  path: Locations.notifications,
                ),
                AutoRoute(
                  page: ProfilePage.page,
                  path: Locations.profile,
                ),
              ],
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
          ],
        ),
      ];
}
