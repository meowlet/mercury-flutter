import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mercury_flutter/core/widgets/social_login_buttons.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/primary_button.dart';
import '../widgets/auth_header.dart';
import '../widgets/auth_footer.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import 'signup_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  String? _validateEmailOrUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email/Username must not be empty';
    }
    // Chỉ validate không được empty, server sẽ lo phần validation logic
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password must not be empty';
    }
    return null;
  }

  Future<void> _handleSignIn() async {
    if (!_formKey.currentState!.validate()) return;

    // Đảm bảo widget vẫn mounted trước khi dispatch event
    if (!mounted) return;

    // Use BLoC to handle sign in
    context.read<AuthBloc>().add(
      SignInRequested(
        identifier: _emailController.text.trim(),
        password: _passwordController.text,
      ),
    );
  }

  void _navigateToSignUp() {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const SignUpPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position:
                Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(
                  CurvedAnimation(parent: animation, curve: Curves.easeInOut),
                ),
            child: child,
          );
        },
        transitionDuration: AppConstants.defaultAnimationDuration,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        // Kiểm tra mounted trước khi xử lý UI
        if (!mounted) return;

        if (state is AuthAuthenticated) {
          // Chỉ hiển thị success message và navigate khi thành công
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Welcome back ${state.authResult.user.username}!'),
              backgroundColor: colorScheme.primary,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.all(16),
              duration: const Duration(
                milliseconds: 1500,
              ), // Ngắn hơn để không conflict với navigation
            ),
          );
          // Navigation sẽ được handle bởi AuthWrapper
        } else if (state is AuthError) {
          // Chỉ hiển thị error message, không navigate
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: colorScheme.error,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.all(16),
                duration: const Duration(
                  seconds: 4,
                ), // Đủ thời gian để user đọc error
              ),
            );
          }
        }
      },
      child: Scaffold(
        backgroundColor: colorScheme.surface,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 60),
                  const AuthPageHeader(
                    title: 'Welcome back!',
                    subtitle: 'Sign in to continue with Mercury',
                  ),
                  const SizedBox(height: 48),
                  _buildSignInForm(),
                  const SizedBox(height: 32),
                  SocialSignInButtons(
                    onGooglePressed: () {
                      // Handle Google login
                    },
                    onFacebookPressed: () {
                      // Handle Facebook login
                    },
                  ),
                  const SizedBox(height: 40),
                  AuthFooter(
                    promptText: 'Don\'t have an account? ',
                    actionText: 'Sign up now',
                    onActionPressed: _navigateToSignUp,
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignInForm() {
    final colorScheme = Theme.of(context).colorScheme;

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomTextField(
            controller: _emailController,
            labelText: 'Email/Username',
            hintText: 'Enter your email or username',
            prefixIcon: Icons.person_outlined,
            keyboardType: TextInputType.text, // Đổi từ emailAddress sang text
            validator: _validateEmailOrUsername, // Đổi tên function
          ),
          const SizedBox(height: 20),

          CustomTextField(
            controller: _passwordController,
            labelText: 'Password',
            hintText: 'Enter your password',
            prefixIcon: Icons.lock_outlined,
            obscureText: _obscurePassword,
            suffixIcon: IconButton(
              icon: Icon(
                _obscurePassword ? Icons.visibility_off : Icons.visibility,
                color: colorScheme.onSurfaceVariant,
              ),
              onPressed: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
            ),
            validator: _validatePassword,
          ),

          const SizedBox(height: 16),

          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                // Handle forgot password
              },
              child: Text(
                'Forgot password?',
                style: TextStyle(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),

          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return PrimaryButton(
                text: 'Sign In',
                onPressed: _handleSignIn,
                isLoading: state is AuthLoading,
              );
            },
          ),
        ],
      ),
    );
  }
}
