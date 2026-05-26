import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/colors.dart';
import '../utils/common_functions.dart';
import '../utils/string_constants.dart';

class NewAboutUs extends StatelessWidget {
  const NewAboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: terminalBlack,
      appBar: buildEnhancedAppBar(
        title: "ABOUT_US",
        content: "ASWDC_CORE_SYSTEM_INFO"
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: terminalWhite, width: 2),
                ),
                child: ClipOval(
                  child: ColorFiltered(
                    colorFilter: const ColorFilter.matrix([
                      0.2126, 0.7152, 0.0722, 0, 0,
                      0.2126, 0.7152, 0.0722, 0, 0,
                      0.2126, 0.7152, 0.0722, 0, 0,
                      0,      0,      0,      1, 0,
                    ]), // Grayscale logo
                    child: Image.asset(APP_LOGO_PATH, height: 100),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const _AboutCard(
              text: "SYSTEM_ROSTER",
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  children: [
                    _AboutCardRow(text: "RISHIL JANI", tittleText: "DEVELOPER"),
                    _AboutCardRow(text: "PROF MEHUL BHUNDIYA", tittleText: "MENTOR"),
                    _AboutCardRow(text: "ASWDC", tittleText: "PROTOCOL"),
                    _AboutCardRow(text: "DARSHAN UNIVERSITY", tittleText: "STATION"),
                  ],
                ),
              ),
            ),
            _AboutCard(
              text: "SYSTEM_LOGS",
              child: infoCard(),
            ),
            _AboutCard(
              text: "COMMS_CHANNEL",
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    _CardRow(icon: Icons.mail, text: "aswdc@darshan.ac.in", onTap: () => _launchURL("mailto:aswdc@darshan.ac.in")),
                    _CardRow(icon: Icons.phone, text: "+91-97277 47317", onTap: () => _launchURL("tel:+919727747317")),
                    _CardRow(icon: Icons.web, text: "darshan.ac.in", onTap: () => _launchURL("https://darshan.ac.in")),
                  ],
                ),
              ),
            ),
            _AboutCard(
              text: "UTILITIES",
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    _CardRow(icon: Icons.share, text: "SHARE_STATION", onTap: () => SharePlus.instance.share(ShareParams(text: "$SHARE_APP_MESSAGE \n$DU_URL"))),
                    _CardRow(icon: Icons.apps, text: "MORE_TERMINALS", onTap: () => _launchURL("https://play.google.com/store/apps/developer?id=Darshan+University")),
                    _CardRow(icon: Icons.star, text: "RATE_PROTOCOL", onTap: () => _launchURL(ANDROID_APP_URL)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            const Column(
              children: [
                Text("DARSHAN_UNIVERSITY_SYSTEMS_2024", style: TextStyle(color: terminalGrey, fontSize: 10)),
                SizedBox(height: 8),
                Text("MADE_WITH_PRECISION_IN_INDIA", style: TextStyle(color: terminalGrey, fontSize: 10)),
              ],
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) throw 'Could not launch $url';
  }
}

Widget infoCard() {
  return const Padding(
    padding: EdgeInsets.all(16),
    child: Text(
      "ASWDC IS THE ARCHITECTURAL CORE FOR SOFTWARE DEVELOPMENT @ DARSHAN UNIVERSITY. OUR PROTOCOLS ENSURE THE HIGHEST STANDARDS OF CRYPTOGRAPHIC EXCELLENCE AND SYSTEM INTEGRITY.",
      style: TextStyle(fontSize: 12.0, color: terminalWhite, fontFamily: 'monospace', height: 1.6),
      textAlign: TextAlign.justify,
    ),
  );
}

class _AboutCard extends StatelessWidget {
  const _AboutCard({required this.text, required this.child});
  final String text;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: const BoxDecoration(
              color: terminalWhite,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(4), topRight: Radius.circular(4)),
            ),
            child: Text(text, style: const TextStyle(color: terminalBlack, fontSize: 11, fontWeight: FontWeight.w900, letterSpacing: 1.5)),
          ),
          Container(
            decoration: BoxDecoration(
              color: terminalBlack,
              border: Border.all(color: terminalWhite, width: 1),
              borderRadius: const BorderRadius.only(topRight: Radius.circular(4), bottomLeft: Radius.circular(4), bottomRight: Radius.circular(4)),
            ),
            child: child,
          )
        ],
      ),
    );
  }
}

class _AboutCardRow extends StatelessWidget {
  const _AboutCardRow({required this.text, required this.tittleText});
  final String text;
  final String tittleText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 90, child: Text(tittleText, style: const TextStyle(color: terminalGrey, fontSize: 11, fontWeight: FontWeight.bold))),
          const Text(" :: ", style: TextStyle(color: terminalWhite)),
          Flexible(child: Text(text, style: const TextStyle(color: terminalWhite, fontSize: 11, fontWeight: FontWeight.w900))),
        ],
      ),
    );
  }
}

class _CardRow extends StatelessWidget {
  const _CardRow({required this.icon, required this.text, required this.onTap});
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            Icon(icon, size: 16, color: terminalWhite),
            const SizedBox(width: 12),
            Text(text.toUpperCase(), style: const TextStyle(fontSize: 12, color: terminalWhite, fontWeight: FontWeight.w400)),
          ],
        ),
      ),
    );
  }
}
