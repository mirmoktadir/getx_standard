// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipes_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecipesAdapter extends TypeAdapter<Recipes> {
  @override
  final int typeId = 1;

  @override
  Recipes read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Recipes(
      count: fields[0] as dynamic,
      results: (fields[1] as List?)?.cast<Results>(),
    );
  }

  @override
  void write(BinaryWriter writer, Recipes obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.count)
      ..writeByte(1)
      ..write(obj.results);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ResultsAdapter extends TypeAdapter<Results> {
  @override
  final int typeId = 2;

  @override
  Results read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Results(
      seoPath: fields[0] as String?,
      brand: fields[1] as dynamic,
      name: fields[2] as String?,
      credits: (fields[3] as List?)?.cast<Credits>(),
      canonicalId: fields[4] as String?,
      videoId: fields[5] as dynamic,
      language: fields[6] as String?,
      prepTimeMinutes: fields[7] as dynamic,
      description: fields[8] as String?,
      videoAdContent: fields[9] as String?,
      instructions: (fields[10] as List?)?.cast<Instructions>(),
      userRatings: fields[11] as UserRatings?,
      videoUrl: fields[12] as String?,
      topics: (fields[13] as List?)?.cast<Topics>(),
      seoTitle: fields[14] as String?,
      nutritionVisibility: fields[15] as String?,
      country: fields[16] as String?,
      price: fields[17] as Price?,
      nutrition: fields[18] as Nutrition?,
      aspectRatio: fields[19] as String?,
      renditions: (fields[20] as List?)?.cast<Renditions>(),
      keywords: fields[21] as String?,
      tags: (fields[22] as List?)?.cast<Tags>(),
      totalTimeMinutes: fields[23] as dynamic,
      updatedAt: fields[24] as dynamic,
      id: fields[25] as dynamic,
      slug: fields[26] as String?,
      servingsNounSingular: fields[27] as String?,
      showId: fields[28] as dynamic,
      compilations: (fields[29] as List?)?.cast<Compilations>(),
      inspiredByUrl: fields[30] as dynamic,
      approvedAt: fields[31] as dynamic,
      isShoppable: fields[32] as bool?,
      yields: fields[33] as String?,
      originalVideoUrl: fields[34] as String?,
      thumbnailAltText: fields[35] as String?,
      servingsNounPlural: fields[36] as String?,
      facebookPosts: (fields[37] as List?)?.cast<dynamic>(),
      sections: (fields[38] as List?)?.cast<Sections>(),
      brandId: fields[39] as dynamic,
      tipsAndRatingsEnabled: fields[40] as bool?,
      show: fields[41] as Show?,
      createdAt: fields[42] as dynamic,
      totalTimeTier: fields[43] as TotalTimeTier?,
      cookTimeMinutes: fields[44] as dynamic,
      promotion: fields[45] as String?,
      numServings: fields[46] as dynamic,
      buzzId: fields[47] as dynamic,
      draftStatus: fields[48] as String?,
      thumbnailUrl: fields[49] as String?,
      isOneTop: fields[50] as bool?,
      beautyUrl: fields[51] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, Results obj) {
    writer
      ..writeByte(52)
      ..writeByte(0)
      ..write(obj.seoPath)
      ..writeByte(1)
      ..write(obj.brand)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.credits)
      ..writeByte(4)
      ..write(obj.canonicalId)
      ..writeByte(5)
      ..write(obj.videoId)
      ..writeByte(6)
      ..write(obj.language)
      ..writeByte(7)
      ..write(obj.prepTimeMinutes)
      ..writeByte(8)
      ..write(obj.description)
      ..writeByte(9)
      ..write(obj.videoAdContent)
      ..writeByte(10)
      ..write(obj.instructions)
      ..writeByte(11)
      ..write(obj.userRatings)
      ..writeByte(12)
      ..write(obj.videoUrl)
      ..writeByte(13)
      ..write(obj.topics)
      ..writeByte(14)
      ..write(obj.seoTitle)
      ..writeByte(15)
      ..write(obj.nutritionVisibility)
      ..writeByte(16)
      ..write(obj.country)
      ..writeByte(17)
      ..write(obj.price)
      ..writeByte(18)
      ..write(obj.nutrition)
      ..writeByte(19)
      ..write(obj.aspectRatio)
      ..writeByte(20)
      ..write(obj.renditions)
      ..writeByte(21)
      ..write(obj.keywords)
      ..writeByte(22)
      ..write(obj.tags)
      ..writeByte(23)
      ..write(obj.totalTimeMinutes)
      ..writeByte(24)
      ..write(obj.updatedAt)
      ..writeByte(25)
      ..write(obj.id)
      ..writeByte(26)
      ..write(obj.slug)
      ..writeByte(27)
      ..write(obj.servingsNounSingular)
      ..writeByte(28)
      ..write(obj.showId)
      ..writeByte(29)
      ..write(obj.compilations)
      ..writeByte(30)
      ..write(obj.inspiredByUrl)
      ..writeByte(31)
      ..write(obj.approvedAt)
      ..writeByte(32)
      ..write(obj.isShoppable)
      ..writeByte(33)
      ..write(obj.yields)
      ..writeByte(34)
      ..write(obj.originalVideoUrl)
      ..writeByte(35)
      ..write(obj.thumbnailAltText)
      ..writeByte(36)
      ..write(obj.servingsNounPlural)
      ..writeByte(37)
      ..write(obj.facebookPosts)
      ..writeByte(38)
      ..write(obj.sections)
      ..writeByte(39)
      ..write(obj.brandId)
      ..writeByte(40)
      ..write(obj.tipsAndRatingsEnabled)
      ..writeByte(41)
      ..write(obj.show)
      ..writeByte(42)
      ..write(obj.createdAt)
      ..writeByte(43)
      ..write(obj.totalTimeTier)
      ..writeByte(44)
      ..write(obj.cookTimeMinutes)
      ..writeByte(45)
      ..write(obj.promotion)
      ..writeByte(46)
      ..write(obj.numServings)
      ..writeByte(47)
      ..write(obj.buzzId)
      ..writeByte(48)
      ..write(obj.draftStatus)
      ..writeByte(49)
      ..write(obj.thumbnailUrl)
      ..writeByte(50)
      ..write(obj.isOneTop)
      ..writeByte(51)
      ..write(obj.beautyUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResultsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TotalTimeTierAdapter extends TypeAdapter<TotalTimeTier> {
  @override
  final int typeId = 3;

  @override
  TotalTimeTier read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TotalTimeTier(
      tier: fields[0] as String?,
      displayTier: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TotalTimeTier obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.tier)
      ..writeByte(1)
      ..write(obj.displayTier);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TotalTimeTierAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ShowAdapter extends TypeAdapter<Show> {
  @override
  final int typeId = 4;

  @override
  Show read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Show(
      id: fields[0] as dynamic,
      name: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Show obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShowAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SectionsAdapter extends TypeAdapter<Sections> {
  @override
  final int typeId = 5;

  @override
  Sections read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Sections(
      components: (fields[0] as List?)?.cast<Components>(),
      name: fields[1] as dynamic,
      position: fields[2] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, Sections obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.components)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.position);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SectionsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ComponentsAdapter extends TypeAdapter<Components> {
  @override
  final int typeId = 6;

  @override
  Components read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Components(
      ingredient: fields[0] as Ingredient?,
      id: fields[1] as dynamic,
      position: fields[2] as dynamic,
      measurements: (fields[3] as List?)?.cast<Measurements>(),
      rawText: fields[4] as String?,
      extraComment: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Components obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.ingredient)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.position)
      ..writeByte(3)
      ..write(obj.measurements)
      ..writeByte(4)
      ..write(obj.rawText)
      ..writeByte(5)
      ..write(obj.extraComment);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ComponentsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MeasurementsAdapter extends TypeAdapter<Measurements> {
  @override
  final int typeId = 7;

  @override
  Measurements read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Measurements(
      quantity: fields[0] as String?,
      id: fields[1] as dynamic,
      unit: fields[2] as Unit?,
    );
  }

  @override
  void write(BinaryWriter writer, Measurements obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.quantity)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.unit);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MeasurementsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UnitAdapter extends TypeAdapter<Unit> {
  @override
  final int typeId = 8;

  @override
  Unit read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Unit(
      system: fields[0] as String?,
      name: fields[1] as String?,
      displayPlural: fields[2] as String?,
      displaySingular: fields[3] as String?,
      abbreviation: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Unit obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.system)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.displayPlural)
      ..writeByte(3)
      ..write(obj.displaySingular)
      ..writeByte(4)
      ..write(obj.abbreviation);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnitAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class IngredientAdapter extends TypeAdapter<Ingredient> {
  @override
  final int typeId = 9;

  @override
  Ingredient read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Ingredient(
      updatedAt: fields[0] as dynamic,
      name: fields[1] as String?,
      createdAt: fields[2] as dynamic,
      displayPlural: fields[3] as String?,
      id: fields[4] as dynamic,
      displaySingular: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Ingredient obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.updatedAt)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.createdAt)
      ..writeByte(3)
      ..write(obj.displayPlural)
      ..writeByte(4)
      ..write(obj.id)
      ..writeByte(5)
      ..write(obj.displaySingular);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IngredientAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CompilationsAdapter extends TypeAdapter<Compilations> {
  @override
  final int typeId = 10;

  @override
  Compilations read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Compilations(
      approvedAt: fields[0] as dynamic,
      slug: fields[1] as String?,
      language: fields[2] as String?,
      thumbnailUrl: fields[3] as String?,
      videoUrl: fields[4] as String?,
      name: fields[5] as String?,
      canonicalId: fields[6] as String?,
      videoId: fields[7] as dynamic,
      keywords: fields[8] as dynamic,
      thumbnailAltText: fields[9] as String?,
      draftStatus: fields[10] as String?,
      beautyUrl: fields[11] as dynamic,
      buzzId: fields[12] as dynamic,
      isShoppable: fields[13] as bool?,
      description: fields[14] as String?,
      facebookPosts: (fields[15] as List?)?.cast<dynamic>(),
      show: (fields[16] as List?)?.cast<Show>(),
      createdAt: fields[17] as dynamic,
      id: fields[18] as dynamic,
      promotion: fields[19] as String?,
      aspectRatio: fields[20] as String?,
      country: fields[21] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Compilations obj) {
    writer
      ..writeByte(22)
      ..writeByte(0)
      ..write(obj.approvedAt)
      ..writeByte(1)
      ..write(obj.slug)
      ..writeByte(2)
      ..write(obj.language)
      ..writeByte(3)
      ..write(obj.thumbnailUrl)
      ..writeByte(4)
      ..write(obj.videoUrl)
      ..writeByte(5)
      ..write(obj.name)
      ..writeByte(6)
      ..write(obj.canonicalId)
      ..writeByte(7)
      ..write(obj.videoId)
      ..writeByte(8)
      ..write(obj.keywords)
      ..writeByte(9)
      ..write(obj.thumbnailAltText)
      ..writeByte(10)
      ..write(obj.draftStatus)
      ..writeByte(11)
      ..write(obj.beautyUrl)
      ..writeByte(12)
      ..write(obj.buzzId)
      ..writeByte(13)
      ..write(obj.isShoppable)
      ..writeByte(14)
      ..write(obj.description)
      ..writeByte(15)
      ..write(obj.facebookPosts)
      ..writeByte(16)
      ..write(obj.show)
      ..writeByte(17)
      ..write(obj.createdAt)
      ..writeByte(18)
      ..write(obj.id)
      ..writeByte(19)
      ..write(obj.promotion)
      ..writeByte(20)
      ..write(obj.aspectRatio)
      ..writeByte(21)
      ..write(obj.country);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompilationsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TagsAdapter extends TypeAdapter<Tags> {
  @override
  final int typeId = 11;

  @override
  Tags read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Tags(
      type: fields[0] as String?,
      rootTagType: fields[1] as String?,
      name: fields[2] as String?,
      id: fields[3] as dynamic,
      displayName: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Tags obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.rootTagType)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.id)
      ..writeByte(4)
      ..write(obj.displayName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TagsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RenditionsAdapter extends TypeAdapter<Renditions> {
  @override
  final int typeId = 12;

  @override
  Renditions read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Renditions(
      maximumBitRate: fields[0] as dynamic,
      height: fields[1] as dynamic,
      container: fields[2] as String?,
      posterUrl: fields[3] as String?,
      contentType: fields[4] as String?,
      aspect: fields[5] as String?,
      width: fields[6] as dynamic,
      name: fields[7] as String?,
      fileSize: fields[8] as dynamic,
      url: fields[9] as String?,
      duration: fields[10] as dynamic,
      bitRate: fields[11] as dynamic,
      minimumBitRate: fields[12] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, Renditions obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.maximumBitRate)
      ..writeByte(1)
      ..write(obj.height)
      ..writeByte(2)
      ..write(obj.container)
      ..writeByte(3)
      ..write(obj.posterUrl)
      ..writeByte(4)
      ..write(obj.contentType)
      ..writeByte(5)
      ..write(obj.aspect)
      ..writeByte(6)
      ..write(obj.width)
      ..writeByte(7)
      ..write(obj.name)
      ..writeByte(8)
      ..write(obj.fileSize)
      ..writeByte(9)
      ..write(obj.url)
      ..writeByte(10)
      ..write(obj.duration)
      ..writeByte(11)
      ..write(obj.bitRate)
      ..writeByte(12)
      ..write(obj.minimumBitRate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RenditionsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class NutritionAdapter extends TypeAdapter<Nutrition> {
  @override
  final int typeId = 13;

  @override
  Nutrition read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Nutrition(
      fat: fields[0] as dynamic,
      calories: fields[1] as dynamic,
      sugar: fields[2] as dynamic,
      carbohydrates: fields[3] as dynamic,
      fiber: fields[4] as dynamic,
      updatedAt: fields[5] as String?,
      protein: fields[6] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, Nutrition obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.fat)
      ..writeByte(1)
      ..write(obj.calories)
      ..writeByte(2)
      ..write(obj.sugar)
      ..writeByte(3)
      ..write(obj.carbohydrates)
      ..writeByte(4)
      ..write(obj.fiber)
      ..writeByte(5)
      ..write(obj.updatedAt)
      ..writeByte(6)
      ..write(obj.protein);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NutritionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PriceAdapter extends TypeAdapter<Price> {
  @override
  final int typeId = 14;

  @override
  Price read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Price(
      total: fields[0] as dynamic,
      updatedAt: fields[1] as String?,
      portion: fields[2] as dynamic,
      consumptionTotal: fields[3] as dynamic,
      consumptionPortion: fields[4] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, Price obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.total)
      ..writeByte(1)
      ..write(obj.updatedAt)
      ..writeByte(2)
      ..write(obj.portion)
      ..writeByte(3)
      ..write(obj.consumptionTotal)
      ..writeByte(4)
      ..write(obj.consumptionPortion);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PriceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TopicsAdapter extends TypeAdapter<Topics> {
  @override
  final int typeId = 15;

  @override
  Topics read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Topics(
      name: fields[0] as String?,
      slug: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Topics obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.slug);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TopicsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserRatingsAdapter extends TypeAdapter<UserRatings> {
  @override
  final int typeId = 16;

  @override
  UserRatings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserRatings(
      countPositive: fields[0] as dynamic,
      score: fields[1] as dynamic,
      countNegative: fields[2] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, UserRatings obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.countPositive)
      ..writeByte(1)
      ..write(obj.score)
      ..writeByte(2)
      ..write(obj.countNegative);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserRatingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class InstructionsAdapter extends TypeAdapter<Instructions> {
  @override
  final int typeId = 17;

  @override
  Instructions read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Instructions(
      startTime: fields[0] as dynamic,
      appliance: fields[1] as dynamic,
      endTime: fields[2] as dynamic,
      temperature: fields[3] as dynamic,
      id: fields[4] as dynamic,
      position: fields[5] as dynamic,
      displayText: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Instructions obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.startTime)
      ..writeByte(1)
      ..write(obj.appliance)
      ..writeByte(2)
      ..write(obj.endTime)
      ..writeByte(3)
      ..write(obj.temperature)
      ..writeByte(4)
      ..write(obj.id)
      ..writeByte(5)
      ..write(obj.position)
      ..writeByte(6)
      ..write(obj.displayText);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InstructionsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CreditsAdapter extends TypeAdapter<Credits> {
  @override
  final int typeId = 18;

  @override
  Credits read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Credits(
      name: fields[0] as String?,
      type: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Credits obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreditsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
