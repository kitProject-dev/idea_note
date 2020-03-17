import 'dart:io';

import 'package:idea_note/repository/user_agent/user_agent_repository.dart';
 
class UserAgentRepositoryMobile extends UserAgentRepository {
  @override
  bool isMobile() {
    return Platform.isAndroid || Platform.isIOS;
  }
}
