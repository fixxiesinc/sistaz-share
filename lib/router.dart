import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class Routes {
  static const String chat = 'chat';
  static const String contact = 'contact';
  static const String welcome = 'welcome';
  static const String login = 'login';
  static const String register = 'register';
  static const String ourStory = 'our-story';
  static const String inviteAFriend = 'invite-a-friend';
  static const String becomeACounselor = 'become-a-counsellor';
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
        return Layout(child: child);
        // return Obx(() {
        //   return viewController.splashPlayed.value
        //       ? Layout(child: child)
        //       : const Splash();
        // });
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

        // welcome
        GoRoute(
          path: '/${Routes.welcome}',
          name: Routes.welcome,
          parentNavigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state) {
            viewController.currentPage('Join Us');
            return const NoTransitionPage(child: JoinUs());
          },
          routes: [
            // login
            GoRoute(
              path: Routes.login,
              name: Routes.login,
              parentNavigatorKey: _shellNavigatorKey,
              pageBuilder: (context, state) {
                viewController.currentPage('Join Us');
                return const NoTransitionPage(child: Login());
              },
            ),

            // register
            GoRoute(
              path: Routes.register,
              name: Routes.register,
              parentNavigatorKey: _shellNavigatorKey,
              pageBuilder: (context, state) {
                viewController.currentPage('Join Us');
                return const NoTransitionPage(child: Register());
              },
            ),
          ],
        ),

        // become a counsellor
        GoRoute(
          path: '/${Routes.becomeACounselor}',
          name: Routes.becomeACounselor,
          parentNavigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state) {
            viewController.currentPage('Become a Counsellor');
            return const NoTransitionPage(child: BecomeACounsellor());
          },
        ),

        // invite a friend
        GoRoute(
          path: '/${Routes.inviteAFriend}',
          name: Routes.inviteAFriend,
          parentNavigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state) {
            viewController.currentPage('Invite a Friend');
            return const NoTransitionPage(child: InviteAFriend());
          },
        ),

        // chat
        GoRoute(
          path: '/${Routes.chat}',
          name: Routes.chat,
          redirect: (context, state) {
            if (userController.user != null) {
              return '/${Routes.chat}';
            } else {
              return '/${Routes.welcome}';
            }
          },
          parentNavigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state) {
            viewController.currentPage('Chat');
            return const NoTransitionPage(child: ChatPage());
          },
        ),
      ],
    ),
  ],
);
