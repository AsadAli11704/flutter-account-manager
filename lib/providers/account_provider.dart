import 'package:flutter/foundation.dart';
import 'package:account_manager/models/account_model.dart';

class AccountProvider with ChangeNotifier {
  final List<Account> _accounts = [];

  List<Account> get accounts => _accounts;

  void addAccount(Account account) {
    _accounts.add(account);
    notifyListeners();
  }

  void removeAccount(int index) {
    _accounts.removeAt(index);
    notifyListeners();
  }
}
