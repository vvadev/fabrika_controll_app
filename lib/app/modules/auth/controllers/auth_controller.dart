import 'package:fabrika_controll_app/app/core/constants/constants.dart';
import 'package:get/get.dart';
import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';

class AuthController extends GetxController {
  late final Account _account;
  late final Client _client;
  final Rx<AuthStatus> _status = AuthStatus.uninitialized.obs;

  final Rx<User?> _user = Rx<User?>(null);
  final Rx<String?> _error = Rx<String?>(null);
  final Rx<bool> _loading = true.obs;

  AuthController() {
    Client client = Client();
    client
        .setEndpoint(serverEndpoint)
        .setProject(serverProject)
        .setSelfSigned(status: true);
    _error.value = '';
    _account = Account(client);
    _getUser();
  }

  Account get account => _account;
  Client get client => _client;
  get error => _error;
  get isLoading => _loading.value;
  get user => _user.value;
  get status => _status.value;

  Future<void> _getUser({bool notify = true}) async {
    try {
      _user.value = await _account.get();
      _status.value = AuthStatus.authenticated;
    } on AppwriteException catch (e) {
      _status.value = AuthStatus.unauthenticated;
      _error.value = e.message;
    } finally {
      _loading.value = false;
      if (notify) {
        update();
      }
    }
  }

  Future<bool> deleteSession({String sessionId = 'current'}) async {
    try {
      await _account.deleteSession(sessionId: sessionId);
      _user.value = null;
      _status.value = AuthStatus.unauthenticated;
      update();
      return true;
    } on AppwriteException catch (e) {
      _error.value = e.message;
      return false;
    }
  }

  Future<bool> deleteSessions() async {
    try {
      await _account.deleteSessions();
      _user.value = null;
      _status.value = AuthStatus.unauthenticated;
      update();
      return true;
    } on AppwriteException catch (e) {
      _error.value = e.message;
      return false;
    }
  }

  Future<bool> createEmailSession({
    required String email,
    required String password,
    bool notify = true,
  }) async {
    _status.value = AuthStatus.authenticating;
    if (notify) {
      update();
    }
    try {
      await _account.createEmailSession(email: email, password: password);
      await _getUser(notify: notify);
      return true;
    } on AppwriteException catch (e) {
      _error.value = e.message;
      _status.value = AuthStatus.unauthenticated;
      if (notify) {
        update();
      }
      return false;
    }
  }

  Future<bool> createPhoneSession({
    required String userId,
    required String number,
  }) async {
    _status.value = AuthStatus.authenticating;
    update();
    try {
      await _account.createPhoneSession(userId: userId, phone: number);
      return true;
    } on AppwriteException catch (e) {
      _error.value = e.message;
      _status.value = AuthStatus.unauthenticated;
      update();
      return false;
    }
  }

  Future<bool> updatePhoneSession({
    required String userId,
    required String secret,
  }) async {
    _status.value = AuthStatus.authenticating;
    update();
    try {
      await _account.updatePhoneSession(userId: userId, secret: secret);
      await _getUser();
      return true;
    } on AppwriteException catch (e) {
      _error.value = e.message;
      _status.value = AuthStatus.unauthenticated;
      update();
      return false;
    }
  }

  Future<bool> createAnonymousSession() async {
    _status.value = AuthStatus.authenticating;
    update();
    try {
      await _account.createAnonymousSession();
      await _getUser();
      return true;
    } on AppwriteException catch (e) {
      _error.value = e.message;
      _status.value = AuthStatus.unauthenticated;
      update();
      return false;
    }
  }

  Future<bool> createMagicURLSession({
    required String email,
    String userId = 'unique()',
    String? url,
  }) async {
    _status.value = AuthStatus.authenticating;
    update();
    try {
      await _account.createMagicURLSession(
          userId: userId, email: email, url: url);
      return true;
    } on AppwriteException catch (e) {
      _error.value = e.message;
      _status.value = AuthStatus.unauthenticated;
      update();
      return false;
    }
  }

  Future<bool> updateMagicURLSession({
    required String userId,
    required String secret,
  }) async {
    _status.value = AuthStatus.authenticating;
    update();
    try {
      await _account.updateMagicURLSession(userId: userId, secret: secret);
      await _getUser();
      return true;
    } on AppwriteException catch (e) {
      _error.value = e.message;
      _status.value = AuthStatus.unauthenticated;
      update();
      return false;
    }
  }

  Future<Jwt?> createJWT() async {
    try {
      return await _account.createJWT();
    } on AppwriteException catch (e) {
      _error.value = e.message;
      update();
      return null;
    }
  }

  Future<User?> create({
    required String email,
    required String password,
    String userId = 'unique()',
    bool notify = true,
    bool newSession = true,
    String? name,
  }) async {
    _status.value = AuthStatus.authenticating;
    if (notify) {
      update();
    }
    try {
      final user = await _account.create(
          userId: userId, name: name, email: email, password: password);
      _error.value = '';
      if (newSession) {
        await createEmailSession(email: email, password: password);
      }
      return user;
    } on AppwriteException catch (e) {
      _error.value = e.message;
      _status.value = AuthStatus.unauthenticated;
      if (notify) {
        update();
      }
      return null;
    }
  }

  Future<bool> updateStatus() async {
    try {
      await _account.updateStatus();
      await _getUser();
      return true;
    } on AppwriteException catch (e) {
      _error.value = e.message;
      _status.value = AuthStatus.unauthenticated;
      update();
      return false;
    }
  }

  Future<User?> updatePrefs({required Map<String, dynamic> prefs}) async {
    try {
      _user.value = await _account.updatePrefs(prefs: prefs);
      update();
      return _user.value;
    } on AppwriteException catch (e) {
      _error.value = e.message;
      update();
      return null;
    }
  }

  Future<LogList?> listLogs({int? limit, int? offset}) async {
    try {
      return await _account.listLogs(queries: [
        if (limit != null) Query.limit(limit),
        if (offset != null) Query.offset(offset),
      ]);
    } on AppwriteException catch (e) {
      _error.value = e.message;
      update();
      return null;
    }
  }

  Future<bool> createOAuth2Session({
    required String provider,
    String? success,
    String? failure,
    List<String>? scopes,
  }) async {
    try {
      await _account.createOAuth2Session(
        provider: provider,
        success: success,
        failure: failure,
        scopes: scopes,
      );
      await _getUser();
      return true;
    } on AppwriteException catch (e) {
      _error.value = e.message;
      update();
      return false;
    }
  }

  Future<Session?> getSession({required String sessionId}) async {
    try {
      return await _account.getSession(sessionId: sessionId);
    } on AppwriteException catch (e) {
      _error.value = e.message;
      update();
      return null;
    }
  }

  Future<SessionList?> listSessions() async {
    try {
      return await _account.listSessions();
    } on AppwriteException catch (e) {
      _error.value = e.message;
      update();
      return null;
    }
  }

  Future<User?> updateName({required String name}) async {
    try {
      _user.value = await _account.updateName(name: name);
      update();
      return _user.value;
    } on AppwriteException catch (e) {
      _error.value = e.message;
      update();
      return null;
    }
  }

  Future<User?> updatePhone({
    required String number,
    required String password,
  }) async {
    try {
      _user.value =
          await _account.updatePhone(phone: number, password: password);
      update();
      return _user.value;
    } on AppwriteException catch (e) {
      _error.value = e.message;
      update();
      return null;
    }
  }

  Future<User?> updateEmail({
    required String email,
    required String password,
  }) async {
    try {
      _user.value =
          await _account.updateEmail(email: email, password: password);
      update();
      return _user.value;
    } on AppwriteException catch (e) {
      _error.value = e.message;
      update();
      return null;
    }
  }

  Future<User?> updatePassword({
    required String password,
    String? oldPassword,
  }) async {
    try {
      _user.value = await _account.updatePassword(
          password: password, oldPassword: oldPassword);
      update();
      return _user.value;
    } on AppwriteException catch (e) {
      _error.value = e.message;
      update();
      return null;
    }
  }

  Future<Token?> createRecovery({
    required String email,
    required String url,
  }) async {
    try {
      return await _account.createRecovery(email: email, url: url);
    } on AppwriteException catch (e) {
      _error.value = e.message;
      update();
      return null;
    }
  }

  Future<Token?> updateRecovery({
    required String userId,
    required String password,
    required String passwordAgain,
    required String secret,
  }) async {
    try {
      return await _account.updateRecovery(
          userId: userId,
          password: password,
          passwordAgain: passwordAgain,
          secret: secret);
    } on AppwriteException catch (e) {
      _error.value = e.message;
      update();
      return null;
    }
  }

  Future<Token?> createVerification({required String url}) async {
    try {
      final a = await _account.createVerification(url: url);
      print(a);
      return a;
      // return await _account.createVerification(url: url);
    } on AppwriteException catch (e) {
      _error.value = e.message;
      update();
      return null;
    }
  }

  Future<Token?> updateVerification({
    required String userId,
    required String secret,
  }) async {
    try {
      return await _account.updateVerification(userId: userId, secret: secret);
    } on AppwriteException catch (e) {
      _error.value = e.message;
      update();
      return null;
    }
  }

  Future<Token?> createPhoneVerification() async {
    try {
      return await _account.createPhoneVerification();
    } on AppwriteException catch (e) {
      _error.value = e.message;
      update();
      return null;
    }
  }

  Future<Token?> updatePhoneVerification({
    required String userId,
    required String secret,
  }) async {
    try {
      return await _account.updatePhoneVerification(
          userId: userId, secret: secret);
    } on AppwriteException catch (e) {
      _error.value = e.message;
      update();
      return null;
    }
  }



}

enum AuthStatus {
  uninitialized,
  authenticated,
  authenticating,
  unauthenticated,
}
