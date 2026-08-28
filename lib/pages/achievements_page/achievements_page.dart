import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../helpers/app_enums.dart';
import '../../i18n/strings.g.dart';
import '../../logic/user_cubit/user_cubit.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_shadows.dart';
import '../../widgets/secondary_app_bar.dart';
import '../main_page/widgets/statistics_section.dart';
import 'widgets/achievement_section.dart';

class AchievementsPage extends StatefulWidget {
  const AchievementsPage({super.key});

  @override
  State<AchievementsPage> createState() => _AchievementsPageState();
}

class _AchievementsPageState extends State<AchievementsPage> {
  @override
  void initState() {
    super.initState();
    context.read<UserCubit>().viewStatistics();
  }

  @override
  Widget build(BuildContext context) {
    final Translations tr = Translations.of(context);

    return Scaffold(
      appBar: SecondaryAppBar(
        title: tr.achievements,
        onPressed: Navigator.of(context).pop,
      ),
      body: PaddedColumn(
        padding: EdgeInsets.all(20.0.r).copyWith(top: 0.0),
        children: [
          const StatisticsSection(),
          SizedBox(
            height: 20.0.h,
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40.0.r),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.backgroundOne,
                  borderRadius: BorderRadius.circular(40.0.r),
                  boxShadow: AppShadows.shadowTwo,
                ),
                child: BlocBuilder<UserCubit, UserState>(
                  builder: (context, state) {
                    return ListView.separated(
                      padding: EdgeInsets.symmetric(
                        vertical: 20.0.h,
                        horizontal: 10.0.w,
                      ),
                      separatorBuilder: (_, __) => SizedBox(
                        height: 10.0.h,
                      ),
                      itemCount: AchievementGroup.values.length,
                      itemBuilder: (context, index) => AchievementSection(
                        group: AchievementGroup.values[index],
                        achievements: state.achievements
                            .where((e) =>
                                e.group == AchievementGroup.values[index])
                            .toList(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
