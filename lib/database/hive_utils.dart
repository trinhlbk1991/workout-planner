import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:infitness/model/exercise.dart';
import 'package:infitness/model/set.dart';
import 'package:infitness/model/workout.dart';

class HiveUtils {
  HiveUtils._();

  static const String BOX_SETTINGS = 'settings';
  static const String BOX_WORKOUT = 'workout';

  static init() async {
    await Hive.initFlutter();

    Hive.registerAdapter<Exercise>(ExerciseAdapter());
    Hive.registerAdapter<Set>(SetAdapter());
    Hive.registerAdapter<Workout>(WorkoutAdapter());

    await Hive.openBox(BOX_SETTINGS);
    await Hive.openBox<Workout>(BOX_WORKOUT);
  }

  static Box boxSettings() => Hive.box(BOX_SETTINGS);

  static Box<Workout> boxWorkout() => Hive.box<Workout>(BOX_WORKOUT);
}
