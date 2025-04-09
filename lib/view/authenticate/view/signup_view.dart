import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heraninda/assets.dart';
import 'package:heraninda/core/components/custom_app_bar.dart';
import 'package:heraninda/core/components/custom_elevated_button.dart';
import 'package:heraninda/core/components/custom_scaffold.dart';
import 'package:heraninda/core/components/custom_text_field.dart';
import 'package:heraninda/core/constants/app_color.dart';
import 'package:heraninda/core/constants/app_padding.dart';
import 'package:heraninda/core/constants/app_space.dart';
import 'package:heraninda/core/constants/app_strings.dart'; // Sabit metinler
import 'package:heraninda/core/constants/app_text_style.dart';
import 'package:heraninda/core/navigator_manager.dart';
import 'package:heraninda/core/service/signup_service.dart';
import 'package:heraninda/view/authenticate/view/login_view.dart';
import 'package:heraninda/view/authenticate/widget/auth_switch_text.dart';
import 'package:heraninda/view/authenticate/widget/login_with_widget.dart';
import 'package:heraninda/view/authenticate/widget/social_login_buttons.dart';

class SignupView extends ConsumerStatefulWidget with NavigatorManager{
  const SignupView({super.key});

  @override
  ConsumerState<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends ConsumerState<SignupView> with NavigatorManager {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void _signUp() {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();
    navigateToPushWidget(context, const LoginView());

    try {
      ref.read(userServiceProvider.notifier).addUser(
            name,
            email,
            password,
            confirmPassword,
          );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(AppStrings.registrationSuccess)),
      );

      _nameController.clear();
      _emailController.clear();
      _passwordController.clear();
      _confirmPasswordController.clear();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("${AppStrings.registrationError}${e.toString()}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPadding.horizontalMedium(),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  AppStrings.signupTitle,
                  style: AppTextStyle.instrumentSansMedium(context)
                      .copyWith(color: AppColor.primaryColor),
                ),
                AppSpace.vertical.space8,
                Text(
                  AppStrings.signupSubtitle,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.instrumentSansRegular(context)
                      .copyWith(fontSize: 16),
                ),
                AppSpace.vertical.space40,
                CustomTextField(
                  controller: _nameController,
                  hintText: AppStrings.nameHint,
                  prefixIcon: Assets.icon.icRoundEmailSVG,
                  keyboardType: TextInputType.name,
                ),
                AppSpace.vertical.space20,
                CustomTextField(
                  controller: _emailController,
                  hintText: AppStrings.emailHint,
                  prefixIcon: Assets.icon.icRoundEmailSVG,
                  keyboardType: TextInputType.emailAddress,
                ),
                AppSpace.vertical.space20,
                CustomTextField(
                  controller: _passwordController,
                  hintText: AppStrings.passwordHint,
                  prefixIcon: Assets.icon.icPasswordSVG,
                  keyboardType: TextInputType.visiblePassword,
                  isPassword: true,
                ),
                AppSpace.vertical.space20,
                CustomTextField(
                  controller: _confirmPasswordController,
                  hintText: AppStrings.confirmPasswordHint,
                  prefixIcon: Assets.icon.icPasswordSVG,
                  keyboardType: TextInputType.visiblePassword,
                  isPassword: true,
                ),
                AppSpace.vertical.space24,
                CustomElevatedButton(
                  onPressed: _signUp,
                  child: Text(
                    AppStrings.signupButton,
                    style: AppTextStyle.instrumentSansMedium(context)
                        .copyWith(color: AppColor.appWhiteColor),
                  ),
                ),
                AppSpace.vertical.space16,
                const LoginWithWidget(),
                AppSpace.vertical.space30,
                 SocialLoginIcons(
                  onAppleSignIn: () {},
                  onGoogleSignIn: () {},
                  onFacebookSignIn: () {},
                ),
                AppSpace.vertical.space30,
                AuthSwitchText(
                  primaryText: AppStrings.alreadyHaveAccount,
                  secondaryText: AppStrings.logIn,
                  onSecondaryTap: () {
                    widget.navigateToPushWidget(context, const LoginView());
                  },
                ),
                                AppSpace.vertical.space30,

              ],
            ),
          ),
        ),
      ),
    );
  }
}