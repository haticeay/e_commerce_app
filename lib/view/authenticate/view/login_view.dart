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
import 'package:heraninda/core/constants/app_strings.dart';
import 'package:heraninda/core/constants/app_text_style.dart';
import 'package:heraninda/core/navigator_manager.dart';
import 'package:heraninda/core/service/signup_service.dart';
import 'package:heraninda/view/authenticate/provider/remember_me_provider.dart';
import 'package:heraninda/view/authenticate/view/signup_view.dart';
import 'package:heraninda/view/authenticate/view/verification_view.dart';
import 'package:heraninda/view/authenticate/widget/auth_switch_text.dart';
import 'package:heraninda/view/authenticate/widget/login_with_widget.dart';
import 'package:heraninda/view/authenticate/widget/remember_me_checkbox.dart';
import 'package:heraninda/view/authenticate/widget/social_login_buttons.dart';
import 'package:heraninda/view/authenticate/model/user_model.dart';

class LoginView extends ConsumerStatefulWidget with NavigatorManager {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await loadRememberMeInfo(ref);
      final rememberMe = ref.read(rememberMeProvider);
      if (rememberMe) {
        _emailController.text = ref.read(rememberedEmailProvider) ?? '';
        _passwordController.text = ref.read(rememberedPasswordProvider) ?? '';
      }
    });
  }

  void _login() {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final rememberMe = ref.read(rememberMeProvider);

    final userList = ref.read(userServiceProvider);

    final matchedUser = userList.firstWhere(
      (user) => user.email == email && user.password == password,
      orElse:
          () => User(
            name: '',
            email: '',
            password: '',
            id: '',
            confirmPassword: '',
          ),
    );

    if (matchedUser.email.isNotEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text(AppStrings.loginSuccess)));
      saveRememberMeInfo(
        ref,
        rememberMe,
        rememberMe ? email : null,
        rememberMe ? password : null,
      );
      widget.navigateToPushWidget(context, const VerificationView());
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text(AppStrings.loginFailed)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final rememberMe = ref.watch(rememberMeProvider);

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
                
                Image.asset(Assets.image.imLoginPNG),
                AppSpace.vertical.space24,
                Text(
                  AppStrings.loginTitle,
                  style: AppTextStyle.instrumentSansMedium(context),
                ),
                AppSpace.vertical.space8,
                Text(
                  AppStrings.loginSubtitle,
                  style: AppTextStyle.instrumentSansRegular(
                    context,
                  ).copyWith(fontSize: 16),
                ),
                AppSpace.vertical.space40,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RememberMeCheckbox(
                      value: rememberMe,
                      onChanged: (value) {
                        ref.read(rememberMeProvider.notifier).state =
                            value ?? false;
                      },
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        AppStrings.forgetPassword,
                        style: AppTextStyle.instrumentSansRegular(
                          context,
                        ).copyWith(
                          color: AppColor.primaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                AppSpace.vertical.space24,
                CustomElevatedButton(
                  onPressed: _login,
                  child: Text(
                    AppStrings.loginButton,
                    style: AppTextStyle.instrumentSansMedium(
                      context,
                    ).copyWith(color: AppColor.appWhiteColor),
                  ),
                ),
                AppSpace.vertical.space16,
                const LoginWithWidget(),
                AppSpace.vertical.space30,
                const SocialLoginIcons(),
                AppSpace.vertical.space16,
                AuthSwitchText(
                  primaryText: AppStrings.noAccount,
                  secondaryText: AppStrings.signUp,
                  onSecondaryTap: () {
                    widget.navigateToPushWidget(context, const SignupView());
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
