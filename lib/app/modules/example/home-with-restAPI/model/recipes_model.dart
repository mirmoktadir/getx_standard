import 'package:hive/hive.dart';

part 'recipes_model.g.dart';

@HiveType(typeId: 1)
class Recipes {
  Recipes({
    this.count,
    this.results,
  });

  Recipes.fromJson(dynamic json) {
    count = json['count'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
  }
  @HiveField(0)
  int? count;
  @HiveField(1)
  List<Results>? results;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

@HiveType(typeId: 2)
class Results {
  Results({
    this.seoPath,
    this.brand,
    this.name,
    this.credits,
    this.canonicalId,
    this.videoId,
    this.language,
    this.prepTimeMinutes,
    this.description,
    this.videoAdContent,
    this.instructions,
    this.userRatings,
    this.videoUrl,
    this.topics,
    this.seoTitle,
    this.nutritionVisibility,
    this.country,
    this.price,
    this.nutrition,
    this.aspectRatio,
    this.renditions,
    this.keywords,
    this.tags,
    this.totalTimeMinutes,
    this.updatedAt,
    this.id,
    this.slug,
    this.servingsNounSingular,
    this.showId,
    this.compilations,
    this.inspiredByUrl,
    this.approvedAt,
    this.isShoppable,
    this.yields,
    this.originalVideoUrl,
    this.thumbnailAltText,
    this.servingsNounPlural,
    this.facebookPosts,
    this.sections,
    this.brandId,
    this.tipsAndRatingsEnabled,
    this.show,
    this.createdAt,
    this.totalTimeTier,
    this.cookTimeMinutes,
    this.promotion,
    this.numServings,
    this.buzzId,
    this.draftStatus,
    this.thumbnailUrl,
    this.isOneTop,
    this.beautyUrl,
  });

  Results.fromJson(dynamic json) {
    seoPath = json['seo_path'];
    brand = json['brand'];
    name = json['name'];
    if (json['credits'] != null) {
      credits = [];
      json['credits'].forEach((v) {
        credits?.add(Credits.fromJson(v));
      });
    }
    canonicalId = json['canonical_id'];
    videoId = json['video_id'];
    language = json['language'];
    prepTimeMinutes = json['prep_time_minutes'];
    description = json['description'];
    videoAdContent = json['video_ad_content'];
    if (json['instructions'] != null) {
      instructions = [];
      json['instructions'].forEach((v) {
        instructions?.add(Instructions.fromJson(v));
      });
    }
    userRatings = json['user_ratings'] != null
        ? UserRatings.fromJson(json['user_ratings'])
        : null;
    videoUrl = json['video_url'];
    if (json['topics'] != null) {
      topics = [];
      json['topics'].forEach((v) {
        topics?.add(Topics.fromJson(v));
      });
    }
    seoTitle = json['seo_title'];
    nutritionVisibility = json['nutrition_visibility'];
    country = json['country'];
    price = json['price'] != null ? Price.fromJson(json['price']) : null;
    nutrition = json['nutrition'] != null
        ? Nutrition.fromJson(json['nutrition'])
        : null;
    aspectRatio = json['aspect_ratio'];
    if (json['renditions'] != null) {
      renditions = [];
      json['renditions'].forEach((v) {
        renditions?.add(Renditions.fromJson(v));
      });
    }
    keywords = json['keywords'];
    if (json['tags'] != null) {
      tags = [];
      json['tags'].forEach((v) {
        tags?.add(Tags.fromJson(v));
      });
    }
    totalTimeMinutes = json['total_time_minutes'];
    updatedAt = json['updated_at'];
    id = json['id'];
    slug = json['slug'];
    servingsNounSingular = json['servings_noun_singular'];
    showId = json['show_id'];
    if (json['compilations'] != null) {
      compilations = [];
      json['compilations'].forEach((v) {
        compilations?.add(Compilations.fromJson(v));
      });
    }
    inspiredByUrl = json['inspired_by_url'];
    approvedAt = json['approved_at'];
    isShoppable = json['is_shoppable'];
    yields = json['yields'];
    originalVideoUrl = json['original_video_url'];
    thumbnailAltText = json['thumbnail_alt_text'];
    servingsNounPlural = json['servings_noun_plural'];

    if (json['sections'] != null) {
      sections = [];
      json['sections'].forEach((v) {
        sections?.add(Sections.fromJson(v));
      });
    }
    brandId = json['brand_id'];
    tipsAndRatingsEnabled = json['tips_and_ratings_enabled'];
    show = json['show'] != null ? Show.fromJson(json['show']) : null;
    createdAt = json['created_at'];
    totalTimeTier = json['total_time_tier'] != null
        ? TotalTimeTier.fromJson(json['total_time_tier'])
        : null;
    cookTimeMinutes = json['cook_time_minutes'];
    promotion = json['promotion'];
    numServings = json['num_servings'];
    buzzId = json['buzz_id'];
    draftStatus = json['draft_status'];
    thumbnailUrl = json['thumbnail_url'];
    isOneTop = json['is_one_top'];
    beautyUrl = json['beauty_url'];
  }
  @HiveField(0)
  String? seoPath;
  @HiveField(1)
  dynamic brand;
  @HiveField(2)
  String? name;
  @HiveField(3)
  List<Credits>? credits;
  @HiveField(4)
  String? canonicalId;
  @HiveField(5)
  int? videoId;
  @HiveField(6)
  String? language;
  @HiveField(7)
  int? prepTimeMinutes;
  @HiveField(8)
  String? description;
  @HiveField(9)
  String? videoAdContent;
  @HiveField(10)
  List<Instructions>? instructions;
  @HiveField(11)
  UserRatings? userRatings;
  @HiveField(12)
  String? videoUrl;
  @HiveField(13)
  List<Topics>? topics;
  @HiveField(14)
  String? seoTitle;
  @HiveField(15)
  String? nutritionVisibility;
  @HiveField(16)
  String? country;
  @HiveField(17)
  Price? price;
  @HiveField(18)
  Nutrition? nutrition;
  @HiveField(19)
  String? aspectRatio;
  @HiveField(20)
  List<Renditions>? renditions;
  @HiveField(21)
  String? keywords;
  @HiveField(22)
  List<Tags>? tags;
  @HiveField(23)
  dynamic totalTimeMinutes;
  @HiveField(24)
  int? updatedAt;
  @HiveField(25)
  int? id;
  @HiveField(26)
  String? slug;
  @HiveField(27)
  String? servingsNounSingular;
  @HiveField(28)
  int? showId;
  @HiveField(29)
  List<Compilations>? compilations;
  @HiveField(30)
  dynamic inspiredByUrl;
  @HiveField(31)
  int? approvedAt;
  @HiveField(32)
  bool? isShoppable;
  @HiveField(33)
  String? yields;
  @HiveField(34)
  String? originalVideoUrl;
  @HiveField(35)
  String? thumbnailAltText;
  @HiveField(36)
  String? servingsNounPlural;
  @HiveField(37)
  List<dynamic>? facebookPosts;
  @HiveField(38)
  List<Sections>? sections;
  @HiveField(39)
  dynamic brandId;
  @HiveField(40)
  bool? tipsAndRatingsEnabled;
  @HiveField(41)
  Show? show;
  @HiveField(42)
  int? createdAt;
  @HiveField(43)
  TotalTimeTier? totalTimeTier;
  @HiveField(44)
  int? cookTimeMinutes;
  @HiveField(45)
  String? promotion;
  @HiveField(46)
  int? numServings;
  @HiveField(47)
  dynamic buzzId;
  @HiveField(48)
  String? draftStatus;
  @HiveField(49)
  String? thumbnailUrl;
  @HiveField(50)
  bool? isOneTop;
  @HiveField(51)
  dynamic beautyUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['seo_path'] = seoPath;
    map['brand'] = brand;
    map['name'] = name;
    if (credits != null) {
      map['credits'] = credits?.map((v) => v.toJson()).toList();
    }
    map['canonical_id'] = canonicalId;
    map['video_id'] = videoId;
    map['language'] = language;
    map['prep_time_minutes'] = prepTimeMinutes;
    map['description'] = description;
    map['video_ad_content'] = videoAdContent;
    if (instructions != null) {
      map['instructions'] = instructions?.map((v) => v.toJson()).toList();
    }
    if (userRatings != null) {
      map['user_ratings'] = userRatings?.toJson();
    }
    map['video_url'] = videoUrl;
    if (topics != null) {
      map['topics'] = topics?.map((v) => v.toJson()).toList();
    }
    map['seo_title'] = seoTitle;
    map['nutrition_visibility'] = nutritionVisibility;
    map['country'] = country;
    if (price != null) {
      map['price'] = price?.toJson();
    }
    if (nutrition != null) {
      map['nutrition'] = nutrition?.toJson();
    }
    map['aspect_ratio'] = aspectRatio;
    if (renditions != null) {
      map['renditions'] = renditions?.map((v) => v.toJson()).toList();
    }
    map['keywords'] = keywords;
    if (tags != null) {
      map['tags'] = tags?.map((v) => v.toJson()).toList();
    }
    map['total_time_minutes'] = totalTimeMinutes;
    map['updated_at'] = updatedAt;
    map['id'] = id;
    map['slug'] = slug;
    map['servings_noun_singular'] = servingsNounSingular;
    map['show_id'] = showId;
    if (compilations != null) {
      map['compilations'] = compilations?.map((v) => v.toJson()).toList();
    }
    map['inspired_by_url'] = inspiredByUrl;
    map['approved_at'] = approvedAt;
    map['is_shoppable'] = isShoppable;
    map['yields'] = yields;
    map['original_video_url'] = originalVideoUrl;
    map['thumbnail_alt_text'] = thumbnailAltText;
    map['servings_noun_plural'] = servingsNounPlural;
    if (facebookPosts != null) {
      map['facebook_posts'] = facebookPosts?.map((v) => v.toJson()).toList();
    }
    if (sections != null) {
      map['sections'] = sections?.map((v) => v.toJson()).toList();
    }
    map['brand_id'] = brandId;
    map['tips_and_ratings_enabled'] = tipsAndRatingsEnabled;
    if (show != null) {
      map['show'] = show?.toJson();
    }
    map['created_at'] = createdAt;
    if (totalTimeTier != null) {
      map['total_time_tier'] = totalTimeTier?.toJson();
    }
    map['cook_time_minutes'] = cookTimeMinutes;
    map['promotion'] = promotion;
    map['num_servings'] = numServings;
    map['buzz_id'] = buzzId;
    map['draft_status'] = draftStatus;
    map['thumbnail_url'] = thumbnailUrl;
    map['is_one_top'] = isOneTop;
    map['beauty_url'] = beautyUrl;
    return map;
  }
}

@HiveType(typeId: 3)
class TotalTimeTier {
  TotalTimeTier({
    this.tier,
    this.displayTier,
  });

  TotalTimeTier.fromJson(dynamic json) {
    tier = json['tier'];
    displayTier = json['display_tier'];
  }
  @HiveField(0)
  String? tier;
  @HiveField(1)
  String? displayTier;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['tier'] = tier;
    map['display_tier'] = displayTier;
    return map;
  }
}

@HiveType(typeId: 4)
class Show {
  Show({
    this.id,
    this.name,
  });

  Show.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }
}

@HiveType(typeId: 5)
class Sections {
  Sections({
    this.components,
    this.name,
    this.position,
  });

  Sections.fromJson(dynamic json) {
    if (json['components'] != null) {
      components = [];
      json['components'].forEach((v) {
        components?.add(Components.fromJson(v));
      });
    }
    name = json['name'];
    position = json['position'];
  }
  @HiveField(0)
  List<Components>? components;
  @HiveField(1)
  dynamic name;
  @HiveField(2)
  int? position;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (components != null) {
      map['components'] = components?.map((v) => v.toJson()).toList();
    }
    map['name'] = name;
    map['position'] = position;
    return map;
  }
}

@HiveType(typeId: 6)
class Components {
  Components({
    this.ingredient,
    this.id,
    this.position,
    this.measurements,
    this.rawText,
    this.extraComment,
  });

  Components.fromJson(dynamic json) {
    ingredient = json['ingredient'] != null
        ? Ingredient.fromJson(json['ingredient'])
        : null;
    id = json['id'];
    position = json['position'];
    if (json['measurements'] != null) {
      measurements = [];
      json['measurements'].forEach((v) {
        measurements?.add(Measurements.fromJson(v));
      });
    }
    rawText = json['raw_text'];
    extraComment = json['extra_comment'];
  }
  @HiveField(0)
  Ingredient? ingredient;
  @HiveField(1)
  int? id;
  @HiveField(2)
  int? position;
  @HiveField(3)
  List<Measurements>? measurements;
  @HiveField(4)
  String? rawText;
  @HiveField(5)
  String? extraComment;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (ingredient != null) {
      map['ingredient'] = ingredient?.toJson();
    }
    map['id'] = id;
    map['position'] = position;
    if (measurements != null) {
      map['measurements'] = measurements?.map((v) => v.toJson()).toList();
    }
    map['raw_text'] = rawText;
    map['extra_comment'] = extraComment;
    return map;
  }
}

@HiveType(typeId: 7)
class Measurements {
  Measurements({
    this.quantity,
    this.id,
    this.unit,
  });

  Measurements.fromJson(dynamic json) {
    quantity = json['quantity'];
    id = json['id'];
    unit = json['unit'] != null ? Unit.fromJson(json['unit']) : null;
  }
  @HiveField(0)
  String? quantity;
  @HiveField(1)
  int? id;
  @HiveField(2)
  Unit? unit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['quantity'] = quantity;
    map['id'] = id;
    if (unit != null) {
      map['unit'] = unit?.toJson();
    }
    return map;
  }
}

@HiveType(typeId: 8)
class Unit {
  Unit({
    this.system,
    this.name,
    this.displayPlural,
    this.displaySingular,
    this.abbreviation,
  });

  Unit.fromJson(dynamic json) {
    system = json['system'];
    name = json['name'];
    displayPlural = json['display_plural'];
    displaySingular = json['display_singular'];
    abbreviation = json['abbreviation'];
  }
  @HiveField(0)
  String? system;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? displayPlural;
  @HiveField(3)
  String? displaySingular;
  @HiveField(4)
  String? abbreviation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['system'] = system;
    map['name'] = name;
    map['display_plural'] = displayPlural;
    map['display_singular'] = displaySingular;
    map['abbreviation'] = abbreviation;
    return map;
  }
}

@HiveType(typeId: 9)
class Ingredient {
  Ingredient({
    this.updatedAt,
    this.name,
    this.createdAt,
    this.displayPlural,
    this.id,
    this.displaySingular,
  });

  Ingredient.fromJson(dynamic json) {
    updatedAt = json['updated_at'];
    name = json['name'];
    createdAt = json['created_at'];
    displayPlural = json['display_plural'];
    id = json['id'];
    displaySingular = json['display_singular'];
  }
  @HiveField(0)
  int? updatedAt;
  @HiveField(1)
  String? name;
  @HiveField(2)
  int? createdAt;
  @HiveField(3)
  String? displayPlural;
  @HiveField(4)
  int? id;
  @HiveField(5)
  String? displaySingular;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['updated_at'] = updatedAt;
    map['name'] = name;
    map['created_at'] = createdAt;
    map['display_plural'] = displayPlural;
    map['id'] = id;
    map['display_singular'] = displaySingular;
    return map;
  }
}

@HiveType(typeId: 10)
class Compilations {
  Compilations({
    this.approvedAt,
    this.slug,
    this.language,
    this.thumbnailUrl,
    this.videoUrl,
    this.name,
    this.canonicalId,
    this.videoId,
    this.keywords,
    this.thumbnailAltText,
    this.draftStatus,
    this.beautyUrl,
    this.buzzId,
    this.isShoppable,
    this.description,
    this.facebookPosts,
    this.show,
    this.createdAt,
    this.id,
    this.promotion,
    this.aspectRatio,
    this.country,
  });

  Compilations.fromJson(dynamic json) {
    approvedAt = json['approved_at'];
    slug = json['slug'];
    language = json['language'];
    thumbnailUrl = json['thumbnail_url'];
    videoUrl = json['video_url'];
    name = json['name'];
    canonicalId = json['canonical_id'];
    videoId = json['video_id'];
    keywords = json['keywords'];
    thumbnailAltText = json['thumbnail_alt_text'];
    draftStatus = json['draft_status'];
    beautyUrl = json['beauty_url'];
    buzzId = json['buzz_id'];
    isShoppable = json['is_shoppable'];
    description = json['description'];

    if (json['show'] != null) {
      show = [];
      json['show'].forEach((v) {
        show?.add(Show.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    id = json['id'];
    promotion = json['promotion'];
    aspectRatio = json['aspect_ratio'];
    country = json['country'];
  }
  @HiveField(0)
  int? approvedAt;
  @HiveField(1)
  String? slug;
  @HiveField(2)
  String? language;
  @HiveField(3)
  String? thumbnailUrl;
  @HiveField(4)
  String? videoUrl;
  @HiveField(5)
  String? name;
  @HiveField(6)
  String? canonicalId;
  @HiveField(7)
  int? videoId;
  @HiveField(8)
  dynamic keywords;
  @HiveField(9)
  String? thumbnailAltText;
  @HiveField(10)
  String? draftStatus;
  @HiveField(11)
  dynamic beautyUrl;
  @HiveField(12)
  dynamic buzzId;
  @HiveField(13)
  bool? isShoppable;
  @HiveField(14)
  String? description;
  @HiveField(15)
  List<dynamic>? facebookPosts;
  @HiveField(16)
  List<Show>? show;
  @HiveField(17)
  int? createdAt;
  @HiveField(18)
  int? id;
  @HiveField(19)
  String? promotion;
  @HiveField(20)
  String? aspectRatio;
  @HiveField(21)
  String? country;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['approved_at'] = approvedAt;
    map['slug'] = slug;
    map['language'] = language;
    map['thumbnail_url'] = thumbnailUrl;
    map['video_url'] = videoUrl;
    map['name'] = name;
    map['canonical_id'] = canonicalId;
    map['video_id'] = videoId;
    map['keywords'] = keywords;
    map['thumbnail_alt_text'] = thumbnailAltText;
    map['draft_status'] = draftStatus;
    map['beauty_url'] = beautyUrl;
    map['buzz_id'] = buzzId;
    map['is_shoppable'] = isShoppable;
    map['description'] = description;
    if (facebookPosts != null) {
      map['facebook_posts'] = facebookPosts?.map((v) => v.toJson()).toList();
    }
    if (show != null) {
      map['show'] = show?.map((v) => v.toJson()).toList();
    }
    map['created_at'] = createdAt;
    map['id'] = id;
    map['promotion'] = promotion;
    map['aspect_ratio'] = aspectRatio;
    map['country'] = country;
    return map;
  }
}

@HiveType(typeId: 11)
class Tags {
  Tags({
    this.type,
    this.rootTagType,
    this.name,
    this.id,
    this.displayName,
  });

  Tags.fromJson(dynamic json) {
    type = json['type'];
    rootTagType = json['root_tag_type'];
    name = json['name'];
    id = json['id'];
    displayName = json['display_name'];
  }
  @HiveField(0)
  String? type;
  @HiveField(1)
  String? rootTagType;
  @HiveField(2)
  String? name;
  @HiveField(3)
  int? id;
  @HiveField(4)
  String? displayName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['root_tag_type'] = rootTagType;
    map['name'] = name;
    map['id'] = id;
    map['display_name'] = displayName;
    return map;
  }
}

@HiveType(typeId: 12)
class Renditions {
  Renditions({
    this.maximumBitRate,
    this.height,
    this.container,
    this.posterUrl,
    this.contentType,
    this.aspect,
    this.width,
    this.name,
    this.fileSize,
    this.url,
    this.duration,
    this.bitRate,
    this.minimumBitRate,
  });

  Renditions.fromJson(dynamic json) {
    maximumBitRate = json['maximum_bit_rate'];
    height = json['height'];
    container = json['container'];
    posterUrl = json['poster_url'];
    contentType = json['content_type'];
    aspect = json['aspect'];
    width = json['width'];
    name = json['name'];
    fileSize = json['file_size'];
    url = json['url'];
    duration = json['duration'];
    bitRate = json['bit_rate'];
    minimumBitRate = json['minimum_bit_rate'];
  }
  @HiveField(0)
  dynamic maximumBitRate;
  @HiveField(1)
  int? height;
  @HiveField(2)
  String? container;
  @HiveField(3)
  String? posterUrl;
  @HiveField(4)
  String? contentType;
  @HiveField(5)
  String? aspect;
  @HiveField(6)
  int? width;
  @HiveField(7)
  String? name;
  @HiveField(8)
  int? fileSize;
  @HiveField(9)
  String? url;
  @HiveField(10)
  int? duration;
  @HiveField(11)
  int? bitRate;
  @HiveField(12)
  dynamic minimumBitRate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['maximum_bit_rate'] = maximumBitRate;
    map['height'] = height;
    map['container'] = container;
    map['poster_url'] = posterUrl;
    map['content_type'] = contentType;
    map['aspect'] = aspect;
    map['width'] = width;
    map['name'] = name;
    map['file_size'] = fileSize;
    map['url'] = url;
    map['duration'] = duration;
    map['bit_rate'] = bitRate;
    map['minimum_bit_rate'] = minimumBitRate;
    return map;
  }
}

@HiveType(typeId: 13)
class Nutrition {
  Nutrition({
    this.fat,
    this.calories,
    this.sugar,
    this.carbohydrates,
    this.fiber,
    this.updatedAt,
    this.protein,
  });

  Nutrition.fromJson(dynamic json) {
    fat = json['fat'];
    calories = json['calories'];
    sugar = json['sugar'];
    carbohydrates = json['carbohydrates'];
    fiber = json['fiber'];
    updatedAt = json['updated_at'];
    protein = json['protein'];
  }
  @HiveField(0)
  int? fat;
  @HiveField(1)
  int? calories;
  @HiveField(2)
  int? sugar;
  @HiveField(3)
  int? carbohydrates;
  @HiveField(4)
  int? fiber;
  @HiveField(5)
  String? updatedAt;
  @HiveField(6)
  int? protein;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fat'] = fat;
    map['calories'] = calories;
    map['sugar'] = sugar;
    map['carbohydrates'] = carbohydrates;
    map['fiber'] = fiber;
    map['updated_at'] = updatedAt;
    map['protein'] = protein;
    return map;
  }
}

@HiveType(typeId: 14)
class Price {
  Price({
    this.total,
    this.updatedAt,
    this.portion,
    this.consumptionTotal,
    this.consumptionPortion,
  });

  Price.fromJson(dynamic json) {
    total = json['total'];
    updatedAt = json['updated_at'];
    portion = json['portion'];
    consumptionTotal = json['consumption_total'];
    consumptionPortion = json['consumption_portion'];
  }
  @HiveField(0)
  int? total;
  @HiveField(1)
  String? updatedAt;
  @HiveField(2)
  int? portion;
  @HiveField(3)
  int? consumptionTotal;
  @HiveField(4)
  int? consumptionPortion;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = total;
    map['updated_at'] = updatedAt;
    map['portion'] = portion;
    map['consumption_total'] = consumptionTotal;
    map['consumption_portion'] = consumptionPortion;
    return map;
  }
}

@HiveType(typeId: 15)
class Topics {
  Topics({
    this.name,
    this.slug,
  });

  Topics.fromJson(dynamic json) {
    name = json['name'];
    slug = json['slug'];
  }
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? slug;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['slug'] = slug;
    return map;
  }
}

@HiveType(typeId: 16)
class UserRatings {
  UserRatings({
    this.countPositive,
    this.score,
    this.countNegative,
  });

  UserRatings.fromJson(dynamic json) {
    countPositive = json['count_positive'];
    score = json['score'];
    countNegative = json['count_negative'];
  }
  @HiveField(0)
  dynamic countPositive;
  @HiveField(1)
  dynamic score;
  @HiveField(2)
  dynamic countNegative;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count_positive'] = countPositive;
    map['score'] = score;
    map['count_negative'] = countNegative;
    return map;
  }
}

@HiveType(typeId: 17)
class Instructions {
  Instructions({
    this.startTime,
    this.appliance,
    this.endTime,
    this.temperature,
    this.id,
    this.position,
    this.displayText,
  });

  Instructions.fromJson(dynamic json) {
    startTime = json['start_time'];
    appliance = json['appliance'];
    endTime = json['end_time'];
    temperature = json['temperature'];
    id = json['id'];
    position = json['position'];
    displayText = json['display_text'];
  }
  @HiveField(0)
  dynamic startTime;
  @HiveField(1)
  dynamic appliance;
  @HiveField(2)
  dynamic endTime;
  @HiveField(3)
  dynamic temperature;
  @HiveField(4)
  dynamic id;
  @HiveField(5)
  dynamic position;
  @HiveField(6)
  String? displayText;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['start_time'] = startTime;
    map['appliance'] = appliance;
    map['end_time'] = endTime;
    map['temperature'] = temperature;
    map['id'] = id;
    map['position'] = position;
    map['display_text'] = displayText;
    return map;
  }
}

@HiveType(typeId: 18)
class Credits {
  Credits({
    this.name,
    this.type,
  });

  Credits.fromJson(dynamic json) {
    name = json['name'];
    type = json['type'];
  }
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['type'] = type;
    return map;
  }
}
