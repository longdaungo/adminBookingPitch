
import 'package:flutter/material.dart';
import 'package:host_booking_pitch/models/detail_type_pitch.dart';
import 'package:host_booking_pitch/models/pitch.dart';

import 'detail_pitch.dart';

class DetailPitches extends StatelessWidget{
  final List<DetailTypePitchModel> detailPitchModel;
  final PitchModel pitchModel;
  DetailPitches(this.detailPitchModel, this.pitchModel);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: listPitches(),
    );
  }

  List<DetailPitch> listPitches(){
    return detailPitchModel.map((detailPitchModel) => DetailPitch(detailPitchModel.name, detailPitchModel.imgPath,
        detailPitchModel.typePitch,detailPitchModel.normalDayPrice, detailPitchModel.specialDayPrice,detailPitchModel,
        pitchModel)).toList();
  }

}