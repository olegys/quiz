import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:lottie/lottie.dart';

import '../../gen/assets.gen.dart';
import '../../helpers/app_enums.dart';
import '../../helpers/app_extensions.dart';
import '../../i18n/strings.g.dart';
import '../../logic/user_cubit/user_cubit.dart';
import '../../models/quiz_options.dart';
import '../../models/trivia_category.dart';
import '../../routes/app_routes.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_shadows.dart';
import '../../themes/app_text_styles.dart';
import '../../widgets/buttons/custom_icon_button.dart';
import '../../widgets/dialogs/custom_dialog.dart';
import 'logic/quiz_options_cubit/quiz_options_cubit.dart';
import 'widgets/amount_selector.dart';
import 'widgets/custom_dropdown.dart';
import 'widgets/dialogs/amount_dialog.dart';

class QuizOptionsPage extends StatefulWidget {
  const QuizOptionsPage({super.key});

  @override
  State<QuizOptionsPage> createState() => _QuizOptionsPageState();
}

class _QuizOptionsPageState extends State<QuizOptionsPage> {
  Future<void> _start(BuildContext context) async {
    final Translations tr = Translations.of(context);
    final QuizOptionsCubit quizOptionsCubit = context.read<QuizOptionsCubit>();

    final bool? isConfirmed = await SmartDialog.show(
      maskColor: AppColors.backgroundThree,
      builder: (_) => CustomDialog(
        title: tr.startQuiz,
        description: tr.areYouSureAbout,
        action: tr.confirm,
        color: AppColors.accentOne,
      ),
    );

    if (isConfirmed == true && context.mounted) {
      Navigator.of(context).pushReplacementNamed(
        AppRoutes.game,
        arguments: QuizOptions(
          amount: quizOptionsCubit.state.amount,
          category: quizOptionsCubit.state.category,
          difficulty: quizOptionsCubit.state.difficulty,
          type: quizOptionsCubit.state.type,
        ),
      );
    }
  }

  Future<void> _showAmountDialog(BuildContext context) async {
    final QuizOptionsCubit quizOptionsCubit = context.read<QuizOptionsCubit>();
    final int amount = quizOptionsCubit.state.amount;

    final int? newAmount = await SmartDialog.show(
      maskColor: AppColors.backgroundThree,
      alignment: Alignment.bottomCenter,
      builder: (_) => AmountDialog(
        amount: amount,
      ),
    );

    if (newAmount != null) {
      quizOptionsCubit.changeAmount('$newAmount');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Translations tr = Translations.of(context);

    return BlocProvider(
      create: (_) => QuizOptionsCubit(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.accentTwo,
        body: OrientationBuilder(
          builder: (context, orientation) {
            if (orientation == Orientation.portrait) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  Positioned(
                    top: 84.0.h,
                    left: 30.0.w,
                    child: CustomIconButton(
                      icon: Assets.icons.chevronLeft.path,
                      onPressed: Navigator.of(context).pop,
                    ),
                  ),
                  Center(
                    child: Lottie.asset(
                      Assets.lottie.rotatePhone,
                      width: 264.0.r,
                      height: 264.0.r,
                    ),
                  ),
                ],
              );
            }

            return BlocBuilder<QuizOptionsCubit, QuizOptionsState>(
              builder: (context, state) {
                return Stack(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Image.asset(
                            Assets.images.game.path,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(10.0.r),
                            color: AppColors.backgroundTwo,
                            child: Container(
                              padding: EdgeInsets.all(20.0.r),
                              decoration: BoxDecoration(
                                color: AppColors.backgroundOne,
                                borderRadius: BorderRadius.circular(50.0.r),
                                boxShadow: AppShadows.shadowTwo,
                              ),
                              child: Column(
                                children: [
                                  SeparatedColumn(
                                    separatorBuilder: () => SizedBox(
                                      height: 4.0.h,
                                    ),
                                    children: [
                                      AmountSelector(
                                        amount: state.amount,
                                        onTap: () => _showAmountDialog(context),
                                        onClear: () => context
                                            .read<QuizOptionsCubit>()
                                            .changeAmount('10'),
                                      ),
                                      BlocSelector<UserCubit, UserState,
                                          List<TriviaCategory>>(
                                        selector: (state) => state.categories,
                                        builder: (context, categories) =>
                                            CustomDropdown<int?>(
                                          onSelected: context
                                              .read<QuizOptionsCubit>()
                                              .selectCategory,
                                          initialValue: state.category,
                                          title: tr.selectCategory,
                                          values: [
                                            DropdownMenuEntry(
                                              value: null,
                                              label: tr.anyCategory,
                                            ),
                                            ...categories.map(
                                              (category) => DropdownMenuEntry(
                                                value: category.id,
                                                label: category.name,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      CustomDropdown<QuestionDifficulty?>(
                                        onSelected: context
                                            .read<QuizOptionsCubit>()
                                            .selectDifficulty,
                                        initialValue: state.difficulty,
                                        title: tr.selectDifficulty,
                                        values: [
                                          DropdownMenuEntry(
                                            value: null,
                                            label: tr.anyDifficulty,
                                          ),
                                          ...QuestionDifficulty.values.map(
                                            (value) => DropdownMenuEntry(
                                              value: value,
                                              label: value.getTitle(context),
                                            ),
                                          ),
                                        ],
                                      ),
                                      CustomDropdown<QuestionType?>(
                                        onSelected: context
                                            .read<QuizOptionsCubit>()
                                            .selectType,
                                        initialValue: state.type,
                                        title: tr.selectType,
                                        values: [
                                          DropdownMenuEntry(
                                            value: null,
                                            label: tr.anyType,
                                          ),
                                          ...QuestionType.values.map(
                                            (value) => DropdownMenuEntry(
                                              value: value,
                                              label: value.getTitle(context),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Text(
                                              tr.quizOption,
                                              style: AppTextStyles.bold18,
                                            ),
                                            SizedBox(
                                              height: 2.0.h,
                                            ),
                                            Text(
                                              tr.fillInAll,
                                              style: AppTextStyles.light14
                                                  .copyWith(
                                                color: AppColors.layerOne,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.0.w,
                                      ),
                                      CustomIconButton.orange(
                                        icon: Assets
                                            .icons.chevronDoubleRight.path,
                                        onPressed: () => _start(context),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      left: 30.0.r,
                      bottom: 30.0.r,
                      child: CustomIconButton(
                        icon: Assets.icons.chevronLeft.path,
                        onPressed: Navigator.of(context).pop,
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
