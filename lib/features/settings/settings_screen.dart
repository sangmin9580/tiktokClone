import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _isSelected = false;

  void _onChanged(bool? newvalue) {
    if (newvalue == null) {
      return;
    } else {
      setState(
        () {
          _isSelected = newvalue;
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SwitchListTile.adaptive(
            title: const Text(
              "Enable notifications",
            ),
            subtitle: const Text(
              "they will be cute",
              style: TextStyle(
                color: Colors.black45,
              ),
            ),
            value: _isSelected,
            onChanged: _onChanged,
          ),
          CheckboxListTile.adaptive(
            title: const Text(
              "Marketing emails",
            ),
            subtitle: const Text(
              "we won't spam you.",
              style: TextStyle(
                color: Colors.black54,
              ),
            ),
            value: _isSelected,
            onChanged: (value) => _onChanged(value),
          ),
          ListTile(
            subtitle: const Text(
              "I need to Know!",
              style: TextStyle(
                color: Colors.black54,
              ),
            ),
            title: const Text("What is your Birthday?"),
            onTap: () async {
              await showDatePicker(
                context: context,
                initialDate: DateTime(2022),
                firstDate: DateTime(1990),
                lastDate: DateTime.now(),
              );

              if (!mounted) return;
              final time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              print(time);
              if (!mounted) return;
              final dateRange = await showDateRangePicker(
                context: context,
                firstDate: DateTime.now(),
                lastDate: DateTime(2025),
              );
              print(dateRange);
            },
          ),
          ListTile(
            title: const Text(
              "Log out(iOS)",
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            onTap: () => showCupertinoDialog(
              context: context,
              builder: (context) => CupertinoAlertDialog(
                title: const Text(
                  "title",
                ),
                content: const Text(
                  "content",
                ),
                actions: [
                  CupertinoDialogAction(
                    onPressed: () => Navigator.of(context).pop(),
                    isDefaultAction: true,
                    child: const Text("No"),
                  ),
                  CupertinoDialogAction(
                    onPressed: () => Navigator.of(context).pop(),
                    isDestructiveAction: true,
                    child: const Text("Yes"),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: const Text(
              "Log out(Android)",
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            onTap: () => showDialog(
              context: context,
              builder: (context) => CupertinoAlertDialog(
                title: const Text("Are you Sure?"),
                actions: [
                  CupertinoDialogAction(
                    onPressed: () => Navigator.of(context).pop(),
                    isDefaultAction: true,
                    child: const Text("no"),
                  ),
                  CupertinoDialogAction(
                    onPressed: () => Navigator.of(context).pop(),
                    isDestructiveAction: true,
                    child: const Text("yes"),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: const Text(
              "Log out (iOS / Bottom)",
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            onTap: () => showCupertinoModalPopup(
              context: context,
              builder: (context) => CupertinoActionSheet(
                title: const Text("Are you Sure?"),
                message: const Text(
                  "Please Don't go",
                ),
                actions: [
                  CupertinoActionSheetAction(
                    onPressed: () => Navigator.of(context).pop(),
                    isDefaultAction: true,
                    child: const Text("Nooooo!"),
                  ),
                  CupertinoActionSheetAction(
                    onPressed: () => Navigator.of(context).pop(),
                    isDestructiveAction: true,
                    child: const Text("Yes plz!"),
                  ),
                ],
              ),
            ),
          ),
          const AboutListTile(),
        ],
      ),
    );
  }
}
