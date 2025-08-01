import 'package:flutter/material.dart';
import '../../model/project_model.dart';

Map<String, int> getMostUsedLanguages(List<ProjectModel> projects) {
  final Map<String, int> languageCount = {};

  for (var project in projects) {
    for (var languageWidget in project.language ?? []) {
      if (languageWidget is Image) {
        final String? assetPath = languageWidget.image is AssetImage
            ? (languageWidget.image as AssetImage).assetName
            : null;

        if (assetPath != null) {
          languageCount.update(
            assetPath,
            (value) => value + 1,
            ifAbsent: () => 1,
          );
        }
      }
    }
  }

  final sorted = Map.fromEntries(
    languageCount.entries.toList()..sort((a, b) => b.value.compareTo(a.value)),
  );

  return sorted;
}
