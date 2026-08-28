import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart' hide ConnectionState;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../i18n/strings.g.dart';
import '../../logic/check_connection_cubit/check_connection_cubit.dart';
import '../../routes/app_routes.dart';
import '../../widgets/buttons/custom_button.dart';
import '../../widgets/error_toast.dart';
import '../../widgets/main_app_bar.dart';
import 'widgets/main_title.dart';
import 'widgets/start_card.dart';
import 'widgets/statistics_section.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  void _settings(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoutes.settings,
    );
  }

  void _achievements(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoutes.achievements,
    );
  }

  void _start(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoutes.quizOption,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Translations tr = Translations.of(context);

    return BlocListener<CheckConnectionCubit, CheckConnectionState>(
      listenWhen: (p, c) => p != c,
      listener: (context, state) => state.when(
        connected: () => SmartDialog.dismiss(
          status: SmartStatus.custom,
          force: true,
        ),
        disconnected: () => SmartDialog.show(
          permanent: true,
          usePenetrate: true,
          alignment: Alignment.bottomCenter,
          builder: (_) => ErrorToast(
            title: Translations.of(context).noInternetConnection,
            action: Translations.of(context).retry,
            onAction: context.read<CheckConnectionCubit>().checkConnection,
          ),
        ),
      ),
      child: PopScope(
        canPop: false,
        child: Scaffold(
          appBar: MainAppBar(
            title: tr.welcomeBackGenius,
            onPressed: () => _settings(context),
          ),
          body: Padding(
            padding: EdgeInsets.all(20.0.r).copyWith(top: 0.0),
            child: ExpandedScrollingColumn(
              children: [
                const MainTitle(),
                SizedBox(
                  height: 20.0.h,
                ),
                const StatisticsSection(),
                SizedBox(
                  height: 10.0.h,
                ),
                CustomButton(
                  icon: '🏅',
                  title: tr.achievements,
                  onPressed: () => _achievements(context),
                ),
                SizedBox(
                  height: 10.0.h,
                ),
                StartCard(
                  onPressed: () => _start(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
