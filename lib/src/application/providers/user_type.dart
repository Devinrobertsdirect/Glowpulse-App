import 'package:health_device/src/config/enum/user_types.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'user_type.g.dart';
// TODO: remove this and move to user provider.
@riverpod
class UserTypeNotifier extends _$UserTypeNotifier {
  @override
  UserType build() {
    return UserType.user; // Default state
  }

  void setUserType(UserType newType) {
    state = newType;
  }
}