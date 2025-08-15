import 'dart:convert';
import 'package:health_device/src/config/storage_constants.dart';
import 'package:health_device/src/core/storage/secure_storage_provider.dart';
import 'package:health_device/src/features/auth/modal/login_user.dart';
import 'package:health_device/src/services/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@riverpod
class AuthProvider extends _$AuthProvider {
  @override
  Future<LoginUser?> build() async {
    final secureStorage = ref.watch(secureStorageServiceProvider.notifier);
    final userJson = await secureStorage.getValue(StorageConstants.LOGIN_USER);

    if (userJson == null) return null;

    final Map<String, dynamic> userMap = jsonDecode(userJson);
    return LoginUser.fromJson(userMap);
  }

  /// Login Method
  Future<void> login(String identifier, String password) async {
    state = const AsyncValue.loading();
    try {
      AuthService authService = AuthService();

      final response = await authService.login(identifier, password);

      final loginUser = LoginUser.fromJson(response["user"]);
      if(loginUser.approved==false){
        throw "You have not been approved yet. Please wait for approval.";
      }else{
        // Save user data in Secure Storage
        final secureStorage = ref.read(secureStorageServiceProvider.notifier);
        await secureStorage.setValue(StorageConstants.LOGIN_USER, jsonEncode(loginUser.toJson()));
        print("user created");
      }



      // Update state
      state = AsyncValue.data(loginUser);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
      rethrow;
    }
  }

  /// Signup Method
  Future<void> signup(String username, String email, String password, String fullName) async {
    state = const AsyncValue.loading();
    try {
      AuthService authService = AuthService();


      final response = await authService.signup(username, email, password, fullName);

      final loginUser = LoginUser.fromJson(response["user"]);

      // Save user data in Secure Storage
      // final secureStorage = ref.read(secureStorageServiceProvider.notifier);
      // await secureStorage.setValue(StorageConstants.LOGIN_USER, jsonEncode(loginUser.toJson()));

      // Update state
      state = AsyncValue.data(loginUser);
    } catch (error, stackTrace) {

      state = AsyncValue.error(error, stackTrace);
      rethrow;
    }
  }

  /// Logout Method
  Future<void> logout() async {
    final secureStorage = ref.read(secureStorageServiceProvider.notifier);
    await secureStorage.deleteValue(StorageConstants.LOGIN_USER);
    state = const AsyncValue.data(null);
  }
}
