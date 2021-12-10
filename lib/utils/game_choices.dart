import '../constants.dart';

const _kImagesPath = 'assets/images/';

String gameChoiceImagePath(GameChoice choice) {
  switch (choice) {
    case GameChoice.rock:
      return '${_kImagesPath}rocks.png';
    case GameChoice.paper:
      return '${_kImagesPath}paper.png';
    case GameChoice.scissors:
      return '${_kImagesPath}scissors.png';
    default:
      throw Exception('Unhandled choice case: $choice');
  }
}

String gameChoiceName(GameChoice choice) {
  switch (choice) {
    case GameChoice.rock:
      return 'rock';
    case GameChoice.paper:
      return 'paper';
    case GameChoice.scissors:
      return 'scissors';
    default:
      throw Exception('Unhandled choice case: $choice');
  }
}
