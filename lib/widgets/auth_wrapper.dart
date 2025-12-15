import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/pending_approval_screen.dart';
import '../main.dart' show HomeShell;

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        // Show loading while checking auth state
        if (authProvider.isLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // Not authenticated -> Login
        if (!authProvider.isAuthenticated) {
          return const LoginScreen();
        }

        // Authenticated but not approved -> Pending Approval
        if (!authProvider.isApproved) {
          return const PendingApprovalScreen();
        }

        // Authenticated and approved -> Main App
        return const HomeShell();
      },
    );
  }
}
