// import 'package:shared_preferences/shared_preferences.dart';
// import 'data.dart';

// // Save global data to shared preferences
// Future<void> saveGlobalData() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   await prefs.setInt('isset', isset);
//   await prefs.setInt('p_state', p_state);
//   await prefs.setString('last_update', last_update);
//   await prefs.setString('p_name', p_name);
//   await prefs.setString('p_room', p_room);
//   await prefs.setDouble('p_limit', p_limit);
// }

// // Call this function before closing the app to save the data
// Future<void> saveDataBeforeAppClose() async {
//   await saveGlobalData();
//   loadDataWhenAppStarts();
// }

// // Load global data from shared preferences
// void loadGlobalData() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   isset = prefs.getInt('isset') ?? 0;
//   p_state = prefs.getInt('p_state') ?? 0;
//   last_update = prefs.getString('last_update') ?? "-";
//   p_name = prefs.getString('p_name') ?? "";
//   p_room = prefs.getString('p_room') ?? "";
//   p_limit = prefs.getDouble('p_limit') ?? 100;
//   printloadeddata();
// }

// // Call this function when the app starts to load the data
// void loadDataWhenAppStarts() {
//   loadGlobalData();
// }

// void printloadeddata() {
//   print('Loaded global data:');
//   print('isset: $isset');
//   print('p_state: $p_state');
//   print('last_update: $last_update');
//   print('p_name: $p_name');
//   print('p_room: $p_room');
//   print('p_limit: $p_limit');
// }

import 'package:shared_preferences/shared_preferences.dart';
import 'data.dart';

// Save global data to shared preferences
Future<void> saveGlobalData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setInt('isset', isset);
  await prefs.setInt('mobile_id', mobile_id);

  await prefs.setInt('device1_isset', device1isset);
  await prefs.setInt('patient1_state', p_state1);
  await prefs.setString('patient1_last_update', last_update1);
  await prefs.setString('patient1_name', p_name1);
  await prefs.setString('patient1_room', p_room1);
  await prefs.setDouble('patient1_limit', p_limit1);

  await prefs.setInt('device2_isset', device2isset);
  await prefs.setInt('patient2_state', p_state2);
  await prefs.setString('patient2_last_update', last_update2);
  await prefs.setString('patient2_name', p_name2);
  await prefs.setString('patient2_room', p_room2);
  await prefs.setDouble('patient2_limit', p_limit2);
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
  mobile_id = prefs.getInt('mobile_id') ?? 0;

  device1isset = prefs.getInt('device1_isset') ?? 0;
  p_state1 = prefs.getInt('patient1_state') ?? 0;
  last_update1 =
      prefs.getString('patient1_last_update') ?? "No previous updates....";
  p_name1 = prefs.getString('patient1_name') ?? "";
  p_room1 = prefs.getString('patient1_room') ?? "";
  p_limit1 = prefs.getDouble('patient1_limit') ?? 100;

  device2isset = prefs.getInt('device2_isset') ?? 0;
  p_state2 = prefs.getInt('patient2_state') ?? 0;
  last_update2 =
      prefs.getString('patient2_last_update') ?? "No previous updates....";
  p_name2 = prefs.getString('patient2_name') ?? "";
  p_room2 = prefs.getString('patient2_room') ?? "";
  p_limit2 = prefs.getDouble('patient2_limit') ?? 100;

  printLoadedData();
}

// Call this function when the app starts to load the data
void loadDataWhenAppStarts() {
  loadGlobalData();
}

void printLoadedData() {
  print('Loaded global data:');
  print('isset: $isset');
  print('mobile_id: $mobile_id');

  print('global data of patient 1:');
  print('device1_isset: $device1isset');
  print('patient1_state: $p_state1');
  print('patient1_last_update: $last_update1');
  print('patient1_name: $p_name1');
  print('patient1_room: $p_room1');
  print('patient1_limit: $p_limit1');

  print('global data of patient 2:');
  print('device2_isset: $device2isset');
  print('patient2_state: $p_state2');
  print('patient2_last_update: $last_update2');
  print('patient2_name: $p_name2');
  print('patient2_room: $p_room2');
  print('patient2_limit: $p_limit2');
}

void resetgobledata(int device) {
  if (device == 1) {
    p_name1 = "";
    p_room1 = "";
    p_limit1 = 100;
    p_state1 = 0;
    last_update1 = "No previous updates....";
    device1isset = 0;
  } else {
    p_name2 = "";
    p_room2 = "";
    p_limit2 = 100;
    p_state2 = 0;
    last_update2 = "No previous updates....";
    device2isset = 0;
  }
  if (device1isset == 0 && device2isset == 0) {
    isset = 0;
    mobile_id = 0;
  }
  saveGlobalData();
}
