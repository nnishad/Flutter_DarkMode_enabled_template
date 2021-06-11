import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:flutter_ui_draft/main/models/AppModel.dart';
import 'package:flutter_ui_draft/main/utils/AppColors.dart';
import 'package:flutter_ui_draft/main/utils/AppCommon.dart';
import 'package:flutter_ui_draft/main/utils/AppConstants.dart';
import 'package:flutter_ui_draft/main/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:package_info/package_info.dart';
import 'package:share/share.dart';

import '../../main.dart';
import 'AppItemWidget.dart';

class AppSettingsWidget extends StatefulWidget {
  static String tag = '/AppSettingsWidget';

  @override
  AppSettingsWidgetState createState() => AppSettingsWidgetState();
}

class AppSettingsWidgetState extends State<AppSettingsWidget> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Observer(
          builder: (_) => Wrap(
            runSpacing: 16,
            children: [
              AppItemWidget(
                index: 1,
                data: AppModel(title: 'Dark Mode'),
                icon: Icon(MaterialCommunityIcons.theme_light_dark,
                    color: appPrimaryColor),
                child: Container(
                  child: CupertinoSwitch(
                    value: appStore.isDarkModeOn,
                    activeColor: appPrimaryColor,
                    onChanged: (v) {
                      appStore.toggleDarkMode(value: v);
                    },
                  ),
                ),
                onTap: () {
                  appStore.toggleDarkMode();
                  setState(() {});
                },
              ),
            ],
          ).paddingOnly(left: 8, right: 8, bottom: 16),
        ),
        Loader().visible(isLoading),
      ],
    );
  }
}
