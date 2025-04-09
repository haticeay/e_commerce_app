import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heraninda/assets.dart';
import 'package:heraninda/core/components/custom_app_bar.dart';
import 'package:heraninda/core/components/custom_elevated_button.dart';
import 'package:heraninda/core/components/custom_scaffold.dart';
import 'package:heraninda/core/constants/app_color.dart';
import 'package:heraninda/core/constants/app_padding.dart';
import 'package:heraninda/core/constants/app_space.dart';
import 'package:heraninda/core/constants/app_text_style.dart';
import 'package:heraninda/core/navigator_manager.dart';
import 'package:heraninda/view/authenticate/widget/auth_switch_text.dart';
import 'package:heraninda/view/authenticate/widget/otp_input_field.dart';
import 'package:heraninda/view/home/view/home_view.dart';

class VerificationView extends StatelessWidget with NavigatorManager {
  const VerificationView({super.key});
  void _onOTPCompleted(String otp) {}

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPadding.horizontalMedium(),
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(Assets.image.imVerificationPNG),
                AppSpace.vertical.space24,
                Text(
                  "OTP Verification",
                  style: AppTextStyle.instrumentSansMedium(
                    context,
                  ).copyWith(color: AppColor.primaryColor),
                ),
                AppSpace.vertical.space8,

                Text(
                  "We Send You Email Please Check Your Mail And Complete OTP Code",
                  textAlign: TextAlign.center,
                  style: AppTextStyle.instrumentSansRegular(
                    context,
                  ).copyWith(fontSize: 16),
                ),

                AppSpace.vertical.space24,
                OTPInputField(
                  length: 6, 
                  onCompleted: _onOTPCompleted,
                  style: const TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),

                  textAlign: TextAlign.center,
                ),
                AppSpace.vertical.space55,
                CustomElevatedButton(
                  onPressed: () {
                    navigateToPushWidget(context, HomeView());
                  },
                  child: Text(
                    "Confirm",
                    style: AppTextStyle.instrumentSansMedium(
                      context,
                    ).copyWith(color: AppColor.appWhiteColor),
                  ),
                ),
                SizedBox(height: 150.h),
                AuthSwitchText(
                  primaryText: "Already have an account?",
                  secondaryText: "Log in",
                  onSecondaryTap: () {},
                ),
                AppSpace.vertical.space40,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
