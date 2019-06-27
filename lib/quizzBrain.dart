import 'package:quizzler/question.dart';

class QuizzBrain {
  int _indexQuestion = 0;
  bool _partieFinie = false;
  List<Question> _QuestionBank = [
    Question('Certains chats sont réellement allergiques aux humains', true),
    Question('Environ un quart des os humains sont dans les pieds.', true),
    Question('Le sang d’une limace est vert.', true),
    Question('Il est illégal de faire pipi dans l\'océan au Portugal.', true),
    Question(
        'Aucun morceau de papier sec carré ne peut être plié en deux fois plus que sept fois.',
        false),
    Question(
        'À Londres, au Royaume-Uni, si vous décédez à la Chambre des députés, vous avez techniquement droit à des funérailles nationales, car le bâtiment est considéré comme un lieu trop sacré.',
        true),
    Question(
        'Le son le plus fort produit par un animal est de 188 décibels. Cet animal est l\'éléphant d\'Afrique.',
        false),
    Question(
        'La surface totale de deux poumons humains est d\'environ 70 mètres carrés.',
        true),
    Question('Google s\'appelait à l\'origine \" Backrub \ ".', true),
    Question(
        'Le chocolat affecte le cœur et le système nerveux d’un chien; quelques onces suffisent pour tuer un petit chien.',
        true),
    Question(
        'En Virginie occidentale, États-Unis, si vous frappez accidentellement un animal avec votre voiture, vous êtes libre de l\'emporter à la maison pour le manger.',
        true),
  ];
  void nextQuestion() {
    if (_indexQuestion < _QuestionBank.length - 1) {
      print(_indexQuestion);

      _indexQuestion++;
    }
  }

  String getQuestionText() {
    return _QuestionBank[_indexQuestion].questionText;
  }

  bool getQuestionAnswer() {
    return _QuestionBank[_indexQuestion].questionAnswer;
  }

  int totalQuestion() {
    return _QuestionBank.length;
  }

  void reset() {
    _indexQuestion = 0;
  }

  bool partieFinish() {
    if (_indexQuestion >= _QuestionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }
}
