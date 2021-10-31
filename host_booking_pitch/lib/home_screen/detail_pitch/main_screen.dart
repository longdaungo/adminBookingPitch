import 'package:flutter/material.dart';
import 'package:host_booking_pitch/home_screen/detail_pitch/addVoucher.dart';
import 'package:host_booking_pitch/home_screen/detail_pitch/rate_pitch.dart';
import 'package:host_booking_pitch/home_screen/detail_pitch/title_pitches.dart';
import 'package:host_booking_pitch/models/detail_type_pitch.dart';
import 'package:host_booking_pitch/models/pitch.dart';
import 'package:host_booking_pitch/models/pitches.dart';
import 'ImageBanner.dart';
import 'button_pay.dart';
import 'detail_pitches.dart';

class MainScreenDetailPitch extends StatelessWidget{
  MainScreenDetailPitch() ;

  @override
  Widget build(BuildContext context) {
     var pitchModel= PitchesModel.getPitchById("1");
     if(pitchModel != null){

       return Scaffold(
       appBar: AppBar(

         title: Text(pitchModel.name),
         backgroundColor: Colors.green,
       ),
         body: ListView(
           scrollDirection: Axis.vertical,
           children: [
             ImageBanner(pitchModel.imgDetailPatch, Colors.grey),
             TitlePitch(10.0, 10.0, pitchModel.name,30.0),
             Padding(
              padding: EdgeInsets.only(right: 220.0, left: 5),
              child: Container(
                  child: new RaisedButton(
                child: new Text("Thêm Voucher"),
                textColor: Colors.white,
                color: Colors.pink,
                onPressed: () {
                  Navigator.of(context).pushNamed('addVoucher');
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
             RatePitch(5.0, 10.0, pitchModel.rates),
             TitlePitch(10.0, 10.0, "Các loại sân",20.0),
           ]..addAll(showDetailPitch(pitchModel)),
         )
               //RatePitch(10.0,10.0,pitchModel.rates);
           );
     }
     return Text("This pitch is not exist");
  }

  List<DetailTypePitchModel> listDetailPitchByType(PitchModel pitchModel, String typePith){
    List<DetailTypePitchModel> list = [];
    for(int i = 0; i < pitchModel.listDetailTypePitch.length; i++){
      if(pitchModel.listDetailTypePitch[i].typePitch == typePith){
        list.add(pitchModel.listDetailTypePitch[i]);
      }
    }
    return list;
  }

  Iterable<Widget> showDetailPitch (PitchModel pitchModel){
    List<Widget> list= [];
    if(pitchModel.totalPitch5 != 0){
      var listTypePitch = listDetailPitchByType(pitchModel, "Sân 5");
      list.add(TitlePitch(10.0, 10.0, "Sân 5("+pitchModel.totalPitch5.toString()+")",15.0));
      list.add(SizedBox(
        height: 300,
        child: DetailPitches(listTypePitch,pitchModel),
      ));
    }


    if(pitchModel.totalPitch7 != 0){
      var listTypePitch = listDetailPitchByType(pitchModel, "Sân 7");
      list.add(TitlePitch(10.0, 10.0, "Sân 7("+pitchModel.totalPitch7.toString()+")",15.0));
      list.add(SizedBox(
        height: 300,
        child: DetailPitches(listTypePitch, pitchModel),
      ));
    }

    if(pitchModel.totalPitch11 != 0){
      var listTypePitch = listDetailPitchByType(pitchModel, "Sân 11");
      list.add(TitlePitch(10.0, 10.0, "Sân 11("+pitchModel.totalPitch11.toString()+")",15.0));
      list.add(SizedBox(
        height: 300,
        child: DetailPitches(listTypePitch,pitchModel),
      ));
    }

    if(pitchModel.totalPitchfusan != 0){
      var listTypePitch = listDetailPitchByType(pitchModel, "Sân fusan");
      list.add(TitlePitch(10.0, 10.0, "Sân fusan("+pitchModel.totalPitchfusan.toString()+")",15.0));
      list.add(SizedBox(
        height: 300,
        child: DetailPitches(listTypePitch,pitchModel),
      ));
    }

    list.add(ButtonPay());
    return list.map((e) => e);
  }
}