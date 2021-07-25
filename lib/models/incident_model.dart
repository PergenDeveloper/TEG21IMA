class IncidentModel {
  String title;
  String description;
  String ubication;
  String status;
  String statusMessage;
  int commits;
  DateTime created;

  IncidentModel(
    this.title,
    this.description,
    this.ubication,
    this.status,
    this.statusMessage,
    this.commits,
    this.created,
  );
}
