import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'i18n/strings.g.dart';
import 'logic/check_connection_cubit/check_connection_cubit.dart';
import 'logic/user_cubit/user_cubit.dart';
import 'repositories/questions_repository.dart';
import 'routes/app_routes.dart';
import 'services/api_service.dart';
import 'themes/app_themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

  final Directory directory = await getApplicationDocumentsDirectory();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(
      directory.path,
    ),
  );

  await LocaleSettings.useDeviceLocale();

  runApp(
    TranslationProvider(
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => QuestionsRepository(
        ApiService(),
      ),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => UserCubit(
              context.read<QuestionsRepository>(),
            ),
          ),
          BlocProvider(
            create: (_) => CheckConnectionCubit(),
          ),
        ],
        child: ScreenUtilSingleton(
          options: const ScreenUtilOptions(
            designSize: Size(402.0, 874.0),
            flipSizeWhenLandscape: true,
          ),
          child: MediaQuery.withNoTextScaling(
            child: KeyboardDismissOnTap(
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                title: Translations.of(context).appName,
                themeMode: ThemeMode.dark,
                darkTheme: AppThemes.dark,
                locale: TranslationProvider.of(context).flutterLocale,
                supportedLocales: AppLocaleUtils.supportedLocales,
                localizationsDelegates: GlobalMaterialLocalizations.delegates,
                routes: AppRoutes.routes,
                navigatorObservers: [
                  FlutterSmartDialog.observer,
                  CustomRouteObserver(),
                ],
                builder: FlutterSmartDialog.init(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
