import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeServices {

  GetStorage box = GetStorage();

  final _key = 'isDark';

   saveThemeToBox(bool isDarkMode){
     box.write( _key, isDarkMode);
  }

 bool loadThemeFromBox(){
    return box.read<bool>(_key) ?? false ;   // if null returns false
  }

  ThemeMode get theme => loadThemeFromBox() ?  ThemeMode.dark : ThemeMode.light;
   // if the value loaded is true >>> dark  , if false >>> is not dark >> light

void switchThemeMode(){
  Get.changeThemeMode( loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light ) ;
  // sets the theme to this theme
    saveThemeToBox( ! loadThemeFromBox() );
    // store the new theme >> the opposite of the old theme loaded from the load function
}

}
