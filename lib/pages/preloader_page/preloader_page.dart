import 'package:flextras/flextras.dart';
import 'package:flutter/cupertino.dart' show CupertinoActivityIndicator;
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inset_shadow/flutter_inset_shadow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../gen/assets.gen.dart';
import '../../i18n/strings.g.dart';
import '../../logic/user_cubit/user_cubit.dart';
import '../../routes/app_routes.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_shadows.dart';
import '../../themes/app_text_styles.dart';

class PreloaderPage extends StatefulWidget {
  const PreloaderPage({super.key});

  @override
  State<PreloaderPage> createState() => _PreloaderPageState();
}

class _PreloaderPageState extends State<PreloaderPage> {
  Future<void> _redirect() async {
    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      Navigator.of(context).pushReplacementNamed(
        context.read<UserCubit>().state.onboardingIsDone
            ? AppRoutes.main
            : AppRoutes.onboarding,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _redirect();
  }

  @override
  Widget build(BuildContext context) {
    final Translations tr = Translations.of(context);

    return PopScope(
      canPop: false,
      child: Scaffold(
        body: ExpandedScrollingColumn(
          children: [
            SizedBox(
              height: 240.0.h,
            ),
            Container(
              width: 122.0.r,
              height: 122.0.r,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.accentOne,
                borderRadius: BorderRadius.circular(30.0.r),
                boxShadow: AppShadows.shadowFive,
              ),
              child: Text(
                '🕹️',
                style: AppTextStyles.mono24,
              ),
            ),
            SizedBox(
              height: 10.0.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoActivityIndicator(
                  color: AppColors.accentThree,
                  radius: 15.0.r,
                ),
                SizedBox(
                  width: 8.0.w,
                ),
                Text(
                  tr.loading,
                  style: AppTextStyles.regular12,
                ),
              ],
            ),
            SizedBox(
              height: 60.0.h,
            ),
            Expanded(
              child: Image.asset(
                Assets.images.blur.path,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
