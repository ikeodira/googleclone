import 'package:flutter/material.dart';
import 'package:googlecloneflutter/widgets/web/language_text.dart';

class TranslationButtons extends StatelessWidget {
  const TranslationButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      alignment: WrapAlignment.center,
      children: [
        Text("Google Offered in:"),
        SizedBox(width: 5),
        LanguageText(title: "Igbo"),
        SizedBox(width: 5),
        LanguageText(title: "Hausa"),
        SizedBox(width: 5),
        LanguageText(title: "Yoruba"),
      ],
    );
  }
}
