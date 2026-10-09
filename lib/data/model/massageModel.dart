import 'package:flutter/cupertino.dart';

class MassageModel {
  String? massageId;
  String? massage;
  String? sentAt;
  String? readAt;
  String? fromId;
  String? toId;
  int? massageType;

  /// 0 -> text, 1 -> image
  String? imageUrl;

  MassageModel({
    required this.massageId,
    required this.massage,
    required this.sentAt,
    this.readAt = "",
    required this.fromId,
    required this.toId,
    this.massageType = 0,
    this.imageUrl = "",
  });

  factory MassageModel.formDoc(Map<String, dynamic> document) {
    return MassageModel(
      massageId: document['massageId'],
      readAt: document['readAt'],
      massage: document['massage'],
      sentAt: document['sentAt'],
      fromId: document['fromId'],
      toId: document['toId'],
      massageType: document['massageType'],
      imageUrl: document['imageUrl'],
    );
  }
  Map<String,dynamic> toDoc(){
    return {
      "massageId" : massageId,
      "readAt" : readAt,
      "massage" : massage,
      "sentAt" : sentAt,
      "fromId" : fromId,
      "toId" : toId,
      "massageType" : massageType,
      "imageUrl" : imageUrl,
    };
  }
}
