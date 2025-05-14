import 'package:hive_ce/hive.dart';

import '../../app/data/model/response/user_response_model.dart';

part 'hive_adapters.g.dart';

@GenerateAdapters([
  AdapterSpec<UserResponseModel>(),
])
class HiveAdapters {}
