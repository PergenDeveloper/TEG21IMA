import 'dart:io';
import 'package:flutter/material.dart';

import 'package:timeago/timeago.dart' as timeago;
import 'package:eglimpia/constants/colors.dart';
import 'package:eglimpia/models/event_model.dart';
import 'package:eglimpia/utils/commons.dart';

class EventPreview extends StatefulWidget {
  final EventModel? event;
  const EventPreview({Key? key, this.event}) : super(key: key);

  @override
  _EventPreviewState createState() => _EventPreviewState();
}

class _EventPreviewState extends State<EventPreview> {
  @override
  void initState() {
    super.initState();
    _setImage();
  }

  void _setImage() async {
    if (this.widget.event!.isAsset) {
      File image = await getImageFileFromAssets(this.widget.event!.image);
      this.widget.event?.fileImage = image;
    }

    if (!mounted) return;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240.0,
      margin: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: ColorsTheme.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          Expanded(child: _buildImageItem()),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "${this.widget.event?.title}",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "${timeago.format(this.widget.event!.created ?? DateTime.now(), locale: 'es')}",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Container _buildImageItem() {
    return this.widget.event!.fileImage != null
        ? Container(
            height: 130,
            decoration: BoxDecoration(
              color: ColorsTheme.grey,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              image: DecorationImage(
                image: FileImage(this.widget.event?.fileImage ?? File('')),
                fit: BoxFit.cover,
              ),
            ),
          )
        : Container(
            height: 130,
            decoration: BoxDecoration(
              color: ColorsTheme.grey,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
          );
  }
}
