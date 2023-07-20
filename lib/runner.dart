import 'dart:async';
import 'package:flutter/services.dart';
import 'package:l/l.dart';
import 'package:new_task/setup.dart';

import 'feature/app.dart';

void run() => l.capture<void>(
      () => runZonedGuarded<void>(
        () async {
          await setup();

          await SystemChrome.setPreferredOrientations(
            [DeviceOrientation.portraitUp],
          ).then(
            (_) => App.run(),
          );
        },
        (final error, final stackTrace) {
          l.e(
            'io_top_level_error: ${error.toString()}\n $stackTrace',
            stackTrace,
          );
        },
      ),
      const LogOptions(
        printColors: true,
        handlePrint: true,
        outputInRelease: true,
      ),
    );
