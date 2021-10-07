import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:codeit/data/languages.dart' as data_languages;
import 'package:codeit/data/themes.dart' as data_themes;

import 'package:codeit/pages/loading_page.dart';

import 'package:codeit/providers/dark_theme_provider.dart';
import 'package:codeit/providers/light_theme_provider.dart';
import 'package:codeit/providers/locale_provider.dart';
import 'package:codeit/providers/theme_mode_provider.dart';

import 'package:codeit/routes/custom_router.dart';

import 'package:codeit/utilities/app_localizations.dart';
import 'package:codeit/utilities/size_config.dart';

void main() {
  // ! SharedPreferences doesn't work without this
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences.getInstance().then(
    (SharedPreferences prefs) {
      var themeMode = prefs.getInt('themeMode') ?? 0;
      var lightTheme = prefs.getInt('lightTheme') ?? 0;
      var darkTheme = prefs.getInt('darkTheme') ?? 0;
      var localeName = prefs.getString('localeName');

      runApp(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<ThemeModeProvider>(
              create: (_) => ThemeModeProvider(
                themeMode: data_themes.themeModes[themeMode].themeMode,
              ),
            ),
            ChangeNotifierProvider<LightThemeProvider>(
              create: (_) => LightThemeProvider(
                themeData: data_themes.lightThemes[lightTheme].themeData,
              ),
            ),
            ChangeNotifierProvider<DarkThemeProvider>(
              create: (_) => DarkThemeProvider(
                themeData: data_themes.darkThemes[darkTheme].themeData,
              ),
            ),
            ChangeNotifierProvider<LocaleProvider>(
              create: (_) => LocaleProvider(
                locale: localeName == null
                    ? null
                    : Locale(
                        localeName.split('_')[0],
                        localeName.split('_')[1],
                      ),
              ),
            ),
          ],
          child: const CodeITApp(),
        ),
      );
    },
  );
}

class CodeITApp extends StatelessWidget {
  const CodeITApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeMode _themeMode = Provider.of<ThemeModeProvider>(
      context,
    ).themeMode;

    /**
     * Update status bar brightness
     * (Based on the theme mode)
     */
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarBrightness: _themeMode.index == 0
            ? WidgetsBinding.instance?.window.platformBrightness
            : _themeMode.index == 1
                ? Brightness.light
                : Brightness.dark,
      ),
    );

    /**
     * Update status bar brightness
     * (If the user changed theme mode and the theme mode is 'system')
     * ! This is invoked whenever [platformBrightness] changed value
     */
    WidgetsBinding.instance?.window.onPlatformBrightnessChanged = () {
      if (_themeMode.index == 0) {
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(
            statusBarBrightness:
                WidgetsBinding.instance?.window.platformBrightness,
          ),
        );
      }
    };

    return LayoutBuilder(
      builder: (
        _,
        constraints,
      ) {
        return OrientationBuilder(builder: (
          _,
          orientation,
        ) {
          // Init SizeConfig
          SizeConfig().init(
            constraints: constraints,
            orientation: orientation,
          );

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Code IT',
            theme: Provider.of<LightThemeProvider>(
              context,
            ).themeData,
            darkTheme: Provider.of<DarkThemeProvider>(
              context,
            ).themeData,
            themeMode: _themeMode,
            locale: Provider.of<LocaleProvider>(
              context,
            ).locale,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: data_languages.languages.map(
              (language) => language.locale,
            ),
            localeResolutionCallback: (deviceLocale, supportedLocales) {
              LocaleProvider localeProvider = Provider.of<LocaleProvider>(
                context,
                listen: false,
              );

              // Check if the user doesn't have a preferred locale
              if (localeProvider.locale == null) {
                // For each supported locale
                for (var supportedLocale in supportedLocales) {
                  // Check if the device's language code or country code is supported
                  if (supportedLocale.languageCode ==
                          deviceLocale?.languageCode ||
                      supportedLocale.countryCode ==
                          deviceLocale?.countryCode) {
                    // Use (supported) locale
                    localeProvider.initLocale(
                      locale: supportedLocale,
                    );
                    return supportedLocale;
                  }
                }

                // When this is reached, it means that the device's language code or country code is not supported
                // Use English (last supported locale)
                localeProvider.initLocale(
                  locale: supportedLocales.last,
                );
                return supportedLocales.last;
              }
            },
            onGenerateRoute: CustomRouter.allRoutes,
            // ignore: prefer_const_constructors
            home: LoadingPage(),
          );
        });
      },
    );
  }
}
