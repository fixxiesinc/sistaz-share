import 'package:sistaz_share_web/exports.dart';

class ChatController extends GetxController {
  Map<String, QuestionPoint> selfEsteemQuestions = {
    'Divorced or Emotionally Distant Parents': QuestionPoint(
      question: 'How is it affecting you?',
      domain: 'Divorced or Emotionally Distant Parents',
      userResponses: [],
      options: [
        'Mental Health disorder like depression or substance abuse',
        'Low Self-Worth',
        'Insecurity',
        'Easily Distracted / Trouble Focusing',
      ],
    ),
  };

  Map<String, QuestionPoint> sexualReproductiveQuestions = {
    'What might be the cause?': QuestionPoint(
      question: 'What might be the cause?',
      domain: 'Sexual Reproductive Issues',
      userResponses: [],
      options: [
        'Pregnancy scare',
        'Sexually Transmitted Infections or Disease Scare',
        'Thinking of Abortion',
        'I\'ve Been Sexually Abused',
      ],
    ),
    
    'I\'ve Been Sexually Abused': QuestionPoint(
      question: 'Were you forced or threatened?',
      nextQuestion: 'How many times has this happened?',
      domain: 'I\'ve Been Sexually Abused',
      userResponses: [],
      options: ['Yes', 'No'],
    ),

    'Were you forced or threatened?': QuestionPoint(
      question: 'Were you forced or threatened?',
      nextQuestion: 'How many times has this happened?',
      domain: 'Were you forced or threatened?',
      userResponses: [],
      options: ['Yes', 'No'],
    ),

    'How many times has this happened?': QuestionPoint(
      question: 'How many times has this happened?',
      domain: 'How many times has this happened?',
      nextQuestion: 'Were you physically harmed in any way?',
      userResponses: [],
      options: ['Once', 'Twice', 'Thrice', 'More than three times'],
    ),

    'Were you physically harmed in any way?': QuestionPoint(
      question: 'Were you physically harmed in any way?',
      domain: 'Were you physically harmed in any way?',
      userResponses: [],
      options: ['Yes', 'A little', 'No'],
    ),
  };

  Map<String, QuestionPoint> careerDevelopmentQuestions = {};

  var chats = [].obs;
  var selectedDomains = [].obs;
  String questionToAsk =
      'Hi, my name is Aku, your personal digital counsellor.\nHow may I help you today?';

  void updateDomains(String value) {
    if (selectedDomains.contains(value)) {
      selectedDomains.remove(value);
    } else {
      selectedDomains.add(value);
    }

    return;
  }

  bool chatStarted = false;
  void setDomain(String domain) {
    if (domain == 'Self Esteem Issues') {
      questionPool = selfEsteemQuestions;
    } else if (domain == 'Sexual Reproductive Issues') {
      questionPool = sexualReproductiveQuestions;
    } else {
      questionPool = careerDevelopmentQuestions;
    }
  }

  Map<String, QuestionPoint> questionPool = {
    'Self Esteem Issues': QuestionPoint(
      question: 'What might be the cause?',
      domain: 'Self Esteem Issues',
      userResponses: [],
      options: [
        'Academic Issues',
        'Social Beauty Standards',
        'Religious Guilt',
        'Disapproval from Authority Figures',
        'Divorced or Emotionally Distant Parents',
      ],
    ),
    'Sexual Reproductive Issues': QuestionPoint(
      domain: 'Sexual Reproductive Issues',
      question: 'What might be the cause?',
      userResponses: [],
      options: [],
    ),
    'Career Development Issues': QuestionPoint(
      domain: 'Career Development Issues',
      question: 'What might be the cause?',
      userResponses: [],
      options: [],
    ),
  };
}

class QuestionPoint {
  final String domain;
  final String question;
  final String? nextQuestion;
  final List userResponses;
  final List options;

  QuestionPoint({
    required this.domain,
    required this.question,
    this.nextQuestion,
    required this.userResponses,
    required this.options,
  });
}

// - [x] Sexually abused
// + Were you forced or threatened?
// + How many times has this happen?
// + Were you physically harmed in any way?

// If anything, what do you remember during the incident?
// - Tell me




// - [x] Career Development Issues
// * Burnout
// * Not Enough Experience
// * Lack of Confidence
// * Changes in the industry

// - Tell me

// - [x] Burnout
// * Work-life Imbalance
// * Unclear Job Expectations
// * Dysfunctional Workplace Dynamics
// * Lack of Social Support

// - Tell me

// - [x] Work-life Imbalance
// * Having children
// * Increased Responsibility at Work and Home
// * Working Long Hours

// - Tell me