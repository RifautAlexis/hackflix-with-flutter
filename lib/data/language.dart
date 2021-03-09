import 'package:flutter/material.dart';

class Language {
  String? language;
  String? region;
  String? flagPath;
  String? label;
  Locale? locale;

  Language({required this.language, required this.region, required this.flagPath, required this.label, required this.locale});

  Language.initializer() {
    this.language = "en";
    this.region = "US";
    this.flagPath = "assets/flags/english.svg";
    this.label = "english";
    this.locale = Locale('en', 'US');
  }

  getLanguageCode() {
    return "${language}_$region";
  }

  static final List<Language> languages = [
    Language(
      language: "en",
      region: "US",
      flagPath: 'assets/flags/english.svg',
      label: "english",
      locale: Locale('en', 'US'),
    ),
    Language(
      language: "fr",
      region: "BE",
      flagPath: 'assets/flags/french.svg',
      label: "french",
      locale: Locale('fr', 'BE'),
    ),
  ];
}