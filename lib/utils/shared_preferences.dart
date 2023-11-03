import 'package:shared_preferences/shared_preferences.dart';

// 데이터를 가져오는 함수
Future<String> loadData(String name) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String data = prefs.getString(name) ?? '';
  return data;
}

// 데이터를 저장하는 함수
Future<void> saveData(String name, String data) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(name, data);
}


/*

활용법

- 데이터 저장
saveData('키', 값);

- 데이터 호출
await loadData('키'),

 */