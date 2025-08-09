import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
    @EnviedField(varName: 'WEATHERAPI_KEY', obfuscate: true)
    static final String weatherApiKey = _Env.weatherApiKey;
}