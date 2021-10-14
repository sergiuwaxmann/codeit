import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:codeit/data/settings_items.dart' as data_settings;

import 'package:codeit/static/variables.dart' as variables;

import 'package:codeit/widgets/custom_safe_area.dart';
import 'package:codeit/widgets/custom_size_container.dart';
import 'package:codeit/widgets/page_header.dart';

import 'package:codeit/widgets/settings/settings_item.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({
    Key? key,
  }) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late Size _headerSize;

  @override
  void initState() {
    _headerSize = Size.zero;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                children: [
                  for (var settingsItem in data_settings.settingsItems)
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: data_settings.settingsItems
                                        .indexOf(settingsItem) !=
                                    data_settings.settingsItems.length - 1
                                ? variables.defaultMarginPadding()
                                : 0,
                          ),
                          child: SettingsItem(
                            settingsItem: settingsItem,
                          ),
                        ),
                      ],
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
                child:
                    // ignore: prefer_const_constructors
                    PageHeader(
                  titleKey: 'settings',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
