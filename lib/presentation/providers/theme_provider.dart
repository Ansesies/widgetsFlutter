

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final themeProvider = StateProvider((ref) => false);

//*listado de colores inmutables

final colorListProvider = Provider((ref) => colorList);

//*un simple int

final selectedColorProvider = StateProvider((ref) => 0);

//* un objeto de tipo AppTheme (custom)
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
  );

class ThemeNotifier extends StateNotifier<AppTheme>{
  ThemeNotifier(): super(AppTheme());

  void toggleDarkmode(){
    state = state.copyWith(isDarkmode: !state.isDarkmode);
  }

  void changeColorIndex( int colorIndex){
    state = state.copyWith(selectedColor: colorIndex);
  }

}