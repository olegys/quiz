import 'dart:io';

import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../i18n/strings.g.dart';
import '../../logic/user_cubit/user_cubit.dart';
import '../../routes/app_routes.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_shadows.dart';
import '../../themes/app_text_styles.dart';
import '../../widgets/dialogs/custom_dialog.dart';
import '../../widgets/secondary_app_bar.dart';
import 'widgets/settings_card.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  Future<void> _buzzSettings() async {
    await openAppSettings();
  }

  Future<void> _sendToFriends() async {
    const String androidLink = 'https://play.google.com/store/apps/details?id=';
    const String iosLink = 'https://apps.apple.com/app/id';

    await SharePlus.instance.share(
      ShareParams(
        uri: Uri.parse(
          Platform.isAndroid ? androidLink : iosLink,
        ),
      ),
    );
  }

  Future<void> _tellUsWhatYouThink() async {
    const String link = 'https://www.google.com';
    final Uri url = Uri.parse(link);

    if (await canLaunchUrl(url)) {
      launchUrl(url);
    }
  }

  Future<void> _showSomeLove() async {
    final InAppReview inAppReview = InAppReview.instance;

    if (Platform.isAndroid) {
      await inAppReview.openStoreListing();
    } else {
      if (await inAppReview.isAvailable()) {
        inAppReview.requestReview();
      } else {
        inAppReview.openStoreListing(
          appStoreId: 'appStoreId',
        );
      }
    }
  }

  Future<void> _playerPrivacy() async {
    const String link = 'https://www.google.com';
    final Uri url = Uri.parse(link);

    if (await canLaunchUrl(url)) {
      launchUrl(url);
    }
  }

  Future<void> _resetMyJourney(BuildContext context) async {
    final Translations tr = Translations.of(context);
    final UserCubit userCubit = context.read<UserCubit>();

    final bool? isReset = await SmartDialog.show(
      maskColor: AppColors.backgroundThree,
      builder: (_) => CustomDialog(
        title: tr.resetMyJourney,
        description: tr.areYouSureYouWantToReset,
        action: tr.reset,
      ),
    );

    if (isReset == true) {
      userCubit.resetData();

      if (context.mounted) {
        Navigator.of(context).pushNamedAndRemoveUntil(
          AppRoutes.onboarding,
          (Route route) => false,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final Translations tr = Translations.of(context);

    return Scaffold(
      appBar: SecondaryAppBar(
        title: tr.settings,
        onPressed: Navigator.of(context).pop,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10.0.r),
            margin: EdgeInsets.all(20.0.r).copyWith(top: 0.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.0.r),
              color: AppColors.backgroundOne,
              boxShadow: AppShadows.shadowTwo,
            ),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20.0.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0.r),
                color: AppColors.backgroundTwo,
                border: Border.all(
                  width: 1.0.r,
                  color: AppColors.layerFive,
                ),
              ),
              child: SeparatedColumn(
                separatorBuilder: () => Divider(
                  height: 16.0.h,
                  thickness: 1.0.h,
                  indent: 60.0.w,
                  color: AppColors.layerFive,
                ),
                children: [
                  SettingsCard(
                    icon: '🔔',
                    title: tr.buzzSettings,
                    onTap: _buzzSettings,
                  ),
                  SettingsCard(
                    icon: '📤',
                    title: tr.sendToFriends,
                    onTap: _sendToFriends,
                  ),
                  SettingsCard(
                    icon: '💬',
                    title: tr.tellUsWhatYouThink,
                    onTap: _tellUsWhatYouThink,
                  ),
                  SettingsCard(
                    icon: '⭐',
                    title: tr.showSomeLove,
                    onTap: _showSomeLove,
                  ),
                  SettingsCard(
                    icon: '🔐',
                    title: tr.playerPrivacy,
                    onTap: _playerPrivacy,
                  ),
                  SettingsCard(
                    icon: '🧨️',
                    title: tr.resetMyJourney,
                    onTap: () => _resetMyJourney(context),
                  ),
                ],
              ),
            ),
          ),
          BlocSelector<UserCubit, UserState, String>(
            selector: (state) => state.version,
            builder: (context, version) => Text(
              tr.versionApp(icon: '🔧', version: version),
              style: AppTextStyles.light14.copyWith(
                color: AppColors.layerOne,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
