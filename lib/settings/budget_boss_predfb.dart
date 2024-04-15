// ignore_for_file: use_build_context_synchronously

import 'package:apphud/apphud.dart';
import 'package:budget_boss_143/core/bb_bar_down.dart';
import 'package:budget_boss_143/core/url_wb.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> getBudgetBossPredfb() async {
  final preferences = await SharedPreferences.getInstance();
  return preferences.getBool('vsdvseewewe') ?? false;
}

Future<void> setBudgetBossPredfb() async {
  final vdssdmnn = await SharedPreferences.getInstance();
  vdssdmnn.setBool('vsdvseewewe', true);
}

Future<void> restoreBudgetBossPredfb(BuildContext context) async {
  final vsdgri = await Apphud.hasPremiumAccess();
  final mfd = await Apphud.hasActiveSubscription();
  if (vsdgri || mfd) {
    final vdssdmnn = await SharedPreferences.getInstance();
    vdssdmnn.setBool("vsdvseewewe", true);
    showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Success!'),
        content: const Text('Your purchase has been restored!'),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const BbBarDown()),
                (route) => false,
              );
            },
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  } else {
    showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Restore purchase'),
        content: const Text(
            'Your purchase is not found. Write to support: ${UrlWb.spp}'),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () => {Navigator.of(context).pop()},
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }
}
