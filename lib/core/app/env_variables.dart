import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvVariable {
  EnvVariable._();
  static final EnvVariable instance = EnvVariable._();
  String _envType = '';
  String _buildDeveloper = '';
  Future<void> init({required EnvType envtype}) async {
    switch (envtype) {
      case EnvType.dev:
        await dotenv.load(fileName: '.env.dev');
      case EnvType.prod:
        await dotenv.load(fileName: '.env.prod');
    }
    _envType = dotenv.get('ENV_TYPE');
    _buildDeveloper = dotenv.get('BUILD_DEVELOPER');
  }

  String get envType => _envType;
  bool get debugMood => _envType == 'dev';
  String get buildDeveloper => _buildDeveloper;
}

enum EnvType { dev, prod }
