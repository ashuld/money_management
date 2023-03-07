import 'package:flutter/material.dart';
import 'package:money_management/db/functions/colourfunctions/color.dart';
import 'package:money_management/widgets/settingsbackground.dart';

class ScreenSettings extends StatefulWidget {
  const ScreenSettings({super.key});

  @override
  State<ScreenSettings> createState() => _ScreenSettingsState();
}

class _ScreenSettingsState extends State<ScreenSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:secColor,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            settingsBackground(context),
            Positioned(
              top: 120,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color:  plain
                ),
                height: 550,
                width: 340,
                child: Column(
                  children: const [
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(
                        horizontal: 15
                      ),
                      child: ListTile(
                        leading: Icon(Icons.privacy_tip,
                        size: 30,
                        color: prColor
                        ),
                      ),
                    )
                  ],
                ),
              ),
              )
          ],
        )
        ),
    );
  }
}