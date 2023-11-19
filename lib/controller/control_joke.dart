import 'package:flutter/foundation.dart';
import 'package:joke_app/models/model_joke.dart';
import 'package:joke_app/service/data_joke.dart';

class ControlJoke with ChangeNotifier, DiagnosticableTreeMixin {
  List<ModelJoke> jokes = [];
  List<ModelJoke> jokeds = [];
  late ModelJoke jokeShowing;

  loadJoke() {
    if (jokes.isNotEmpty) return;
    jokes = dataJoke.map((e) => ModelJoke.fromMap(e)).toList();
    jokeShowing = randomJoke();
  }

  ModelJoke randomJoke() {
    var item = (jokes..shuffle()).first;
    return item;
  }

  voteAndRandomJoke() {
    int index = jokes.indexOf(jokeShowing);
    if (index > -1) jokeds.add(jokes.removeAt(index));
    if (jokes.isNotEmpty) jokeShowing = randomJoke();
    notifyListeners();
  }
}
