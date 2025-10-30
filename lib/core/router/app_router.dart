import 'package:go_router/go_router.dart';
import 'package:switchboard/dependencies.dart';
import 'package:switchboard/features/apps/presentation/viewmodels/app_viewmodel.dart';
import 'package:switchboard/features/apps/presentation/views/app_list_page.dart';
import 'package:switchboard/features/faq/presentation/viewmodels/faq_viewmodel.dart';
import 'package:switchboard/features/faq/presentation/views/faq_page.dart';
import 'package:switchboard/features/guides/presentation/viewmodels/guide_viewmodel.dart';
import 'package:switchboard/features/guides/presentation/views/guides_list_page.dart';
import 'package:switchboard/features/home/presentation/views/main_page.dart';
import 'package:switchboard/features/skills/presentation/viewmodels/skill_viewmodel.dart';
import 'package:switchboard/features/skills/presentation/views/skill_list_page.dart';
import 'package:switchboard/features/units/presentation/viewmodels/unit_viewmodel.dart';
import 'package:switchboard/features/units/presentation/views/unit_list_page.dart';

class AppRouter {
  // final _rootNavigatorKey = GlobalKey<NavigatorState>();
  // final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static GoRouter router = GoRouter(
    // navigatorKey: _rootNavigatorKey,
    initialLocation: MainPage.route(),
    // redirect: _redirect,
    // refreshListenable: serviceLocator<SessionManager>(),
    routes: [
      GoRoute(path: MainPage.route(), builder: (context, _) => MainPage()),
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
      // StatefulShellRoute.indexedStack(
      //   builder: (context, state, navigationShell) {
      //     return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
      //   },
      //   branches: [
      //     StatefulShellBranch(
      //       routes: [
      //         GoRoute(
      //           path: '/home',
      //           builder: (context, _) =>
      //               HomePage(viewmodel: serviceLocator<HomeViewModel>()),
      //         ),
      //       ],
      //     ),
      //     StatefulShellBranch(
      //       routes: [
      //         GoRoute(path: '/logs', builder: (context, _) => const LogPage()),
      //       ],
      //     ),
      //     StatefulShellBranch(
      //       routes: [
      //         GoRoute(
      //           path: '/journal',
      //           builder: (context, _) => const JournalPage(),
      //         ),
      //       ],
      //     ),
      //     StatefulShellBranch(
      //       routes: [
      //         GoRoute(
      //           path: ChannelListPage.route(),
      //           builder: (context, _) =>
      //               ChannelListPage(viewmodel: serviceLocator<ChatViewmodel>()),
      //         ),
      //       ],
      //     ),
      //     StatefulShellBranch(
      //       routes: [
      //         GoRoute(
      //           path: ModuleListPage.route(),
      //           builder: (context, _) => ModuleListPage(
      //             viewmodel: serviceLocator<ModuleViewModel>(),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ],
      // ),
    ],
  );
}
