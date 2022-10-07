import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class ThemeServices {

GetStorage box = GetStorage();  // this is the box that will hold the theme  [ data ]

saveThemeToBox(bool isDark) {
  box.write('isDark', isDark);
}

  // this is to return a bool value that means >> yes it is dark or it is light
 bool loadThemeFromBox(){

  return box.read('isDark') ?? false ;
}


void switchTheme(){
  // here it depends on the load function >> if it is true that means that isDark = true so return light because i want to change to dark and vice versa
  Get.changeThemeMode( loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark   );
  saveThemeToBox( ! loadThemeFromBox() );   // after changing to dark >>> store the dark and vice versa

}

ThemeMode get theme =>  loadThemeFromBox()? ThemeMode.dark : ThemeMode.light ;

}



// documentation for this file [ how it works ]
/*
* first it is null so it the load function returns false
* so the switchTheme func changes the theme according to the load func  ,
*  so it will change the theme to dark
* then save the opposite value of the load func in the save function ,
* so the isDark key value will become true
* that means you are in the dark mode
* so the load function will equal to true
* in the getter theme it depends on the value of the load func
* so the getter theme will change to dark
* in the main file the theme is obtained from the getter theme
* so >>> isDark >>>> load func >>>> theme getter
* and the isDark changes through save func
 */