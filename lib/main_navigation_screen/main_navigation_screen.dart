import 'package:cipher_decoder/encrypt_decrypt/decryption/decryption_view.dart';
import 'package:cipher_decoder/encrypt_decrypt/encryption/encryption_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../dashboard/dashboard.dart';
import '../utils/colors.dart';
import '../utils/string_constants.dart';
import 'main_navigation_screen_controller.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen>
    with TickerProviderStateMixin {

  MainNavigationScreenController navigationController = Get.put(MainNavigationScreenController());
  static const double _headerHeight = 130;

  @override
  void initState() {
    super.initState();

    navigationController
        .setTabController(TabController(length: 3, vsync: this));
    navigationController.tabController.addListener(() {
      if (!navigationController.tabController.indexIsChanging &&
          navigationController.selectedIndex.value !=
              navigationController.tabController.index) {
        navigationController
            .changeIndex(navigationController.tabController.index);
      }
    });
  }

  late List<Widget> pages = [
    _buildDashboardTab(),
    // _buildEncryptDecryptTab(),
    _buildEncryptTab(),
    _buildDecryptTab()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: terminalBlack,
      body: Container(
        color: terminalBlack,
        child: Obx(() {
          return Column(
            children: [
              // Enhanced Header with Glow
              AnimatedSize(
                duration: const Duration(milliseconds: 350),
                curve: Curves.easeInOut,
                child: SizedBox(
                  height: navigationController.selectedIndex.value == 0  ? _headerHeight : 0,
                  child: RepaintBoundary(child: _buildEnhancedHeader()),
                ),
              ),

              // Main Content Area
              Expanded(
                child: TabBarView(
                  controller: navigationController.tabController,
                  children: pages,
                ),
              ),
            ],
          );
        }),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildEnhancedHeader() {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: terminalWhite, width: 0.5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Main Title with Glow
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 15),
            decoration: BoxDecoration(
              color: terminalBlack,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: terminalWhite,
                width: 1,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x30FFFFFF),
                  blurRadius: 15,
                  spreadRadius: 1,
                )
              ],
            ),
            child: const Text(
              APPLICATION_NAME,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
                color: terminalWhite,
                fontFamily: 'monospace',
                letterSpacing: 4.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDashboardTab() {
    return const Dashboard();
  }

  // Widget _buildEncryptDecryptTab() {
  //   return const DashboardEncryptDecrypt();
  // }
  Widget _buildEncryptTab() {
    return EncryptionView();
  }
  Widget _buildDecryptTab() {
    return DecryptionView();
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: const BoxDecoration(
        color: terminalBlack,
        border: Border(
          top: BorderSide(
            color: terminalWhite,
            width: 1,
          ),
        ),
      ),
      child: SafeArea(
        child: Obx(() {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildNavItem(0, Icons.dashboard, 'DASHBOARD'),
                buildNavItem(1, Icons.lock, 'Encrypt'),
                buildNavItem(2, Icons.lock_open, 'Decrypt'),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget buildNavItem(int index, IconData icon, String label) {
    final isSelected = navigationController.selectedIndex.value == index;
    return GestureDetector(
      onTap: () {
        navigationController.changeIndex(index);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,

        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? terminalWhite : terminalBlack,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: terminalWhite,
            width: 1,
          ),
          boxShadow: isSelected ? [
            const BoxShadow(
              color: Color(0x50FFFFFF),
              blurRadius: 10,
              spreadRadius: 0,
            )
          ] : null,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? terminalBlack : terminalWhite,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: isSelected ? terminalBlack : terminalWhite,
                fontFamily: 'monospace',
                fontWeight: FontWeight.w900,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
