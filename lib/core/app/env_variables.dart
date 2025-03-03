import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvVariable {
  EnvVariable._();
  static final EnvVariable instance = EnvVariable._();
  String _envType = '';
  Future<void> init({required EnvType envtype}) async {
    switch (envtype) {
      case EnvType.dev:
        await dotenv.load(fileName: '.env.dev');
      case EnvType.prod:
        await dotenv.load(fileName: '.env.prod');
    }
    _envType = dotenv.get('ENV_TYPE');
  }

  String get envType => _envType;
  bool get debugMood => _envType == 'dev';
}

enum EnvType { dev, prod }
