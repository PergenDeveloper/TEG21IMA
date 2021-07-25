import 'dart:io';

import 'package:eglimpia/constants/colors.dart';
import 'package:eglimpia/data/cities.dart';
import 'package:eglimpia/models/event_model.dart';
import 'package:eglimpia/utils/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateEvent extends StatefulWidget {
  CreateEvent({Key? key}) : super(key: key);

  @override
  _CreateEventState createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  XFile? image;
  String? pathImage;
  String? title;
  String? description;
  String? city;
  int? maxPeople;
  DateTime? date;

  final cityController = TextEditingController();
  final dateController = TextEditingController();

  SharedPreferences? preferences;

  @override
  void initState() {
    super.initState();
  }

  void initPrefs() async {
    preferences = await SharedPreferences.getInstance();
  }

  void _pickImage() async {
    // Select image on gallery
    final ImagePicker _picker = ImagePicker();
    final imagePick = await _picker.pickImage(source: ImageSource.gallery);
    if (imagePick != null) {
      setState(() {
        this.image = imagePick;
      });
    }
  }

  void removeImage() {
    setState(() {
      this.image = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          "Nueva campaña",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                _imageField(),
                SizedBox(height: 20),
                _titleField(),
                SizedBox(height: 20),
                _descriptionField(),
                SizedBox(height: 20),
                _cityField(),
                SizedBox(height: 20),
                _maxPeopleField(),
                SizedBox(height: 20),
                _dateField(),
                SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: InkWell(
        onTap: _createEvent,
        child: Container(
          height: 60,
          color: Colors.blue,
          child: Center(
            child: Text(
              'Publicar campaña',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _imageField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Foto",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 10),
        this.image == null ? _buildAddImage() : _buildImage()
      ],
    );
  }

  Widget _buildAddImage() {
    return Center(
      child: InkWell(
        onTap: _pickImage,
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: ColorsTheme.grey,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Icon(
            Icons.add_a_photo,
            color: ColorsTheme.primary,
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Stack(
      children: [
        Container(
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: FileImage(
                File(this.image!.path),
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: InkWell(
            onTap: removeImage,
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: ColorsTheme.grey,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(Icons.clear),
            ),
          ),
        )
      ],
    );
  }

  Widget _titleField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Título",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 5),
        Container(
          width: double.infinity,
          height: 50,
          padding: EdgeInsets.only(right: 15, left: 15, bottom: 5),
          decoration: BoxDecoration(
            color: ColorsTheme.grey,
            borderRadius: BorderRadius.circular(5),
          ),
          child: TextField(
            textCapitalization: TextCapitalization.sentences,
            keyboardAppearance: Brightness.light,
            maxLength: 50,
            decoration: InputDecoration(
              border: InputBorder.none,
              counterText: '',
              hintText: 'Máximo 50 caracteres',
            ),
            onChanged: (value) {
              this.title = value;
            },
          ),
        ),
      ],
    );
  }

  Widget _descriptionField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 5),
        Container(
          width: double.infinity,
          height: 110,
          padding: EdgeInsets.only(right: 15, left: 15, bottom: 5),
          decoration: BoxDecoration(
            color: ColorsTheme.grey,
            borderRadius: BorderRadius.circular(5),
          ),
          child: TextField(
            keyboardAppearance: Brightness.light,
            keyboardType: TextInputType.multiline,
            textCapitalization: TextCapitalization.sentences,
            maxLines: 6,
            maxLength: 150,
            decoration: InputDecoration(
              border: InputBorder.none,
              counterText: '',
              hintText: 'Máximo 150 caracteres',
            ),
            onChanged: (value) {
              this.description = value;
            },
          ),
        ),
      ],
    );
  }

  Widget _cityField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Ciudad",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 5),
        Container(
          width: double.infinity,
          height: 50,
          padding: EdgeInsets.only(right: 15, left: 15),
          decoration: BoxDecoration(
            color: ColorsTheme.grey,
            borderRadius: BorderRadius.circular(5),
          ),
          child: TextField(
            readOnly: true,
            controller: cityController,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Elige una ciudad",
              suffixIcon: Icon(
                Icons.expand_more,
                color: Colors.black,
              ),
            ),
            onTap: () async {
              final citySelected = await showCitiesDialog(context, this.city);
              if (citySelected != null) {
                this.city = citySelected;
                cityController.text = cities[citySelected] ?? '';
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _maxPeopleField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Numero máximo de personas",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 5),
        Container(
          width: double.infinity,
          height: 50,
          padding: EdgeInsets.only(right: 15, left: 15, bottom: 5),
          decoration: BoxDecoration(
            color: ColorsTheme.grey,
            borderRadius: BorderRadius.circular(5),
          ),
          child: TextField(
            textCapitalization: TextCapitalization.sentences,
            keyboardAppearance: Brightness.light,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Número participantes",
            ),
            onChanged: (value) {
              this.maxPeople = int.tryParse(value) ?? 0;
            },
          ),
        ),
      ],
    );
  }

  Widget _dateField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Fecha",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 5),
        Container(
          width: double.infinity,
          height: 50,
          padding: EdgeInsets.only(right: 15, left: 15),
          decoration: BoxDecoration(
            color: ColorsTheme.grey,
            borderRadius: BorderRadius.circular(5),
          ),
          child: TextField(
            readOnly: true,
            controller: dateController,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Elige una fecha",
              suffixIcon: Icon(
                Icons.expand_more,
                color: Colors.black,
              ),
            ),
            onTap: () async {
              final DateFormat formatter = DateFormat.yMMMMEEEEd('es');
              final seletedDate = await showDatePicker(
                context: context,
                initialDate: this.date ?? DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime(2025, 12, 31),
                locale: Locale('es', 'ES'),
              );

              if (seletedDate != null) {
                this.date = seletedDate;
                setState(() {
                  dateController.text = formatter.format(seletedDate);
                });
              }
            },
          ),
        ),
      ],
    );
  }

  void _createEvent() async {
    if (image == null) {
      // Show dialog error image
      showErrorMessage(context, "Elige una foto de campaña");
      return;
    }

    if (title == null || title!.isEmpty) {
      // Show dialog error title
      showErrorMessage(context, "El campo título es obligatorio");
      return;
    }

    if (description == null || description!.isEmpty) {
      // Show dialog error description
      showErrorMessage(context, "El campo descripción es obligatorio");
      return;
    }

    if (city == null || city!.isEmpty) {
      // Show dialog error city
      showErrorMessage(context, "El campo ciudad es obligatorio");
      return;
    }

    if (maxPeople == null || maxPeople == 0) {
      // Show dialog error maxPeople
      showErrorMessage(context, "El campo número de personas es obligatorio");
      return;
    }

    if (date == null) {
      // Show dialog error date
      showErrorMessage(context, "El campo Fecha es obligatorio");
      return;
    }

    EasyLoading.show(maskType: EasyLoadingMaskType.custom);
    final eventCreated = EventModel(
      image: this.pathImage,
      fileImage: File(this.image!.path),
      title: this.title,
      description: this.description,
      city: this.city,
      maxParticipants: this.maxPeople,
      participants: [],
      created: DateTime.now(),
      dateEvent: date,
      createdBy: preferences?.getString("username") ?? 'Pergentino',
      isAsset: false,
    );
    Future.delayed(Duration(seconds: 1), () {
      // 5 seconds over, navigate to Page2.
      EasyLoading.dismiss();
      Navigator.pop(context, eventCreated);
    });
    //
  }
}
