import 'package:flutter_riverpod/flutter_riverpod.dart';

enum HomeCategory { grocery, pharmacy, cookups }

final homeCategoryProvider = StateProvider<HomeCategory>(
  (ref) => HomeCategory.grocery,
);
