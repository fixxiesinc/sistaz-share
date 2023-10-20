class Chat {
  final String id;
  final String createdAt;
  final String userID;
  final String counsellorID;
  final String domain;
  final String? typedMessage;
  final Map messages;

  Chat({
    required this.id,
    required this.createdAt,
    required this.userID,
    required this.counsellorID,
    required this.domain,
    this.typedMessage,
    required this.messages,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'created_at': createdAt,
      'user_id': userID,
      'counsellor_id': counsellorID,
      'domain': domain,
      'typed_message': typedMessage,
      'messages': messages,
    };
  }

  factory Chat.fromMap(Map<String, dynamic> map) {
    return Chat(
      id: map['id'],
      createdAt: map['created_at'],
      userID: map['user_id'],
      counsellorID: map['counsellor_id'],
      domain: map['domain'],
      typedMessage: map['typed_message'],
      messages: map['messages'],
    );
  }
}
