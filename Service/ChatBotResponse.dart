import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'ChatBotResponse.freezed.dart';
part 'ChatBotResponse.g.dart';

ChatBotResponse chatBotResponseFromJson(String str) => ChatBotResponse.fromJson(json.decode(str));

String chatBotResponseToJson(ChatBotResponse data) => json.encode(data.toJson());

@freezed
class ChatBotResponse with _$ChatBotResponse {
  const factory ChatBotResponse({
    required String res,
  }) = _ChatBotResponse;

  factory ChatBotResponse.fromJson(Map<String, dynamic> json) => _$ChatBotResponseFromJson(json);
}
