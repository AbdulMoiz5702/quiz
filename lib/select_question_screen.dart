import 'package:flutter/material.dart';
import 'package:quiz/custom_Button.dart';
import 'package:quiz/question_screen.dart';
import 'package:quiz/text_widgets.dart';



class QuizScreen extends StatefulWidget {
  final QuizType quizType;

  QuizScreen(this.quizType);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  final List<List<Map<String, dynamic>>>  _quizData =   [
    [ // Multiple Choice Quiz
      {
        'question': 'What is the capital of France?',
        'options': ['London', 'Paris', 'Berlin', 'Rome'],
        'correctAnswer': 'Paris',
      },
      {
        'question': 'What is the largest planet in our solar system?',
        'options': ['Venus', 'Mars', 'Jupiter', 'Saturn'],
        'correctAnswer': 'Jupiter',
      },
      {
        'question': 'What is the capital of Japan?',
        'options': ['Tokyo', 'Seoul', 'Beijing', 'Bangkok'],
        'correctAnswer': 'Tokyo',
      },
      {
        'question': 'Which country is known as the Land of the Rising Sun?',
        'options': ['China', 'India', 'Japan', 'Thailand'],
        'correctAnswer': 'Japan',
      },
      {
        'question': 'Which is the largest ocean on Earth?',
        'options': ['Atlantic Ocean', 'Indian Ocean', 'Arctic Ocean', 'Pacific Ocean'],
        'correctAnswer': 'Pacific Ocean',
      },
      {
        'question': 'What is the chemical symbol for gold?',
        'options': ['Ag', 'Au', 'Pb', 'Fe'],
        'correctAnswer': 'Au',
      },
      {
        'question': 'What is the tallest mountain in the world?',
        'options': ['Mount Everest', 'K2', 'Kangchenjunga', 'Lhotse'],
        'correctAnswer': 'Mount Everest',
      },
      {
        'question': 'Which planet is known as the Red Planet?',
        'options': ['Mars', 'Venus', 'Jupiter', 'Mercury'],
        'correctAnswer': 'Mars',
      },
      {
        'question': 'What is the national animal of Australia?',
        'options': ['Kangaroo', 'Koala', 'Emu', 'Platypus'],
        'correctAnswer': 'Kangaroo',
      },
      {
        'question': 'Who wrote the play "Romeo and Juliet"?',
        'options': ['William Shakespeare', 'Jane Austen', 'Leo Tolstoy', 'Charles Dickens'],
        'correctAnswer': 'William Shakespeare',
      },
      {
        'question': 'What is the chemical symbol for water?',
        'options': ['H2O', 'CO2', 'O2', 'N2'],
        'correctAnswer': 'H2O',
      },
      {
        'question': 'What is the largest organ in the human body?',
        'options': ['Brain', 'Liver', 'Heart', 'Skin'],
        'correctAnswer': 'Skin',
      },
      {
        'question': 'Which country is known as the Land of the Midnight Sun?',
        'options': ['Sweden', 'Norway', 'Finland', 'Denmark'],
        'correctAnswer': 'Norway',
      },
      {
        'question': 'What is the capital of Italy?',
        'options': ['Madrid', 'Paris', 'Rome', 'Athens'],
        'correctAnswer': 'Rome',
      },
      {
        'question': 'What is the chemical symbol for oxygen?',
        'options': ['O', 'O2', 'CO2', 'H2O'],
        'correctAnswer': 'O',
      },
      {
        'question': 'Who painted the Mona Lisa?',
        'options': ['Leonardo da Vinci', 'Vincent van Gogh', 'Pablo Picasso', 'Michelangelo'],
        'correctAnswer': 'Leonardo da Vinci',
      },
      {
        'question': 'What is the smallest bone in the human body?',
        'options': ['Femur', 'Tibia', 'Stapes', 'Humerus'],
        'correctAnswer': 'Stapes',
      },
      {
        'question': 'Which gas is most abundant in Earth\'s atmosphere?',
        'options': ['Nitrogen', 'Oxygen', 'Carbon Dioxide', 'Argon'],
        'correctAnswer': 'Nitrogen',
      },
      {
        'question': 'Who discovered gravity?',
        'options': ['Albert Einstein', 'Isaac Newton', 'Galileo Galilei', 'Nikola Tesla'],
        'correctAnswer': 'Isaac Newton',
      },
      {
        'question': 'Which is the largest bird in the world?',
        'options': ['Ostrich', 'Emu', 'Albatross', 'Condor'],
        'correctAnswer': 'Ostrich',
      },
    ],
    [ // Fill in the Blank Quiz
      {
        'question': 'Fill in the blank: The ___ Tower is located in Pisa, Italy.',
        'correctAnswer': 'Leaning',
      },
      {
        'question': 'Fill in the blank: The ____ Nile is the longest river in the world.',
        'correctAnswer': 'Nile',
      },
      {
        'question': 'Fill in the blank: The ___ of Liberty is a symbol of freedom in the United States.',
        'correctAnswer': 'Statue',
      },
      {
        'question': 'Fill in the blank: The ___ Wall of China is one of the seven wonders of the world.',
        'correctAnswer': 'Great',
      },
      {
        'question': 'Fill in the blank: The ___ Sea is the largest sea in the world.',
        'correctAnswer': 'Mediterranean',
      },
      {
        'question': 'Fill in the blank: The ___ Ocean is the smallest ocean in the world.',
        'correctAnswer': 'Arctic',
      },
      {
        'question': 'Fill in the blank: The ___ of the Rings is a famous fantasy novel series by J.R.R. Tolkien.',
        'correctAnswer': 'Lord',
      },
      {
        'question': 'Fill in the blank: The ___ Panther is a superhero character from Marvel Comics.',
        'correctAnswer': 'Black',
      },
      {
        'question': 'Fill in the blank: The ___ Desert is the largest hot desert in the world.',
        'correctAnswer': 'Sahara',
      },
      {
        'question': 'Fill in the blank: The ___ of Liberty is located in New York Harbor.',
        'correctAnswer': 'Statue',
      },
      {
        'question': 'Fill in the blank: The ___ Ocean is the deepest ocean in the world.',
        'correctAnswer': 'Pacific',
      },
      {
        'question': 'Fill in the blank: The ___ Canal connects the Mediterranean Sea to the Red Sea.',
        'correctAnswer': 'Suez',
      },
      {
        'question': 'Fill in the blank: The ___ Mountains are the longest mountain range in the world.',
        'correctAnswer': 'Andes',
      },
      {
        'question': 'Fill in the blank: The ___ of Versailles is a famous palace in France.',
        'correctAnswer': 'Palace',
      },
      {
        'question': 'Fill in the blank: The ___ Ocean is the second-largest ocean in the world.',
        'correctAnswer': 'Atlantic',
      },
      {
        'question': 'Fill in the blank: The ___ of Independence was signed in 1776.',
        'correctAnswer': 'Declaration',
      },
      {
        'question': 'Fill in the blank: The ___ Gate Bridge is located in San Francisco, California.',
        'correctAnswer': 'Golden',
      },
      {
        'question': 'Fill in the blank: The ___ of the Rings film series is based on the novels by J.R.R. Tolkien.',
        'correctAnswer': 'Lord',
      },
      {
        'question': 'Fill in the blank: The ___ of London is a historic castle located on the north bank of the River Thames.',
        'correctAnswer': 'Tower',
      },
      {
        'question': 'Fill in the blank: The ___ of the United States is the head of state and government.',
        'correctAnswer': 'President',
      },
      {
        'question': 'Fill in the blank: The ___ of Rome is a famous ancient arena.',
        'correctAnswer': 'Colosseum',
      },
      {
        'question': 'Fill in the blank: The ___ Ocean is the third-largest ocean in the world.',
        'correctAnswer': 'Indian',
      },
      {
        'question': 'Fill in the blank: The ___ Wall is a defensive wall built by the Romans in England.',
        'correctAnswer': 'Hadrian\'s',
      },
      {
        'question': 'Fill in the blank: The ___ River is the longest river in South America.',
        'correctAnswer': 'Amazon',
      },
      {
        'question': 'Fill in the blank: The ___ of Liberty was a gift from France to the United States.',
        'correctAnswer': 'Statue',
      },
      {
        'question': 'Fill in the blank: The ___ of the Rings: The Fellowship of the Ring is the first film in the trilogy.',
        'correctAnswer': 'Lord',
      },
      {
        'question': 'Fill in the blank: The ___ Ocean is the warmest ocean in the world.',
        'correctAnswer': 'Indian',
      },
      {
        'question': 'Fill in the blank: The ___ of Independence proclaimed the independence of the United States from Great Britain.',
        'correctAnswer': 'Declaration',
      },
      {
        'question': 'Fill in the blank: The ___ Canal connects the Atlantic Ocean to the Pacific Ocean.',
        'correctAnswer': 'Panama',
      },
      {
        'question': 'Fill in the blank: The ___ of Versailles was signed in 1919 and marked the end of World War I.',
        'correctAnswer': 'Treaty',
      },
      {
        'question': 'Fill in the blank: The ___ of London is a famous clock tower in London.',
        'correctAnswer': 'Big Ben',
      },
      {
        'question': 'Fill in the blank: The ___ Ocean is the second-largest ocean in the world.',
        'correctAnswer': 'Atlantic',
      },
    ],
    [ // Matching Quiz
      {
        'question': 'Match the countries with their continents.',
        'options': {
          'Japan': 'Asia',
          'Australia': 'Australia',
          'Brazil': 'South America',
          'France': 'Europe',
        },
        'correctAnswers': {
          'Japan': 'Asia',
          'Australia': 'Australia',
          'Brazil': 'South America',
          'France': 'Europe',
        },
      },
      {
        'question': 'Match the colors with their hex codes.',
        'options': {
          'Red': '#FF0000',
          'Green': '#00FF00',
          'Blue': '#0000FF',
          'Yellow': '#FFFF00',
        },
        'correctAnswers': {
          'Red': '#FF0000',
          'Green': '#00FF00',
          'Blue': '#0000FF',
          'Yellow': '#FFFF00',
        },
      },
      {
        'question': 'Match the elements with their symbols.',
        'options': {
          'Hydrogen': 'H',
          'Oxygen': 'O',
          'Carbon': 'C',
          'Nitrogen': 'N',
        },
        'correctAnswers': {
          'Hydrogen': 'H',
          'Oxygen': 'O',
          'Carbon': 'C',
          'Nitrogen': 'N',
        },
      },
      {
        'question': 'Match the programming languages with their creators.',
        'options': {
          'Python': 'Guido van Rossum',
          'Java': 'James Gosling',
          'C++': 'Bjarne Stroustrup',
          'JavaScript': 'Brendan Eich',
        },
        'correctAnswers': {
          'Python': 'Guido van Rossum',
          'Java': 'James Gosling',
          'C++': 'Bjarne Stroustrup',
          'JavaScript': 'Brendan Eich',
        },
      },
      {
        'question': 'Match the planets with their moons.',
        'options': {
          'Earth': 'Moon',
          'Mars': 'Phobos',
          'Jupiter': 'Europa',
          'Saturn': 'Titan',
        },
        'correctAnswers': {
          'Earth': 'Moon',
          'Mars': 'Phobos',
          'Jupiter': 'Europa',
          'Saturn': 'Titan',
        },
      },
      {
        'question': 'Match the US states with their capitals.',
        'options': {
          'California': 'Sacramento',
          'Texas': 'Austin',
          'New York': 'Albany',
          'Florida': 'Tallahassee',
        },
        'correctAnswers': {
          'California': 'Sacramento',
          'Texas': 'Austin',
          'New York': 'Albany',
          'Florida': 'Tallahassee',
        },
      },
      {
        'question': 'Match the musical instruments with their families.',
        'options': {
          'Violin': 'Strings',
          'Trumpet': 'Brass',
          'Flute': 'Woodwinds',
          'Drums': 'Percussion',
        },
        'correctAnswers': {
          'Violin': 'Strings',
          'Trumpet': 'Brass',
          'Flute': 'Woodwinds',
          'Drums': 'Percussion',
        },
      },
      {
        'question': 'Match the famous landmarks with their locations.',
        'options': {
          'Eiffel Tower': 'Paris',
          'Great Wall of China': 'China',
          'Statue of Liberty': 'New York',
          'Pyramids of Giza': 'Egypt',
        },
        'correctAnswers': {
          'Eiffel Tower': 'Paris',
          'Great Wall of China': 'China',
          'Statue of Liberty': 'New York',
          'Pyramids of Giza': 'Egypt',
        },
      },
      {
        'question': 'Match the fruits with their colors.',
        'options': {
          'Apple': 'Red',
          'Banana': 'Yellow',
          'Blueberry': 'Blue',
          'Orange': 'Orange',
        },
        'correctAnswers': {
          'Apple': 'Red',
          'Banana': 'Yellow',
          'Blueberry': 'Blue',
          'Orange': 'Orange',
        },
      },
      {
        'question': 'Match the scientists with their discoveries.',
        'options': {
          'Isaac Newton': 'Law of Universal Gravitation',
          'Albert Einstein': 'Theory of Relativity',
          'Marie Curie': 'Radioactivity',
          'Charles Darwin': 'Theory of Evolution',
        },
        'correctAnswers': {
          'Isaac Newton': 'Law of Universal Gravitation',
          'Albert Einstein': 'Theory of Relativity',
          'Marie Curie': 'Radioactivity',
          'Charles Darwin': 'Theory of Evolution',
        },
      },
      {
        'question': 'Match the sports with their equipment.',
        'options': {
          'Basketball': 'Basket',
          'Soccer': 'Football',
          'Golf': 'Club',
          'Tennis': 'Racket',
        },
        'correctAnswers': {
          'Basketball': 'Basket',
          'Soccer': 'Football',
          'Golf': 'Club',
          'Tennis': 'Racket',
        },
      },
      {
        'question': 'Match the US presidents with their terms.',
        'options': {
          'George Washington': '1st',
          'Abraham Lincoln': '16th',
          'Franklin D. Roosevelt': '32nd',
          'Barack Obama': '44th',
        },
        'correctAnswers': {
          'George Washington': '1st',
          'Abraham Lincoln': '16th',
          'Franklin D. Roosevelt': '32nd',
          'Barack Obama': '44th',
        },
      },
      {
        'question': 'Match the car brands with their countries of origin.',
        'options': {
          'Toyota': 'Japan',
          'Ford': 'United States',
          'BMW': 'Germany',
          'Ferrari': 'Italy',
        },
        'correctAnswers': {
          'Toyota': 'Japan',
          'Ford': 'United States',
          'BMW': 'Germany',
          'Ferrari': 'Italy',
        },
      },
      {
        'question': 'Match the months with their number of days.',
        'options': {
          'January': '31',
          'February': '28',
          'March': '31',
          'April': '30',
        },
        'correctAnswers': {
          'January': '31',
          'February': '28',
          'March': '31',
          'April': '30',
        },
      },
      {
        'question': 'Match the composers with their compositions.',
        'options': {
          'Ludwig van Beethoven': 'Symphony No. 9',
          'Wolfgang Amadeus Mozart': 'Eine kleine Nachtmusik',
          'Johann Sebastian Bach': 'Brandenburg Concertos',
          'Pyotr Ilyich Tchaikovsky': 'Swan Lake',
        },
        'correctAnswers': {
          'Ludwig van Beethoven': 'Symphony No. 9',
          'Wolfgang Amadeus Mozart': 'Eine kleine Nachtmusik',
          'Johann Sebastian Bach': 'Brandenburg Concertos',
          'Pyotr Ilyich Tchaikovsky': 'Swan Lake',
        },
      },
      {
        'question': 'Match the currencies with their countries.',
        'options': {
          'Euro': 'European Union',
          'Yen': 'Japan',
          'Pound Sterling': 'United Kingdom',
          'Dollar': 'United States',
        },
        'correctAnswers': {
          'Euro': 'European Union',
          'Yen': 'Japan',
          'Pound Sterling': 'United Kingdom',
          'Dollar': 'United States',
        },
      },
      {
        'question': 'Match the composers with their musical eras.',
        'options': {
          'Wolfgang Amadeus Mozart': 'Classical',
          'Ludwig van Beethoven': 'Romantic',
          'Johann Sebastian Bach': 'Baroque',
          'Claude Debussy': 'Impressionist',
        },
        'correctAnswers': {
          'Wolfgang Amadeus Mozart': 'Classical',
          'Ludwig van Beethoven': 'Romantic',
          'Johann Sebastian Bach': 'Baroque',
          'Claude Debussy': 'Impressionist',
        },
      },
      {
        'question': 'Match the authors with their famous works.',
        'options': {
          'William Shakespeare': 'Romeo and Juliet',
          'Jane Austen': 'Pride and Prejudice',
          'Leo Tolstoy': 'War and Peace',
          'Mark Twain': 'Adventures of Huckleberry Finn',
        },
        'correctAnswers': {
          'William Shakespeare': 'Romeo and Juliet',
          'Jane Austen': 'Pride and Prejudice',
          'Leo Tolstoy': 'War and Peace',
          'Mark Twain': 'Adventures of Huckleberry Finn',
        },
      },
      {
        'question': 'Match the movie titles with their directors.',
        'options': {
          'The Godfather': 'Francis Ford Coppola',
          'Titanic': 'James Cameron',
          'Inception': 'Christopher Nolan',
          'Forrest Gump': 'Robert Zemeckis',
        },
        'correctAnswers': {
          'The Godfather': 'Francis Ford Coppola',
          'Titanic': 'James Cameron',
          'Inception': 'Christopher Nolan',
          'Forrest Gump': 'Robert Zemeckis',
        },
      },
      {
        'question': 'Match the composers with their nationalities.',
        'options': {
          'Ludwig van Beethoven': 'German',
          'Wolfgang Amadeus Mozart': 'Austrian',
          'Johann Sebastian Bach': 'German',
          'Pyotr Ilyich Tchaikovsky': 'Russian',
        },
        'correctAnswers': {
          'Ludwig van Beethoven': 'German',
          'Wolfgang Amadeus Mozart': 'Austrian',
          'Johann Sebastian Bach': 'German',
          'Pyotr Ilyich Tchaikovsky': 'Russian',
        },
      },
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: largeText(title: 'Quiz'),
      ),
      body: _currentQuestionIndex < _quizData[widget.quizType.index].length
          ? _buildQuestionPage()
          : _buildResultPage(),
    );
  }

  Widget _buildQuestionPage() {
    final question = _quizData[widget.quizType.index][_currentQuestionIndex];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child:normalText(title: 'Question ${_currentQuestionIndex + 1} : ${question['question']}',),
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
        widget.quizType == QuizType.multipleChoice
            ? _buildMultipleChoiceOptions(question['options'])
            : widget.quizType == QuizType.fillInTheBlank
            ? _buildFillInTheBlankField()
            : _buildMatchingOptions(question['options']),
      ],
    );
  }

  Widget _buildMultipleChoiceOptions(List<String> options) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: options.map((option) {
        return Container(
          margin:const EdgeInsets.all(8 ),
            child: Center(child: CustomButton(title: option,onTap: ()=>_checkMultipleChoiceAnswer(option),)));
      }).toList(),
    );
  }

  Widget _buildFillInTheBlankField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Enter Your Answer',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onSubmitted: _checkFillInTheBlankAnswer,
      ),
    );
  }

  Widget _buildMatchingOptions(Map<String, String> options) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: options.keys.map((key) {
        return Center(
          child: Container(
            margin:const  EdgeInsets.all(10),
              child: CustomButton(title: key,onTap: ()=>_checkMatchingAnswer(key, options[key]!),)),
        );
      }).toList(),
    );
  }

  void _checkMultipleChoiceAnswer(String selectedOption) {
    final question = _quizData[widget.quizType.index][_currentQuestionIndex];
    final correctAnswer = question['correctAnswer'] as String;
    if (selectedOption == correctAnswer) {
      setState(() {
        _score++;
      });
    }
    _moveToNextQuestion();
  }

  void _checkFillInTheBlankAnswer(String answer) {
    final question = _quizData[widget.quizType.index][_currentQuestionIndex];
    final correctAnswer = question['correctAnswer'] as String;
    if (answer.toLowerCase() == correctAnswer.toLowerCase()) {
      setState(() {
        _score++;
      });
    }
    _moveToNextQuestion();
  }

  void _checkMatchingAnswer(String country, String capital) {
    final question = _quizData[widget.quizType.index][_currentQuestionIndex];
    final correctAnswers = question['correctAnswers'] as Map<String, String>;
    if (correctAnswers[country] == capital) {
      setState(() {
        _score++;
      });
    }
    _moveToNextQuestion();
  }

  void _moveToNextQuestion() {
    setState(() {
      _currentQuestionIndex++;
    });
  }

  Widget _buildResultPage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          largeText(title: 'Quiz Completed!',fontSize:16.0),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
          normalText(title: 'Your Score: $_score/${_quizData[widget.quizType.index].length}'),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
          CustomButton(title: 'other quiz !', onTap: (){
            Navigator.pop(context);
          })
        ],
      ),
    );
  }
}
