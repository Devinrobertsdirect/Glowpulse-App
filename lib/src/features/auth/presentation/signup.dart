
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:health_device/src/application/providers/user_type.dart';
import 'package:health_device/src/config/app_constants.dart';
import 'package:health_device/src/config/router.dart';
import 'package:health_device/src/features/auth/provider/auth_provider.dart';
import 'package:health_device/src/shared/widgets/appButton.dart';
import 'package:health_device/src/shared/widgets/appbar.dart';
import 'package:health_device/src/shared/widgets/theme_card.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
//
// class SignupScreen extends ConsumerStatefulWidget {
//
//
//   const SignupScreen({super.key});
//
//   @override
//   ConsumerState<SignupScreen> createState() => _SignupScreenState();
// }

class SignupScreen extends HookConsumerWidget {
   SignupScreen({super.key});
  static final path = '/signup';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _formKey = GlobalKey<FormState>();

    // Controllers for text fields
    final TextEditingController _fullNameController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _confirmPasswordController =
    TextEditingController();
    final _isLoading = useState(false);



    Future<void> _signup() async {
      if (!_formKey.currentState!.validate()) return;

      // final authService = ref.read(authServiceProvider); // Get AuthService
      final userType = ref.read(userTypeNotifierProvider.notifier);

      _isLoading.value = true;

      try {
        await ref
            .read(authProviderProvider.notifier)
            .signup(
          _emailController.text,
          _emailController.text,
          _passwordController.text,
          _fullNameController.text,
        );



          ScaffoldMessenger.of(
              navigatorKey.currentState!.context
          ).showSnackBar(SnackBar(
              duration: Duration(seconds: 6)
              ,content: Text("Signup successful, Please wait for account activation by an admin.")));
          context.pop();
          // context.pushReplacement(TabsScreen.path);


        // context.pushReplacement(TabsScreen.path); // Navigate to main screen
      } catch (e) {

        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Signup failed: ${e.toString()}")));
      } finally {
        _isLoading.value = false;
      }
    }
    // Widget for labels
    Widget _buildLabel(String text) {
      return Padding(
        padding: EdgeInsets.only(bottom: 8.h, top: 12.h),
        child: Text(text, style: Theme.of(context).textTheme.bodyMedium),
      );
    }

    // Widget for text fields
    Widget _buildTextField(
        TextEditingController controller,
        String hintText, {
          bool isPassword = false,
          TextInputType keyboardType = TextInputType.text,
        }) {
      return TextFormField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: keyboardType,
        decoration: InputDecoration(hintText: hintText),
        validator: (value) {
          if (value == null || value.isEmpty) return "This field is required";
          if (isPassword && value.length < 6)
            return "Password must be at least 6 characters";
          if (controller == _confirmPasswordController &&
              value != _passwordController.text) {
            return "Passwords do not match";
          }
          return null;
        },
      );
    }
    useEffect(() {
      return () {
        _fullNameController.dispose();
        _emailController.dispose();
        _passwordController.dispose();
        _confirmPasswordController.dispose();
      };
    }, []);
    return Scaffold(
      appBar: GradientAppBar(title: AppConstants.APP_NAME),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Create your ${AppConstants.APP_NAME} account",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        SizedBox(height: 15.h),

                        // Full Name
                        _buildLabel("Full Name"),
                        _buildTextField(
                          _fullNameController,
                          "Enter your full name",
                        ),

                        // Email
                        _buildLabel("Email"),
                        _buildTextField(
                          _emailController,
                          "Enter your email",
                          keyboardType: TextInputType.emailAddress,
                        ),

                        // Password
                        _buildLabel("Password"),
                        _buildTextField(
                          _passwordController,
                          "Enter your password",
                          isPassword: true,
                        ),

                        // Confirm Password
                        _buildLabel("Confirm Password"),
                        _buildTextField(
                          _confirmPasswordController,
                          "Confirm your password",
                          isPassword: true,
                        ),

                        SizedBox(height: 15.h),

                        Text(
                          "By creating an account, you agree to Glowpulse's Terms of Service and Privacy Policy.",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),

                        SizedBox(height: 30.h),


                            AppButton(
                              title: 'Create Account',
                              onTap: _signup,
                              isLoading: _isLoading.value,
                            ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 15.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    TextButton(
                      onPressed: () => context.pop(),
                      child: Text("Login"),
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
