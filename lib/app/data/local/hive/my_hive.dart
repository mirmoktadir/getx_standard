import 'package:getx_standard/app/modules/example/home-with-restAPI/model/recipes_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';

class MyHive {
  // Prevent making an instance of this class
  MyHive._();

  // Hive box to store recipe data
  static late Box<Results> _recipeBox;

  // Box name, it's like the table name

  static const String _recipeBoxName = 'recipes';

  /// Initialize local db (HIVE)
  /// Pass testPath only if you are testing hive
  static Future<void> init(
      {Function(HiveInterface)? registerAdapters, String? testPath}) async {
    if (testPath != null) {
      Hive.init(testPath);
    } else {
      await Hive.initFlutter();
    }
    await registerAdapters?.call(Hive);

    await initRecipesBox();
  }

  /// Initialize recipe box
  static Future<void> initRecipesBox() async {
    _recipeBox = await Hive.openBox<Results>(_recipeBoxName);
  }

  /// Save all recipes to the database
  static Future<void> saveAllRecipes(List<Results> recipes) async {
    try {
      await _recipeBox.clear();
      await _recipeBox.addAll(recipes);
    } catch (error) {
      Logger().e("$error");
    }
  }

  /// Get all recipes from Hive
  static List<Results> getAllRecipes() {
    final recipes = _recipeBox.values.toList();
    return recipes.cast<Results>();
  }
}
