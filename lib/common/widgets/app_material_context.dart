import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:new_task/setup.dart';
import '../../feature/settings/inherited_local_notifier.dart';
import '../../feature/settings/inherited_theme_notifier.dart';
import '../../feature/settings/local_controller.dart';
import '../../feature/settings/theme_controller.dart';
import '../local/app_storage.dart';
import '../localization/app_localization.dart';
import '../router/app_router.dart';
import '../router/route_name.dart';

class AppMaterialContext extends StatefulWidget {
  const AppMaterialContext({super.key});

  @override
  State<AppMaterialContext> createState() => _AppMaterialContextState();
}

class _AppMaterialContextState extends State<AppMaterialContext> {
  final router = const AppRouter();
  final themeController = ThemeController();

  @override
  Widget build(BuildContext context) => InheritedThemeNotifier(
        themeController: themeController,
        child: InheritedLocalNotifier(
          localController: localController,
          child: Builder(
            builder: (context) {
              return CupertinoApp(
                debugShowCheckedModeBanner: false,
                title: 'Qunduzbobo',
                locale: InheritedLocalNotifier.maybeOf(context)?.appLocal ?? const Locale('ru', 'RU'),
                supportedLocales: const [Locale('uz', 'UZ'), Locale('en', 'EN'), Locale('ru', 'RU')],
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                localeResolutionCallback: (final deviceLocale, final supportedLocales) {
                  final local = InheritedLocalNotifier.maybeOf(context, listen: false)!;

                  for (final locale in supportedLocales) {
                    if (locale.languageCode == local.appLocal.languageCode) {
                      return local.appLocal;
                    }
                  }
                  for (final locale in supportedLocales) {
                    if (deviceLocale == locale) {
                      return deviceLocale;
                    }
                  }

                  local.changeLocal(LangCodes.uz);

                  return local.appLocal;
                },
                initialRoute: token.isEmpty? AppRouteName.LOGIN_PAGE:AppRouteName.HOME_PAGE,
                onGenerateRoute: router.onGenerateRoute,
                builder: (context, child) => MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                  child: ScrollConfiguration(behavior: const ScrollBehavior(), child: child ?? const Scaffold()),
                ),
              );
            },
          ),
        ),
      );
}
