import 'package:flutter/material.dart';
import 'package:newportfoliodynamic/currently_learning_section.dart';
import 'package:newportfoliodynamic/strip_section_2.dart';
import 'package:provider/provider.dart';
// import 'hero_section.dart';
// import 'about_section.dart';
import 'hero_about_section.dart';
import 'strip_section_1.dart';
import 'profile_overview_section.dart';
import 'technologies_section.dart';
import 'github_stats_section.dart';
import 'projects_section.dart';
import 'education_section.dart';
import 'experiences_section.dart';
import 'footer_section.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Add your providers here
        Provider<String>.value(
          value: 'placeholder',
        ), // temporary dummy provider
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Personalfolio',
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFF081B28),
          fontFamily: 'Inter',
          textTheme: const TextTheme(
            displayLarge: TextStyle(
              fontFamily: 'Ravenna Serial ExtraBold',
              fontWeight: FontWeight.w900,
              fontSize: 55,
              color: Color(0xFFE5E7E7),
            ),
            displayMedium: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              fontSize: 55,
              color: Color(0xFFE5E7E7),
            ),
            headlineMedium: TextStyle(
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w800,
              fontSize: 36,
              color: Colors.white,
            ),
            bodyLarge: TextStyle(
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Colors.white,
            ),
            bodyMedium: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              fontSize: 12.9,
              color: Colors.white,
            ),
          ),
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color(0xFFC6FCA6),
            secondary: const Color(0xFFA7FCEE),
            background: const Color(0xFF081B28),
            surface: Colors.white,
            onPrimary: Colors.black,
            onSecondary: Colors.black,
            onBackground: Colors.white,
            onSurface: Colors.black,
          ),
        ),
        home: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Implement Figma sections as widgets here
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeroAboutSection(),
            StripSection1(),
            ProfileOverviewSection(),
            GithubStatsSection(),
            TechnologiesSection(),
            StripSection2(),
            CurrentlyLearningSection(),
            StripSection1(),
            ProjectsSection(),
            StripSection2(),
            EducationSection(),
            ExperiencesSection(),
            FooterSection(),
            // Add next sections here
          ],
        ),
      ),
    );
  }
}
