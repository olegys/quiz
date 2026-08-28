import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../gen/assets.gen.dart';
import '../../i18n/strings.g.dart';
import '../../logic/user_cubit/user_cubit.dart';
import '../../routes/app_routes.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_text_styles.dart';
import '../../widgets/buttons/custom_button.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  Future<void> _redirect(BuildContext context) async {
    context.read<UserCubit>().completeOnboarding();

    if (context.mounted) {
      Navigator.of(context).pushReplacementNamed(
        AppRoutes.main,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final Translations tr = Translations.of(context);

    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Image.asset(
                Assets.images.welcome.path,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            PaddedColumn(
              padding: EdgeInsets.all(20.0.r).copyWith(bottom: 0.0),
              children: [
                Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '${tr.quizBattle}\n',
                        style: AppTextStyles.mono44,
                      ),
                      TextSpan(
                        text: tr.betOnKnowledge,
                        style: AppTextStyles.mono44.copyWith(
                          color: AppColors.accentOne,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0.h,
                ),
                Text(
                  tr.createYourOwnGames,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.light16.copyWith(
                    color: AppColors.layerOne,
                  ),
                ),
                SizedBox(
                  height: 40.0.h,
                ),
                CustomButton(
                  icon: '🕹️',
                  title: tr.letsGo,
                  onPressed: () => _redirect(context),
                ),
                SizedBox(
                  height: 20.0.h,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
