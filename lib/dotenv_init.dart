// dotenv_init.dart

//.env 파일에 넣어둔 서비스키를 쓰기 위해, dotenv를 초기화해야하므로 필요한 파일

// dotenv_init.dart

import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> initializeDotEnv() async {
  await dotenv.load();
}
