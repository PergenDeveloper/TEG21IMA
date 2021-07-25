import 'package:eglimpia/models/event_model.dart';

List<EventModel> events = [
  EventModel(
    image: '4.jpeg',
    title: "Recogida de residuos en arena blanca",
    description: "He creado esta campaña para que los que quieran participar"
        " en la recolección de residuos en la playa arena blanca se"
        "contacten conmigo.",
    city: "LUB",
    maxParticipants: 15,
    participants: [
      "Manuel",
      "Juliana",
      "Nicolas",
      "Bartolomé",
    ],
    dateEvent: DateTime(2021, 7, 28),
    createdBy: "Marcos Esono",
    created: DateTime(2021, 7, 23),
  ),
  EventModel(
    image: '5.jpeg',
    title: "Desatascar la basura del rio kie",
    description: "Como podreís ver, el rio kie ahora está cubierto de "
        " mucha basura, de hecho he creado esta campaña por si hay algún "
        "interado en participar. Muchas gracias",
    city: "EBI",
    maxParticipants: 15,
    participants: [
      "Maria",
      "Juana",
      "Miguel",
      "Jose",
    ],
    dateEvent: DateTime(2021, 7, 30),
    createdBy: "Marta Nchama",
    created: DateTime(2021, 7, 23),
  ),
  EventModel(
    image: '6.jpeg',
    title: "Recogida de residuos Rio Ngolo",
    description: "Hay mucha basura ubicada en el rio Ngolo, "
        "los que desean participar en la campaña pueden "
        " inscribirse.",
    city: "BAT",
    maxParticipants: 15,
    participants: [
      "Nicolas",
      "Jeremías",
      "Nguema",
      "Reina",
    ],
    dateEvent: DateTime(2021, 8, 1),
    createdBy: "Jesus Ela",
    created: DateTime(2021, 7, 22),
  ),
];
