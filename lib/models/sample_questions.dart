class Question {
  final String question;
  final List<String> answers;
  final int correctAnswerIndex;

  Question({required this.question, required this.answers, required this.correctAnswerIndex});
}

List<Question> sampleQuestions = [
  Question(
    question: 'What comes next in the series: 1, 4, 9, 16, 25, ___?',
    answers: ['30', '36', '49', '64'],
    correctAnswerIndex: 1,
  ),
  Question(
    question: 'In a certain code language, "MANGO" is written as "VNMLT." How will "APPLE" be written in that code?',
    answers: ['VOGTI', 'VOHRI', 'VOHTI', 'VOITI'],
    correctAnswerIndex: 2,
  ),
  Question(
    question: 'Select the word which is opposite in meaning to "Artificial."',
    answers: ['Red', 'Natural', 'Truthful', 'Solid'],
    correctAnswerIndex: 1,
  ),
  Question(
    question: 'If the ratio of the present ages of A and B is 4:5 and after 5 years, the ratio will become 5:6, what is the present age of B?',
    answers: ['10 years', '20 years', '25 years', '30 years'],
    correctAnswerIndex: 2,
  ),
  Question(
    question: 'Pointing to a photograph, a man said, "I have no brother, and that man\'s father is my father\'s son." Whose photograph was it?',
    answers: ['His own', 'His son\'s', 'His nephew\'s', 'His cousin\'s'],
    correctAnswerIndex: 1,
  ),
  Question(
    question: 'A train 150 meters long passes a pole in 15 seconds. What is the speed of the train in km/h?',
    answers: ['36 km/h', '45 km/h', '54 km/h', '60 km/h'],
    correctAnswerIndex: 2,
  ),
  Question(
    question: 'The product of two numbers is 120 and the sum of their squares is 289. The sum of the numbers is:',
    answers: ['23', '26', '29', '34'],
    correctAnswerIndex: 1,
  ),
  Question(
    question: 'The average of first five multiples of 3 is:',
    answers: ['3', '9', '12', '15'],
    correctAnswerIndex: 1,
  ),
  Question(
    question: 'Which of the following numbers is a prime number?',
    answers: ['15', '21', '31', '44'],
    correctAnswerIndex: 2,
  ),
  Question(
    question: 'What is the smallest prime number?',
    answers: ['1', '2', '3', '5'],
    correctAnswerIndex: 1,
  ),
  Question(
    question: 'What is the capital of Japan?',
    answers: ['Beijing', 'Seoul', 'Tokyo', 'Bangkok'],
    correctAnswerIndex: 2,
  ),
  Question(
    question: 'Which planet is known as the Red Planet?',
    answers: ['Earth', 'Mars', 'Jupiter', 'Venus'],
    correctAnswerIndex: 1,
  ),
  Question(
    question: 'What is the largest ocean on Earth?',
    answers: ['Atlantic Ocean', 'Indian Ocean', 'Arctic Ocean', 'Pacific Ocean'],
    correctAnswerIndex: 3,
  ),
  Question(
    question: 'What is the chemical symbol for water?',
    answers: ['H2O', 'O2', 'CO2', 'HO2'],
    correctAnswerIndex: 0,
  ),
  Question(
    question: 'Who wrote "Romeo and Juliet"?',
    answers: ['Charles Dickens', 'Jane Austen', 'William Shakespeare', 'Mark Twain'],
    correctAnswerIndex: 2,
  ),
  Question(
    question: 'What is the boiling point of water at sea level?',
    answers: ['90°C', '100°C', '110°C', '120°C'],
    correctAnswerIndex: 1,
  ),
  Question(
    question: 'What is the sum of the angles in a triangle?',
    answers: ['90°', '180°', '270°', '360°'],
    correctAnswerIndex: 1,
  ),
  Question(
    question: 'If a car travels 60 km in 1.5 hours, what is its average speed in km/h?',
    answers: ['30 km/h', '40 km/h', '45 km/h', '60 km/h'],
    correctAnswerIndex: 2,
  ),
  Question(
    question: 'The H.C.F of 36 and 48 is:',
    answers: ['6', '8', '12', '18'],
    correctAnswerIndex: 2,
  ),
  Question(
    question: 'What is the value of π (pi) to two decimal places?',
    answers: ['3.12', '3.14', '3.16', '3.18'],
    correctAnswerIndex: 1,
  ),
];
