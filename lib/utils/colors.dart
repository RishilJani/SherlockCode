
// Terminal Theme - Pure Black & White high-contrast palette
import 'dart:ui';

import 'package:flutter/material.dart';

const Color terminalWhite = Color(0xFFFFFFFF);
const Color terminalLightGrey = Color(0xFFE0E0E0);
const Color terminalGrey = Color(0xFFB0B0B0);
const Color terminalMidGrey = Color(0xFF707070);
const Color terminalDarkGrey = Color(0xFF404040);
const Color terminalDarkerGrey = Color(0xFF202020);
const Color terminalElevated = Color(0xFF101010);
const Color terminalSurface = Color(0xFF000000); // Pure Black for surface
const Color terminalBackground = Color(0xFF000000); // Pure Black background
const Color terminalBlack = Color(0xFF000000);

// Functional colors
const Color terminalError = Color(0xFFFF3333);
const Color terminalSuccess = Color(0xFFFFFFFF);

// Glow effect variants
const Color terminalGlow = Color(0x30FFFFFF);
const List<BoxShadow> terminalHighContrastGlow = [
  BoxShadow(
    color: Color(0x20FFFFFF),
    blurRadius: 10,
    spreadRadius: 2,
  )
];

// Legacy aliases — kept for splash_screen.dart compatibility
const Color cyberpunkGreen = terminalWhite;
const Color cyberpunkCyan = terminalLightGrey;
const Color cyberpunkPurple = terminalMidGrey;
const Color cyberpunkRed = terminalError;
const Color cyberpunkDark = terminalBackground;
const Color cyberpunkDarkElevated = terminalSurface;
const Color cyberpunkLightElevated = Color(0x30202020);

const Color cyberpunkGreenLight = terminalLightGrey;
const Color cyberpunkGreenDark = terminalGrey;
const Color cyberpunkCyanLight = terminalLightGrey;
const Color cyberpunkCyanDark = terminalDarkGrey;
const Color cyberpunkPurpleLight = terminalGrey;
const Color cyberpunkPurpleDark = terminalDarkGrey;
const Color cyberpunkLightRed = terminalError;
const Color cyberpunkRedLight = terminalError;
const Color cyberpunkRedDark = Color(0xFFCC0000);

const Color cyberpunkWhite = terminalWhite;
const Color cyberpunkGrayLight = terminalLightGrey;
const Color cyberpunkGray = terminalGrey;
const Color cyberpunkGrayDark = terminalDarkGrey;
const Color cyberpunkBlack = terminalBlack;

// Monochrome gradients
const List<Color> cyberpunkGreenGradient = [terminalWhite, terminalLightGrey];
const List<Color> cyberpunkPurpleGradient = [terminalGrey, terminalMidGrey];
const List<Color> cyberpunkCyanGradient = [terminalLightGrey, terminalWhite];
const List<Color> cyberpunkRedGradient = [terminalError, terminalDarkGrey];

const List<Color> cyberpunkBackgroundGradient = [terminalBlack, terminalBlack];
const List<Color> cyberpunkSurfaceGradient = [terminalBlack, terminalBlack];

var c = const Color(0xFFFFFFFF);