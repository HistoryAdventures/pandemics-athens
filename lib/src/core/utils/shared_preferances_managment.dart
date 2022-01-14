import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferancesManagment{
  factory SharedPreferancesManagment()=>_sharedPreferancesManagment;

  SharedPreferancesManagment._internal();

  static final SharedPreferancesManagment _sharedPreferancesManagment = SharedPreferancesManagment._internal();


  late SharedPreferences _sharedPreferences;

   Future<void> init()async{
     _sharedPreferences = await SharedPreferences.getInstance();
   }

   SharedPreferences get prefs => _sharedPreferences;
}