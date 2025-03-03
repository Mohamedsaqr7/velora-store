import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/env_variables.dart';
import 'velora_app.dart';

void main() async{
    await EnvVariable.instance.init(envtype: EnvType.dev);
await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp],
  ).then((_) {
  runApp(const VeloraStore());
  });

}
