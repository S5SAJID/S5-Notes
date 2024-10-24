import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.inversePrimary,
        leading: Icon(Icons.play_circle_rounded, color: theme.primaryIconTheme.color?.withOpacity(0),),
      ),
      body: Center(
        child: Opacity(
          opacity: .5,
          child: Image.asset('assets/icons/no-bg-icon.png')
        ),
      ),
    );
  }
}