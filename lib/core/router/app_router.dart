import 'package:go_router/go_router.dart';
import 'package:switchboard/core/router/nav_scaffold.dart';
import 'package:switchboard/dependencies.dart';
import 'package:switchboard/features/apps/presentation/viewmodels/app_viewmodel.dart';
import 'package:switchboard/features/apps/presentation/views/app_list_page.dart';
import 'package:switchboard/features/faq/presentation/viewmodels/faq_viewmodel.dart';
import 'package:switchboard/features/faq/presentation/views/faq_page.dart';
import 'package:switchboard/features/home/presentation/viewmodels/feed_viewmodel.dart';
import 'package:switchboard/features/guides/presentation/viewmodels/guide_viewmodel.dart';
import 'package:switchboard/features/guides/presentation/views/guides_list_page.dart';
import 'package:switchboard/features/home/presentation/views/emergency_page.dart';
import 'package:switchboard/features/home/presentation/views/home_page.dart';
import 'package:switchboard/features/resources/presentation/viewmodels/category_viewmodel.dart';
import 'package:switchboard/features/resources/presentation/viewmodels/resource_viewmodel.dart';
import 'package:switchboard/features/resources/presentation/views/category_list_page.dart';
import 'package:switchboard/features/resources/presentation/views/hotline_list_page.dart';
import 'package:switchboard/features/resources/presentation/views/resource_list_cat_page.dart';
import 'package:switchboard/features/resources/presentation/views/resource_list_page.dart';
import 'package:switchboard/features/skills/presentation/viewmodels/skill_viewmodel.dart';
import 'package:switchboard/features/skills/presentation/views/skill_list_page.dart';
import 'package:switchboard/features/units/presentation/viewmodels/unit_viewmodel.dart';
import 'package:switchboard/features/units/presentation/views/unit_list_page.dart';

class AppRouter {
  // final _rootNavigatorKey = GlobalKey<NavigatorState>();
  // final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static GoRouter router = GoRouter(
    // navigatorKey: _rootNavigatorKey,
    initialLocation: '/home',
    // redirect: _redirect,
    // refreshListenable: ,
    routes: [
      GoRoute(
        path: UnitListPage.route(),
        builder: (context, _) =>
            UnitListPage(viewmodel: serviceLocator<UnitViewModel>()),
      ),
      GoRoute(
        path: AppListPage.route(),
        builder: (context, _) =>
            AppListPage(viewmodel: serviceLocator<AppViewModel>()),
      ),
      GoRoute(
        path: FaqPage.route(),
        builder: (context, _) =>
            FaqPage(viewmodel: serviceLocator<FaqViewModel>()),
      ),
      GoRoute(
        path: SkillListPage.route(),
        builder: (context, _) =>
            SkillListPage(viewmodel: serviceLocator<SkillViewModel>()),
      ),
      GoRoute(
        path: GuidesListPage.route(),
        builder: (context, _) =>
            GuidesListPage(viewmodel: serviceLocator<GuideViewModel>()),
      ),
      GoRoute(
        path: ResourceListPage.route(),
        builder: (context, _) =>
            ResourceListPage(viewmodel: serviceLocator<ResourceViewModel>()),
      ),
      GoRoute(
        path: ResourceListCatPage.route(),
        builder: (context, state) => ResourceListCatPage(
          viewmodel: serviceLocator<ResourceViewModel>(),
          categoryId: state.pathParameters['categoryId'] ?? '0',
          categoryName: state.pathParameters['categoryName'] ?? '0',
        ),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                builder: (context, _) =>
                    HomePage(viewmodel: serviceLocator<FeedViewModel>()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: CategoryListPage.route(),
                builder: (context, _) => CategoryListPage(
                  viewmodel: serviceLocator<CategoryViewModel>(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/hotlines',
                builder: (context, _) => HotlineListPage(
                  viewmodel: serviceLocator<ResourceViewModel>(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/emergency',
                builder: (context, _) => EmergencyPage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
