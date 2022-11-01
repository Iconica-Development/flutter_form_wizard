// SPDX-FileCopyrightText: 2022 Iconica
//
// SPDX-License-Identifier: BSD-3-Clause

import 'package:flutter/material.dart';

class ThanksPage extends StatelessWidget {
  const ThanksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Thanks for filling in the form!",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () => Navigator.of(context).pushNamed('/'),
                child: const Text("Next"))
          ],
        ),
      ),
    );
  }
}
