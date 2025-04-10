class Question {
  final String question;
  final List<String> answers;
  final int correctAnswerIndex;

  Question({required this.question, required this.answers, required this.correctAnswerIndex});
}

List<Question> sampleQuestions = [
  Question(
    question: 'In a certain code language, "3, 5, 7, 9" is written as "3, 4, 6, 8." How will "8, 10, 12, 14" be written in that code?',
    answers: ['8, 9, 11, 13', '7, 9, 11, 13', '9, 11, 13, 15', '10, 12, 14, 16'],
    correctAnswerIndex: 0,
  ),
  Question(
    question: 'Find the next number in the series: 2, 6, 12, 20, 30, __.',
    answers: ['42', '44', '46', '48'],
    correctAnswerIndex: 0,
  ),
  Question(
    question: 'A clock shows 5:30. What is the angle between the minute and hour hands?',
    answers: ['15°', '30°', '45°', '75°'],
    correctAnswerIndex: 1,
  ),
  Question(
    question: 'In a family of six members A, B, C, D, E, and F, there are two married couples. A is a doctor married to D, who is a lawyer. E is the daughter of D. B is the engineer married to C. C has two children. F is the brother of E. Who is the engineer?',
    answers: ['A', 'B', 'C', 'D'],
    correctAnswerIndex: 1,
  ),
  Question(
    question: 'In a certain code language, "RAIL" is written as "42." How will "BIRD" be written in that code?',
    answers: ['36', '37', '38', '39'],
    correctAnswerIndex: 2,
  ),
  Question(
    question: 'Pointing to a photograph, a woman says, "This person’s brother is the only son of my grandmother." How is the woman related to the person in the photograph?',
    answers: ['Mother', 'Sister', 'Daughter', 'Aunt'],
    correctAnswerIndex: 1,
  ),
  Question(
    question: 'If all the faces of a cube are colored in different colors and then the cube is cut into smaller cubes, how many of the smaller cubes will have exactly three faces colored?',
    answers: ['4', '6', '8', '12'],
    correctAnswerIndex: 2,
  ),
  Question(
    question: 'In a row of students, A is 15th from the left and B is 20th from the right. If there are 40 students in the row, how many students are there between A and B?',
    answers: ['4', '5', '6', '7'],
    correctAnswerIndex: 1,
  ),
  Question(
    question: 'A man walks 30 meters north, then turns right and walks 20 meters. He turns right again and walks 30 meters. He then turns left and walks 10 meters. How far and in which direction is he from the starting point?',
    answers: ['10 meters East', '10 meters West', '10 meters North', '10 meters South'],
    correctAnswerIndex: 0,
  ),
  Question(
    question: 'In a certain code language, "SAND" is coded as "91" and "ROCK" is coded as "72." What will be the code for "WATER"?',
    answers: ['81', '82', '83', '84'],
    correctAnswerIndex: 1,
  ),
  Question(
    question: 'Five children are standing in a line. Rita is ahead of Geeta but behind Mona. Sarita is ahead of Mona but behind Sita. Who is standing last?',
    answers: ['Geeta', 'Mona', 'Rita', 'Sita'],
    correctAnswerIndex: 0,
  ),
  Question(
    question: 'If "APPLE" is coded as "26" and "BANANA" is coded as "40," what will be the code for "CHERRY"?',
    answers: ['56', '57', '58', '59'],
    correctAnswerIndex: 2,
  ),
  Question(
    question: 'If the word "FLAME" is coded as "EKNLD," how is the word "MOTOR" coded?',
    answers: ['NPTNS', 'KNQNU', 'LNPSV', 'KNOPS'],
    correctAnswerIndex: 1,
  ),
  Question(
    question: 'Six friends A, B, C, D, E, and F are sitting in a circle facing the center. B is between A and C. D is to the right of A. E is between F and C. Who is sitting opposite D?',
    answers: ['A', 'B', 'C', 'F'],
    correctAnswerIndex: 2,
  ),
  Question(
    question: 'If in a certain code "CAST" is written as "CDRSU," how will "WELL" be written?',
    answers: ['XFMN', 'XFMM', 'XEMM', 'XFNN'],
    correctAnswerIndex: 1,
  ),
  Question(
    question: 'Two buses start from a bus terminal with a speed of 20 km/h at an interval of 10 minutes. With what speed should a man drive his car to reach the bus terminal at the same time as the second bus?',
    answers: ['25 km/h', '30 km/h', '40 km/h', '50 km/h'],
    correctAnswerIndex: 1,
  ),
  Question(
    question: 'A man is facing northwest. He turns 90 degrees in the clockwise direction, then 135 degrees in the counter-clockwise direction. Which direction is he facing now?',
    answers: ['West', 'Southwest', 'South', 'Southeast'],
    correctAnswerIndex: 1,
  ),
  Question(
    question: 'If "P" means "×," "Q" means "÷," "R" means "+," and "S" means "−," then what is the value of 8 Q 2 R 5 S 3 P 2?',
    answers: ['5', '6', '7', '8'],
    correctAnswerIndex: 0,
  ),
  Question(
    question: 'In a class of 50 students, 18 play football and 27 play cricket. If 10 students play both the games, then how many students play neither?',
    answers: ['5', '15', '10', '18'],
    correctAnswerIndex: 1,
  ),
  Question(
    question: 'If "A" is the sister of "B," "B" is the son of "C," and "C" is the father of "D," how is D related to A?',
    answers: ['Brother', 'Father', 'Son', 'Nephew'],
    correctAnswerIndex: 0,
  ),
];
