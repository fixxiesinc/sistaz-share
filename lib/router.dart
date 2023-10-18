import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class Routes {
  static const String contact = 'contact';
  static const String joinUs = 'join-us';
  static const String ourStory = 'our-story';
  static const String inviteAFriend = 'invite-a-friend';
  static const String becomeACounselor = 'become-a-counselor';
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return Obx(() {
          return viewController.splashPlayed.value
              ? Layout(child: child)
              : const Splash();
        });
      },
      routes: [
        // latest
        GoRoute(
          path: '/',
          name: 'home',
          parentNavigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state) {
            return const NoTransitionPage(child: Home());
          },
        ),

        // contact
        GoRoute(
          path: '/${Routes.contact}',
          name: Routes.contact,
          parentNavigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state) {
            viewController.currentPage('Contact');
            return const NoTransitionPage(child: Contact());
          },
        ),

        // join us
        GoRoute(
          path: '/${Routes.joinUs}',
          name: Routes.joinUs,
          parentNavigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state) {
            viewController.currentPage('Join Us');
            return const NoTransitionPage(child: TellStories());
          },
        ),
      ],
    ),
  ],
);
