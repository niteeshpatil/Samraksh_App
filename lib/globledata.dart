import 'package:shared_preferences/shared_preferences.dart';
import 'data.dart';

// Save global data to shared preferences
Future<void> saveGlobalData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setInt('isset', isset);
  await prefs.setInt('p_state', p_state);
  await prefs.setString('last_update', last_update);
  await prefs.setString('p_name', p_name);
  await prefs.setString('p_room', p_room);
  await prefs.setDouble('p_limit', p_limit);
}

// Call this function before closing the app to save the data
Future<void> saveDataBeforeAppClose() async {
  await saveGlobalData();
  loadDataWhenAppStarts();
}

// Load global data from shared preferences
void loadGlobalData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isset = prefs.getInt('isset') ?? 0;
  p_state = prefs.getInt('p_state') ?? 0;
  last_update = prefs.getString('last_update') ?? "-";
  p_name = prefs.getString('p_name') ?? "";
  p_room = prefs.getString('p_room') ?? "";
  p_limit = prefs.getDouble('p_limit') ?? 100;
  printloadeddata();
}

// Call this function when the app starts to load the data
void loadDataWhenAppStarts() {
  loadGlobalData();
}

void printloadeddata() {
  print('Loaded global data:');
  print('isset: $isset');
  print('p_state: $p_state');
  print('last_update: $last_update');
  print('p_name: $p_name');
  print('p_room: $p_room');
  print('p_limit: $p_limit');
}
