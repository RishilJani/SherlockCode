import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/common_functions.dart';
import 'decryption/decryption_view.dart';
import 'encryption/encryption_view.dart';
import 'package:get/get.dart';
import 'encryption_decryption/encryption_decryption_options_controller.dart';

class DashboardEncryptDecrypt extends StatefulWidget {
  const DashboardEncryptDecrypt({super.key});

  @override
  State<DashboardEncryptDecrypt> createState() => _DashboardEncryptDecryptState();
}

class _DashboardEncryptDecryptState extends State<DashboardEncryptDecrypt>
    with TickerProviderStateMixin {
  late TabController _tabController;

  final EncryptionDecryptionOptionsController edOptionsController = Get.put(EncryptionDecryptionOptionsController());

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: terminalBlack,
        appBar: buildEnhancedAppBar(
          title: 'CRYPTOGRAPHY',
          content: 'TERMINAL_PROTOCOLS',
          bottom: _buildEnhancedTabBar()
        ),
        body: Container(
          decoration: const BoxDecoration(
            color: terminalBlack,
            border: Border(top: BorderSide(color: terminalWhite, width: 0.5)),
          ),
          child: TabBarView(
            controller: _tabController,
            children: [
              EncryptionView(),
              DecryptionView(),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildEnhancedTabBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(70),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: terminalBlack,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: terminalWhite,
            width: 1,
          ),
        ),
        child: TabBar(
          controller: _tabController,
          indicator: BoxDecoration(
            color: terminalWhite,
            borderRadius: BorderRadius.circular(2),
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: terminalBlack,
          unselectedLabelColor: terminalWhite,
          labelStyle: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w900,
            fontFamily: 'monospace',
            letterSpacing: 2.0,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            fontFamily: 'monospace',
            letterSpacing: 2.0,
          ),
          tabs: const [
            Tab(text: "ENCRYPT"),
            Tab(text: "DECRYPT"),
          ],
        ),
      ),
    );
  }
}
