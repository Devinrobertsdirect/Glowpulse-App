import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:health_device/src/config/app_constants.dart';
import 'package:health_device/src/shared/widgets/appButton.dart';
import 'package:health_device/src/shared/widgets/appbar.dart';
import 'package:health_device/src/shared/widgets/theme_card.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});
  static final path = '/reset-password';
  final Widget _verticalSpacer = SizedBox(height: 15.h);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(title: AppConstants.APP_NAME),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),

          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      boxShadowWidget()
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Reset your password",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        _verticalSpacer,
                        Text(
                          "Enter your email address and we'll send you instructions to reset your",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        _verticalSpacer,
                        Text(
                          "Email",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8.h),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText:
                              "Enter your email", // Only specify hint text, other styles come from theme
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),

                        _verticalSpacer,
                        _verticalSpacer,
                        AppButton(
                          title: 'Send reset instructions',
                          onTap: () {
                            // context.push(HomeScreen.path);
                          },
                        ),
                        _verticalSpacer,
                      ],
                    ),
                  ),
                ),
                _verticalSpacer,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: Text("Back to Sign in"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
