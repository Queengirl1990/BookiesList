import 'package:flutter/material.dart';
import '../styles/theme.dart';

//Abtrennung
class MyDividerWithIcons extends StatelessWidget {
  const MyDividerWithIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          width: 320,
          child: Divider(
            color: CustomTheme.snowWhite,
            height: 20,
            thickness: 2,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite, size: 20, color: CustomTheme.snowWhite),
            SizedBox(width: 20),
            Icon(Icons.favorite, size: 20, color: CustomTheme.snowWhite),
            SizedBox(width: 20),
            Icon(Icons.favorite, size: 20, color: CustomTheme.snowWhite),
          ],
        ),
        SizedBox(
          width: 320,
          child: Divider(
            color: CustomTheme.snowWhite,
            height: 20,
            thickness: 2,
          ),
        ),
      ],
    );
  }
}
