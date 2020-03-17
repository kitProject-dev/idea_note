import 'dart:html';

import 'package:idea_note/repository/user_agent/user_agent_repository.dart';
 
class UserAgentRepositoryWeb extends UserAgentRepository {
  @override
  bool isMobile() {
    return window.navigator.userAgent.contains('Android')
    || window.navigator.userAgent.contains('iPhone');
  }
}
