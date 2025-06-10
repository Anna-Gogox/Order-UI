import 'package:flutter_modular/flutter_modular.dart';
import 'package:order_ui/pages/user_detail_screen.dart';

class UserModule extends Module {
  @override
  void routes(r) {
    r.child(
      '/:userId',
      child: (_) {
        final id = int.parse(r.args.params['userId']);
        return UserDetailScreen(userId: id);
      },
      transition: TransitionType.rightToLeft,
    );
  }
}