import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:health_device/src/application/providers/user_type.dart';
import 'package:health_device/src/config/app_constants.dart';
import 'package:health_device/src/config/enum/user_types.dart';
import 'package:health_device/src/features/auth/presentation/signup.dart';
import 'package:health_device/src/features/auth/provider/auth_provider.dart';
import 'package:health_device/src/features/reset_password/presentation/reset_password.dart';
import 'package:health_device/src/features/tabs/tabs.dart';
import 'package:health_device/src/shared/widgets/appButton.dart';
import 'package:health_device/src/shared/widgets/appbar.dart';
import 'package:health_device/src/shared/widgets/theme_card.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginScreen extends HookConsumerWidget {
  static final path = '/login';
  LoginScreen({super.key});

  final Widget _verticalSpacer = SizedBox(height: 15.h);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userType = ref.read(userTypeNotifierProvider.notifier);

    // Controllers for email and password
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    // Form key to validate the form
    final _formKey = GlobalKey<FormState>();

    // Hook for managing the loading state of the button
    final _isLoading = useState(false);

    return Scaffold(
      appBar: GradientAppBar(title: AppConstants.APP_NAME),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [boxShadowWidget()],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Form(
                          key: _formKey,  // Attach form key
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Welcome back, sign into your account",
                                style: Theme.of(context).textTheme.headlineMedium,
                              ),
                              _verticalSpacer,

                              Text(
                                "Email",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 8.h),
                                child: TextFormField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    hintText: "Enter your email",
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter an email';
                                    }
                                    final emailRegex = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
                                    if (!emailRegex.hasMatch(value)) {
                                      return 'Please enter a valid email';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              _verticalSpacer,

                              Text(
                                "Password",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 8.h),
                                child: TextFormField(
                                  controller: passwordController,
                                  decoration: InputDecoration(
                                    hintText: "Enter your password",
                                  ),
                                  obscureText: true,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a password';
                                    }
                                    if (value.length < 6) {
                                      return 'Password must be at least 6 characters';
                                    }
                                    return null;
                                  },
                                ),
                              ),

                              _verticalSpacer,
                              Text(
                                "Just a heads-up: you'll need an existing Glowpulse account to use the app.",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              _verticalSpacer,
                              _verticalSpacer,

                              AppButton(
                                title:  'Sign in',
                                  isLoading: _isLoading.value,
                                onTap: () async {
                                  if (_formKey.currentState?.validate() ?? false) {
                                    _isLoading.value = true;  // Start loading

                                    try {
                                      // Call the login function
                                      await ref.read(authProviderProvider.notifier).login(
                                        emailController.text,
                                        passwordController.text,
                                      );

                                    context.pushReplacement(TabsScreen.path);

                                    } catch (e) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text("Login failed: ${e.toString()}")),
                                      );
                                    } finally {
                                      _isLoading.value = false;  // Stop loading
                                    }
                                  }
                                },
                              ),
                              _verticalSpacer,
                            ],
                          ),
                        ),
                      ),
                    ),
                    _verticalSpacer,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Forgot your password?",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        TextButton(
                          onPressed: () {
                            context.push(ResetPasswordScreen.path);
                          },
                          child: Text("Reset it"),
                        ),
                      ],
                    ),
                    _verticalSpacer,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account yet?",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        TextButton(
                          onPressed: () {
                            context.push(SignupScreen.path);
                          },
                          child: Text("Sign up"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
