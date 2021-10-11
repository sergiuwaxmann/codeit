import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:codeit/data/themes.dart' as data_themes;

import 'package:codeit/providers/dark_theme_provider.dart';
import 'package:codeit/providers/light_theme_provider.dart';
import 'package:codeit/providers/theme_mode_provider.dart';

import 'package:codeit/static/variables.dart' as variables;

import 'package:codeit/widgets/custom_safe_area.dart';
import 'package:codeit/widgets/custom_size_container.dart';
import 'package:codeit/widgets/page_header.dart';
import 'package:codeit/widgets/selection_item.dart';

class AppearancePage extends StatefulWidget {
  const AppearancePage({
    Key? key,
  }) : super(key: key);

  @override
  _AppearancePageState createState() => _AppearancePageState();
}

class _AppearancePageState extends State<AppearancePage> {
  late Size _headerSize;

  @override
  void initState() {
    _headerSize = Size.zero;

    super.initState();
  }

  Column _getSelectionRow({
    required String titleKey,
    required Column contentColumn,
  }) {
    double smallMarginPadding = variables.smallMarginPadding();

    String translate({
      required String key,
    }) =>
        variables.translate(
          context,
          key,
        )!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          translate(
            key: titleKey,
          ),
          style: Theme.of(context).textTheme.headline1!.copyWith(
                fontSize: variables.headline3FontSize(),
              ),
        ),
        SizedBox(
          height: smallMarginPadding,
        ),
        Container(
          padding: EdgeInsets.all(
            smallMarginPadding,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).highlightColor,
            borderRadius: BorderRadius.circular(
              variables.defaultBorderRadius,
            ),
            boxShadow: [
              Theme.of(context).brightness == Brightness.light
                  ? variables.defaultBoxShadow
                  : const BoxShadow(),
            ],
          ),
          child: contentColumn,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double _defaultMarginPadding = variables.defaultMarginPadding();

    String _translate({
      required String key,
    }) =>
        variables.translate(
          context,
          key,
        )!;

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(
              top: _headerSize.height,
            ),
            child: CustomSafeArea(
              top: false,
              padding: variables.defaultMarginPadding(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _getSelectionRow(
                    titleKey: 'select_theme_mode',
                    contentColumn: Column(
                      children: [
                        for (var customThemeMode in data_themes.themeModes)
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: customThemeMode.themeMode.index !=
                                      data_themes.themeModes.length - 1
                                  ? variables.smallMarginPadding()
                                  : 0,
                            ),
                            child: SelectionItem(
                              title: _translate(
                                key: customThemeMode.titleKey,
                              ),
                              isActive: customThemeMode.themeMode ==
                                  Provider.of<ThemeModeProvider>(
                                    context,
                                  ).themeMode,
                              onTap: () async {
                                ThemeModeProvider themeModeProvider =
                                    Provider.of<ThemeModeProvider>(
                                  context,
                                  listen: false,
                                );
                                if (customThemeMode.themeMode !=
                                    themeModeProvider.themeMode) {
                                  themeModeProvider.setThemeMode(
                                    themeMode: customThemeMode.themeMode,
                                  );
                                  var prefs =
                                      await SharedPreferences.getInstance();
                                  prefs.setInt(
                                    'theme_mode',
                                    customThemeMode.themeMode.index,
                                  );
                                }
                              },
                            ),
                          )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: _defaultMarginPadding,
                  ),
                  _getSelectionRow(
                    titleKey: 'select_light_theme',
                    contentColumn: Column(
                      children: [
                        for (var lightTheme in data_themes.lightThemes)
                          Padding(
                            padding: EdgeInsets.only(
                              bottom:
                                  data_themes.lightThemes.indexOf(lightTheme) !=
                                          data_themes.lightThemes.length - 1
                                      ? variables.smallMarginPadding()
                                      : 0,
                            ),
                            child: SelectionItem(
                              title: _translate(
                                key: lightTheme.titleKey,
                              ),
                              isActive: lightTheme.themeData ==
                                  Provider.of<LightThemeProvider>(
                                    context,
                                  ).themeData,
                              onTap: () async {
                                LightThemeProvider lightThemeProvider =
                                    Provider.of<LightThemeProvider>(
                                  context,
                                  listen: false,
                                );
                                if (lightTheme.themeData !=
                                    lightThemeProvider.themeData) {
                                  lightThemeProvider.setThemeData(
                                    themeData: lightTheme.themeData,
                                  );
                                  var prefs =
                                      await SharedPreferences.getInstance();
                                  prefs.setInt(
                                    'light_theme',
                                    data_themes.lightThemes.indexOf(lightTheme),
                                  );
                                }
                              },
                            ),
                          )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: _defaultMarginPadding,
                  ),
                  _getSelectionRow(
                    titleKey: 'select_dark_theme',
                    contentColumn: Column(
                      children: [
                        for (var darkTheme in data_themes.darkThemes)
                          Padding(
                            padding: EdgeInsets.only(
                              bottom:
                                  data_themes.darkThemes.indexOf(darkTheme) !=
                                          data_themes.darkThemes.length - 1
                                      ? variables.smallMarginPadding()
                                      : 0,
                            ),
                            child: SelectionItem(
                              title: _translate(
                                key: darkTheme.titleKey,
                              ),
                              isActive: darkTheme.themeData ==
                                  Provider.of<DarkThemeProvider>(
                                    context,
                                  ).themeData,
                              onTap: () async {
                                DarkThemeProvider darkThemeProvider =
                                    Provider.of<DarkThemeProvider>(
                                  context,
                                  listen: false,
                                );
                                if (darkTheme.themeData !=
                                    darkThemeProvider.themeData) {
                                  darkThemeProvider.setThemeData(
                                    themeData: darkTheme.themeData,
                                  );
                                  var prefs =
                                      await SharedPreferences.getInstance();
                                  prefs.setInt(
                                    'dark_theme',
                                    data_themes.darkThemes.indexOf(darkTheme),
                                  );
                                }
                              },
                            ),
                          )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              CustomSizeContainer(
                onChange: (
                  Size size,
                ) {
                  setState(
                    () {
                      _headerSize = size;
                    },
                  );
                },
                child: const PageHeader(
                  titleKey: 'appearance',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
