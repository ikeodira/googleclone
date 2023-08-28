import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  final String title;
  // VoidCallback onTap;
  const SearchButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      // elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 18),
      child: Text(title),
      onPressed: () {},
    );
  }
}
