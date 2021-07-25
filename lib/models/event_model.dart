import 'dart:io';

class EventModel {
  String? image;
  String? title;
  String? description;
  String? city;
  int? maxParticipants;
  List<String>? participants;
  DateTime? dateEvent;
  String? createdBy;
  DateTime? created;
  File? fileImage;
  bool isAsset;

  EventModel({
    this.image,
    this.title,
    this.description,
    this.city,
    this.maxParticipants,
    this.participants,
    this.dateEvent,
    this.createdBy,
    this.created,
    this.fileImage,
    this.isAsset: true,
  });

  void addParticipant(String participant) {
    this.participants?.add(participant);
  }
}
