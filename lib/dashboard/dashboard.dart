import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../main_navigation_screen/main_navigation_screen_controller.dart';
import '../utils/colors.dart';
import '../utils/string_constants.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;
  var navigationController = Get.find<MainNavigationScreenController>();

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_fadeController);
    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: terminalBlack,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(24.0),
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Column(
            children: [
              _buildWelcomeSection(),
              const SizedBox(height: 32),
              _buildActionCard(
                icon: Icons.lock_outline,
                title: "ENCRYPT / DECRYPT",
                description: "SECURE ACCESS TO CRYPTOGRAPHIC PROTOCOLS.",
                subtitle: "ALGORITHMS ACTIVE",
                onTap: () {
                  navigationController.changeIndex(1);
                },
              ),
              const SizedBox(height: 24),
              _buildFooter(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWelcomeSection() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: terminalBlack,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: terminalWhite, width: 1),
      ),
      child: Column(
        children: [
          const Icon(Icons.security, size: 64, color: terminalWhite),
          const SizedBox(height: 24),
          const Text(
            'ENCRYPTION TERMINAL',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w900,
              color: terminalWhite,
              fontFamily: 'monospace',
              letterSpacing: 2,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          const Text(
            'SYSTEM READY. AWAITING INPUT.',
            style: TextStyle(
              fontSize: 14,
              color: terminalGrey,
              fontFamily: 'monospace',
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildActionCard({
    required IconData icon,
    required String title,
    required String description,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: terminalBlack,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: terminalWhite, width: 1),
          boxShadow: const [
            BoxShadow(
              color: Color(0x20FFFFFF),
              blurRadius: 10,
              spreadRadius: 1,
            )
          ],
        ),
        child: Column(
          children: [
            Icon(icon, size: 48, color: terminalWhite),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: terminalWhite,
                fontFamily: 'monospace',
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: terminalWhite,
                borderRadius: BorderRadius.circular(2),
              ),
              child: Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 10,
                  color: terminalBlack,
                  fontFamily: 'monospace',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              description,
              style: const TextStyle(
                fontSize: 12,
                color: terminalWhite,
                fontFamily: 'monospace',
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: terminalWhite, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildTerminalButton(Icons.feedback, "FEEDBACK", RT_FEEDBACK_SCREEN),
          _buildTerminalButton(Icons.person, "ABOUT", RT_ABOUT_US_SCREEN),
        ],
      ),
    );
  }

  Widget _buildTerminalButton(IconData icon, String label, String route) {
    return InkWell(
      onTap: () => Get.toNamed(route),
      child: Column(
        children: [
          Icon(icon, color: terminalWhite, size: 24),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 10,
              color: terminalWhite,
              fontFamily: 'monospace',
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}
