import '../../../modules/example/home-with-restAPI/model/recipes_model.dart';
import 'my_hive.dart';

class HiveAdapters {
  static Future<void> registerAll() async {
    await MyHive.init(registerAdapters: (hive) {
      hive.registerAdapter(RecipesAdapter());
      hive.registerAdapter(ResultsAdapter());
      hive.registerAdapter(TotalTimeTierAdapter());
      hive.registerAdapter(ShowAdapter());
      hive.registerAdapter(SectionsAdapter());
      hive.registerAdapter(ComponentsAdapter());
      hive.registerAdapter(MeasurementsAdapter());
      hive.registerAdapter(UnitAdapter());
      hive.registerAdapter(IngredientAdapter());
      hive.registerAdapter(CompilationsAdapter());
      hive.registerAdapter(TagsAdapter());
      hive.registerAdapter(RenditionsAdapter());
      hive.registerAdapter(NutritionAdapter());
      hive.registerAdapter(PriceAdapter());
      hive.registerAdapter(TopicsAdapter());
      hive.registerAdapter(UserRatingsAdapter());
      hive.registerAdapter(InstructionsAdapter());
      hive.registerAdapter(CreditsAdapter());
    });
  }
}
