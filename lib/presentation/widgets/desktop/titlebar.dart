import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:s5_notes/presentation/widgets/desktop/window_btns.dart';
import 'package:s5_notes/utils/app_config.dart';

class TitleBar extends StatelessWidget {
  final String title;
  final Widget logo;

  const TitleBar({
    super.key,
    this.title = AppConfig.name,
    required this.logo 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.inversePrimary,
      child: Row(
        children: [
          SizedBox(
              height: 20,
              child: WindowTitleBarBox(
                child: MoveWindow(child: Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                    logo,
                    const SizedBox(width: 5),
                    Text(title)
                  ],),
                )),
              )),
          Expanded(
            child: WindowTitleBarBox(
              child: Row(
                children: [Expanded(child: MoveWindow()), const WindowButtons()],
              ),
            ),
          )
        ],
      ),
    );
  }
}