import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../logic/user_cubit/user_cubit.dart';
import '../models/quiz.dart';
import '../models/quiz_options.dart';
import '../pages/achievements_page/achievements_page.dart';
import '../pages/game_page/game_page.dart';
import '../pages/main_page/main_page.dart';
import '../pages/onboarding_page/onboarding_page.dart';
import '../pages/preloader_page/preloader_page.dart';
import '../pages/quiz_options_page/quiz_options_page.dart';
import '../pages/result_page/result_page.dart';
import '../pages/settings_page/settings_page.dart';

class AppRoutes {
  const AppRoutes._();

  static const String preloader = '/';
  static const String onboarding = '/onboarding';
  static const String main = '/main';
  static const String settings = '/settings';
  static const String achievements = '/achievements';
  static const String quizOption = '/quiz-options';
  static const String game = '/game';
  static const String result = '/result';

  static Map<String, WidgetBuilder> routes = {
    preloader: (_) => const PreloaderPage(),
    onboarding: (_) => const OnboardingPage(),
    main: (_) => const MainPage(),
    settings: (_) => const SettingsPage(),
    achievements: (_) => const AchievementsPage(),
    quizOption: (_) => const QuizOptionsPage(),
    game: (BuildContext context) => GamePage(
          quizOptions:
              ModalRoute.of(context)!.settings.arguments as QuizOptions,
        ),
    result: (BuildContext context) => ResultPage(
          quiz: ModalRoute.of(context)!.settings.arguments as Quiz,
        ),
  };
}

class CustomRouteObserver extends NavigatorObserver {
  @override
  void didStartUserGesture(Route route, Route? previousRoute) {
    super.didStartUserGesture(route, previousRoute);
    SmartDialog.dismiss();
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);

    if (route.settings.name == AppRoutes.quizOption) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ]);
    }
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);

    if (newRoute?.settings.name == AppRoutes.game) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ]);
    }
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);

    if (previousRoute?.settings.name == AppRoutes.main) {
      previousRoute?.navigator?.context.read<UserCubit>().checkAchievements();
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }
  }
}
