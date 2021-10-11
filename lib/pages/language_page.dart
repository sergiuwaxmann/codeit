import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:codeit/data/languages.dart' as data_languages;

import 'package:codeit/providers/locale_provider.dart';

import 'package:codeit/static/variables.dart' as variables;

import 'package:codeit/widgets/custom_safe_area.dart';
import 'package:codeit/widgets/custom_size_container.dart';
import 'package:codeit/widgets/page_header.dart';
import 'package:codeit/widgets/selection_item.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({
    Key? key,
  }) : super(key: key);

  @override
  _LanguagePageState createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  late Size _headerSize;

  @override
  void initState() {
    _headerSize = Size.zero;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _smallMarginPadding = variables.smallMarginPadding();

    String _translate({
      required String key,
    }) =>
        variables.translate(
          context,
          key,
        )!;

    // Sort languages alphabetically
    data_languages.languages.sort(
      (
        a,
        b,
      ) =>
          _translate(
        key: a.titleKey,
      ).compareTo(
        _translate(
          key: b.titleKey,
        ),
      ),
    );

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
                  Text(
                    _translate(
                      key: 'select_language',
                    ),
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                          fontSize: variables.headline3FontSize(),
                        ),
                  ),
                  SizedBox(
                    height: _smallMarginPadding,
                  ),
                  Container(
                    padding: EdgeInsets.all(
                      _smallMarginPadding,
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
                    child: Column(
                      children: [
                        for (var language in data_languages.languages)
                          Padding(
                            padding: EdgeInsets.only(
                              bottom:
                                  data_languages.languages.indexOf(language) !=
                                          data_languages.languages.length - 1
                                      ? _smallMarginPadding
                                      : 0,
                            ),
                            child: SelectionItem(
                              title: variables.translate(
                                context,
                                language.titleKey,
                              )!,
                              isActive: language.languageCode ==
                                  Provider.of<LocaleProvider>(
                                    context,
                                  ).locale!.languageCode,
                              onTap: () async {
                                LocaleProvider localeProvider =
                                    Provider.of<LocaleProvider>(
                                  context,
                                  listen: false,
                                );
                                if (language.languageCode !=
                                    localeProvider.locale!.languageCode) {
                                  localeProvider.setLocale(
                                    locale: Locale(
                                      language.languageCode,
                                      language.countryCode,
                                    ),
                                  );
                                  var prefs =
                                      await SharedPreferences.getInstance();
                                  prefs.setString(
                                    'locale_name',
                                    language.localeName,
                                  );
                                }
                              },
                            ),
                          ),
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
                  titleKey: 'language',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
