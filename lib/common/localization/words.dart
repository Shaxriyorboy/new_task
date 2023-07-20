import 'package:flutter/material.dart';
import 'app_localization.dart';

extension MyWords on Words {
  String tr(BuildContext context, [int? key]) => AppLocalizations.of(context).tr("$name${key ?? ""}");
}

enum Words {
  name,
  login,
  signup,
  email,
  password,
}
