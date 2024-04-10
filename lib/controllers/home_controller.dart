import 'dart:convert';
import 'package:flutter_assignment/constants/url_constants.dart';
import 'package:flutter_assignment/model/image_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  RxString _dogImageUrl = ''.obs;
  RxList<DogImage> _history = <DogImage>[].obs;

  String get dogImageUrl => _dogImageUrl.value;
  List<DogImage> get history => _history;

  @override
  void onInit() {
    super.onInit();
    fetchDogImage();
    _loadHistory();
    _saveHistory();
  }

  Future<void> fetchDogImage() async {
    final response = await http.get(Uri.parse(UrlConstants.baseUrl));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final newImageUrl = data['message'];
      _dogImageUrl.value = newImageUrl;
      _history.insert(
          0,
          DogImage(
              imageUrl: newImageUrl, price: 100)); // Default price set to 0
      _saveHistory();
    } else {
      throw Exception('Failed to load dog image');
    }
  }

  Future<void> _saveHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> historyList =
        _history.map((dogImage) => dogImage.imageUrl).toList();
    prefs.setStringList('history', historyList);
  }

  Future<void> _loadHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? savedHistory = prefs.getStringList('history');
    if (savedHistory != null) {
      _history.value = savedHistory
          .map((imageUrl) => DogImage(imageUrl: imageUrl, price: 100))
          .toList();
      _dogImageUrl.value = _history.isNotEmpty ? _history[0].imageUrl : '';
    }
  }
}
