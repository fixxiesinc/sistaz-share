import 'package:sistaz_share_web/exports.dart';

/// Questions that are answered with a simple yes or no MUST have the nextQuestion field. question field is optional
/// The only exception is if the question is the last statement in the flow
///
/// All other questions MUST have the question field with nextQuestion field optional

class ChatController extends GetxController {
  static Counsellor? counsellor;

  Rx<bool> showKeyboard = false.obs;
  Rx<bool> showChatActionButtons = false.obs;

  Map<String, QuestionPoint> selfEsteemQuestions = {
    'What might be the cause of this?': QuestionPoint(
      question: 'What might be the cause of this?',
      domain: '',
      userResponses: [],
      options: [
        'Academic Issues',
        'Disapproval from Authority Figures',
        'Divorced or Emotionally Distant Parents',
      ],
    ),

    // Academic issues
    // ------------------------------------------------------------------------
    'Academic Issues': QuestionPoint(
      question: 'Do you doubt your ability to succeed?',
      domain: '',
      userResponses: [],
      options: [],
    ),
    'Do you doubt your ability to succeed?': QuestionPoint(
      question: '',
      domain: '',
      nextQuestion: 'Do you feel hesitant to engage in learning?',
      userResponses: [],
      options: ['Yes', 'No'],
    ),
    'Do you feel hesitant to engage in learning?': QuestionPoint(
      question: '',
      domain: '',
      nextQuestion: 'Do you feel insecure?',
      userResponses: [],
      options: ['Yes', 'No'],
    ),
    'Do you feel insecure?': QuestionPoint(
      question: '',
      domain: '',
      nextQuestion: 'Do you feel guilt and shame?',
      userResponses: [],
      options: ['Yes', 'No'],
    ),
    'Do you feel guilt and shame?': QuestionPoint(
      domain: '',
      question: '',
      userResponses: [],
      options: ['Yes', 'No'],
    ),

    // Divorced or Emotionally Distant Parents
    // ------------------------------------------------------------------------
    'Divorced or Emotionally Distant Parents': QuestionPoint(
      question: 'Has this made you insecure?',
      domain: '',
      userResponses: [],
      options: [],
    ),
    'Has this made you insecure?': QuestionPoint(
      question: '',
      domain: '',
      nextQuestion: 'Do you experience low self-worth?',
      userResponses: [],
      options: ['Yes', 'No'],
    ),
    'Do you experience low self-worth?': QuestionPoint(
      question: '',
      domain: '',
      nextQuestion: 'Have you had a mental health disorder?',
      userResponses: [],
      options: ['Yes', 'No'],
    ),
    'Have you had a mental health disorder?': QuestionPoint(
      question: '',
      domain: '',
      nextQuestion: 'Have you done substance abuse?',
      userResponses: [],
      options: ['Yes', 'No'],
    ),
    'Have you done substance abuse?': QuestionPoint(
      question: '',
      domain: '',
      nextQuestion: 'Are you easily distracted or have trouble focusing?',
      userResponses: [],
      options: ['Yes', 'No'],
    ),
    'Are you easily distracted or have trouble focusing?': QuestionPoint(
      question: '',
      domain: '',
      userResponses: [],
      options: ['Yes', 'No'],
    ),

    // Disapproval from Authority Figures
    // ------------------------------------------------------------------------
    'Disapproval from Authority Figures': QuestionPoint(
      question: 'Do you feel angry and or anxious?',
      domain: '',
      userResponses: [],
      options: [],
    ),
    'Do you feel angry and or anxious?': QuestionPoint(
      question: '',
      domain: '',
      nextQuestion: 'Do you experience low self-worth?',
      userResponses: [],
      options: ['Yes', 'No'],
    ),
  };

  Map<String, QuestionPoint> sexualReproductiveQuestions = {
    'What might be the cause?': QuestionPoint(
      domain: '',
      question: 'What might be the cause?',
      userResponses: [],
      options: [
        'Pregnancy scare',
        'Sexually Transmitted Infections or Disease Scare',
        'Thinking of Abortion',
        'I\'ve Been Sexually Abused',
      ],
    ),

    // Pregnancy scare
    // ------------------------------------------------------------------------
    'Pregnancy scare': QuestionPoint(
      question: 'Have you recently had unprotected sex?',
      domain: '',
      userResponses: [],
      options: [],
    ),
    'Have you recently had unprotected sex?': QuestionPoint(
      question: '',
      domain: '',
      userResponses: [],
      options: ['Yes', 'No'],
    ),

    // Sexually Transmitted Infections or Disease Scare
    // ------------------------------------------------------------------------
    'Sexually Transmitted Infections or Disease Scare': QuestionPoint(
      question: 'Have you had unprotected sex?',
      domain: '',
      userResponses: [],
      options: [],
    ),
    'Have you had unprotected sex?': QuestionPoint(
      question: '',
      domain: '',
      nextQuestion: 'Do you have many sexual partners?',
      userResponses: [],
      options: ['Yes', 'No'],
    ),
    'Do you have many sexual partners?': QuestionPoint(
      question: '',
      domain: '',
      nextQuestion: 'Were you forced to engage in any sexual activity?',
      userResponses: [],
      options: ['Yes', 'No'],
    ),
    'Were you forced to engage in any sexual activity?': QuestionPoint(
      question: '',
      domain: '',
      userResponses: [],
      options: ['Yes', 'No'],
    ),

    // Thinking of Abortion
    // ------------------------------------------------------------------------
    'Thinking of Abortion': QuestionPoint(
      question: 'Have you spoken to anyone about it?',
      domain: '',
      userResponses: [],
      options: [],
    ),
    'Have you spoken to anyone about it?': QuestionPoint(
      question: '',
      domain: '',
      userResponses: [],
      options: ['Yes', 'No'],
    ),

    // I've Been Sexually Abused
    // ------------------------------------------------------------------------
    'I\'ve Been Sexually Abused': QuestionPoint(
      question: 'Were you forced or threatened?',
      domain: '',
      userResponses: [],
      options: [],
    ),
    'Were you forced or threatened?': QuestionPoint(
      question: '',
      domain: '',
      nextQuestion: 'How many times has this happened?',
      userResponses: [],
      options: ['Yes', 'No'],
    ),
    'How many times has this happened?': QuestionPoint(
      question: '',
      domain: '',
      nextQuestion: 'Were you physically harmed in any way?',
      userResponses: [],
      options: ['Once', 'Twice', 'Thrice', 'More than three times'],
    ),
    'Were you physically harmed in any way?': QuestionPoint(
      domain: '',
      question: 'Were you physically harmed in any way?',
      userResponses: [],
      options: ['Yes', 'A little', 'No'],
    ),
  };

  Map<String, QuestionPoint> careerDevelopmentQuestions = {};

  var chats = [].obs;

  String? typedMessage;
  List<String> answers = [];
  List<String> questionsAnswered = [];

  String questionToAsk = 'Hi, how may I help you today?';

  void processChatClosure() async {
    questionToAsk =
        'Alright Janet, we will analyze your inputs and get back to you shortly';
    chats.add(const AIReply());
    showChatActionButtons(true);

    final chat = parseChatData();
    await DatabaseService.addChat(chat);
  }

  Chat parseChatData() {
    String domain = chatController.answers.removeAt(0);
    Map messages = {};

    for (var i = 0; i < chatController.answers.length; i++) {
      String question = chatController.questionsAnswered[i];
      String answer = chatController.answers[i];
      messages[question] = answer;
    }

    return Chat(
      id: DatabaseService.generateID,
      createdAt: DateTime.now().toIso8601String(),
      userID: userController.user!.id,
      counsellorID: userController.user!.preferredCounsellor,
      domain: domain,
      typedMessage: typedMessage,
      messages: messages,
    );
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
      question: 'What might be the cause of this?',
      domain: 'Self Esteem Issues',
      userResponses: [],
      options: [],
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

// - [x] Career Development Issues

// ------------------------------------------------------------------------------------------
// ------------------------------------------------------------------------------------------
// ------------------------------------------------------------------------------------------

// - [x] Career Development Issues
// * Burnout
// * Not Enough Experience
// * Lack of Confidence
// * Changes in the industry

// - Tell me

// ------------------------------------------------------------------------------------------

// - [x] + Burnout
// * Work-life Imbalance
// * Unclear Job Expectations
// * Dysfunctional Workplace Dynamics
// * Lack of Social Support

// - Tell me

// ------------------------------------------------------------------------------------------

// - [x] - Work-life Imbalance
// * Having children
// * Increased Responsibility at Work and Home
// * Working Long Hours

// - Tell me

// ------------------------------------------------------------------------------------------

// - [x] + Lack of Confidence
// * Lack of Experience
// * I’m new at the Job
// * My teammates are intimidating
// * Fear of Failure

// - Tell me

// ------------------------------------------------------------------------------------------

// - [x] - Lack of Experience
// * Imposter syndrome
// * Lack of adequate training or education in a specific area.
// * Negative feedback or criticism from peers or superiors.
// * Past failures or setbacks that have impacted self-esteem

// - Tell me

// ------------------------------------------------------------------------------------------

// - [x] - My teammates are intimidating
// * They make critical or sarcastic comments
// * They take credit for my achievements.
// *  They always respond negatively to your ideas.
// * They’re overly competitive

// - Tell me
