import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heraninda/assets.dart';
import 'package:heraninda/core/components/custom_elevated_button.dart';
import 'package:heraninda/core/components/custom_outlined_button.dart';
import 'package:heraninda/core/components/custom_scaffold.dart';
import 'package:heraninda/core/constants/app_color.dart';
import 'package:heraninda/core/constants/app_padding.dart';
import 'package:heraninda/core/constants/app_space.dart';
import 'package:heraninda/core/constants/app_strings.dart'; // Sabit metinler
import 'package:heraninda/core/constants/app_text_style.dart';
import 'package:heraninda/core/navigator_manager.dart';
import 'package:heraninda/view/authenticate/view/login_view.dart';
import 'package:heraninda/view/authenticate/view/signup_view.dart';

class WelcomeView extends StatelessWidget with NavigatorManager {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPadding.horizontalMedium(),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppSpace.vertical.space40,
                Image.asset(Assets.image.imWelcomePNG),
                AppSpace.vertical.space55,
                Text(
                  AppStrings.appName,
                  style: AppTextStyle.instrumentSansBold(
                    context,
                  ).copyWith(fontSize: 34.sp, color: AppColor.primaryColor),
                ),

                AppSpace.vertical.space20,
                Text(
                  AppStrings.welcomeSubtitle,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.instrumentSansRegular(
                    context,
                  ).copyWith(color: const Color.fromRGBO(55, 71, 79, 1)),
                ),
                AppSpace.vertical.space66,
                CustomElevatedButton(
                  onPressed: () {
                    navigateToPushWidget(context, const LoginView());
                  },
                  child: Text(
                    AppStrings.logIn,
                    style: AppTextStyle.instrumentSansMedium(
                      context,
                    ).copyWith(color: AppColor.appWhiteColor),
                  ),
                ),
                AppSpace.vertical.space16,
                CustomOutlinedButton(
                  onPressed: () {
                    navigateToPushWidget(context, const SignupView());
                  },
                  child: Text(
                    AppStrings.signUp,
                    style: AppTextStyle.instrumentSansMedium(
                      context,
                    ).copyWith(color: AppColor.primaryColor),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
