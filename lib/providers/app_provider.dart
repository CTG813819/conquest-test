import 'package:flutter/foundation.dart';
import '../models/app_model.dart';
import '../services/app_service.dart';

class AppProvider with ChangeNotifier {
  AppService _service = AppService();
  List<AppModel> _items = [];
  bool _isLoading = false;

  List<AppModel> get items => _items;
  bool get isLoading => _isLoading;

  Future<void> loadData() async {
    _isLoading = true;
    notifyListeners();

    try {
      final data = await _service.getData();
      // Process data and update _items
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
    }
  }
}
