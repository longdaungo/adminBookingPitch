

import 'package:flutter/cupertino.dart';

import 'detail_type_pitch.dart';
import 'pitch.dart';

class PitchesModel{
  final List<PitchModel> listPitches;
  PitchesModel(this.listPitches);

   static PitchesModel fetchNearestPitch(){
    return new PitchesModel(
       <PitchModel>[
        PitchModel("1","Sân nhà văn hóa", "Quận Gò Vấp","assets/images/sanbanh1.png","assets/images/DetailPitch.png", "6:00-9:00",
            "300m", 3, 4,
            1, 0, 0,
            <DetailTypePitchModel>[
              DetailTypePitchModel("Sân A","assets/images/sanbanh1.png", "Sân 5", "100 nghìn đồng", "200 nghìn đông"),
              DetailTypePitchModel("Sân B","assets/images/sanbanh2.jpg", "Sân 5", "100 nghìn đồng", "200 nghìn đông"),
              DetailTypePitchModel("Sân C","assets/images/sanbanh3.jpg", "Sân 5", "100 nghìn đồng", "200 nghìn đông"),
              DetailTypePitchModel("Sân D","assets/images/sanbanh4.jpg", "Sân 5", "100 nghìn đồng", "200 nghìn đông"),
              DetailTypePitchModel("Sân E","assets/images/sanbanh5.jpg", "Sân 7", "100 nghìn đồng", "200 nghìn đông")
            ]),
         PitchModel("2","Sân nhà vĩnh hiệp", "Quận Gò Vấp","assets/images/sanbanh2.jpg","assets/images/DetailPitch.png", "6:00-9:00",
             "200m", 2, 0,
             0, 1, 0,
             <DetailTypePitchModel>[
               DetailTypePitchModel("Sân A","assets/images/sanbanh1.png", "Sân 11", "100 nghìn đồng", "200 nghìn đông"),
             ]),
         PitchModel("3","Sân nhà hữu nhường", "Quận Gò Vấp","assets/images/sanbanh3.jpg","assets/images/DetailPitch.png", "6:00-9:00",
             "100m", 1, 2,
             0, 0, 0,
             <DetailTypePitchModel>[
               DetailTypePitchModel("Sân A","assets/images/sanbanh1.png", "Sân 5", "100 nghìn đồng", "200 nghìn đông"),
               DetailTypePitchModel("Sân B","assets/images/sanbanh1.png", "Sân 5", "100 nghìn đồng", "200 nghìn đông")
             ]),
      ]
    );
  }

  static PitchesModel fetchHighestRatePitch() {
    return new PitchesModel(
        <PitchModel>[
          PitchModel(
              "4",
              "Sân Đồng Nai",
              "Quận 10",
              "assets/images/sanbanh6.jpg",
              "assets/images/DetailPitch.png",
              "6:00-9:00",
              "2km",
              4,
              4,
              1,
              0,
              0,
              <DetailTypePitchModel>[
                DetailTypePitchModel(
                    "Sân A", "assets/images/sanbanh1.png", "Sân 5",
                    "100 nghìn đồng", "200 nghìn đông"),
                DetailTypePitchModel(
                    "Sân B", "assets/images/sanbanh2.jpg", "Sân 5",
                    "100 nghìn đồng", "200 nghìn đông"),
                DetailTypePitchModel(
                    "Sân C", "assets/images/sanbanh3.jpg", "Sân 5",
                    "100 nghìn đồng", "200 nghìn đông"),
                DetailTypePitchModel(
                    "Sân D", "assets/images/sanbanh4.jpg", "Sân 5",
                    "100 nghìn đồng", "200 nghìn đông"),
                DetailTypePitchModel(
                    "Sân E", "assets/images/sanbanh5.jpg", "Sân 7",
                    "100 nghìn đồng", "200 nghìn đông")
              ]),
          PitchModel(
              "5",
              "Sân Lê Đoàn",
              "Quận 3",
              "assets/images/sanbanh7.jpg",
              "assets/images/DetailPitch.png",
              "6:00-9:00",
              "2.5km",
              5,
              0,
              0,
              1,
              0,
              <DetailTypePitchModel>[
                DetailTypePitchModel(
                    "Sân A", "assets/images/sanbanh1.png", "Sân 11",
                    "100 nghìn đồng", "200 nghìn đông"),
              ]),
          PitchModel(
              "6",
              "Sân Thanh Tâm",
              "Quận 9",
              "assets/images/sanbanh8.jpg",
              "assets/images/DetailPitch.png",
              "6:00-9:00",
              "1km",
              5,
              2,
              0,
              0,
              0,
              <DetailTypePitchModel>[
                DetailTypePitchModel(
                    "Sân A", "assets/images/sanbanh1.png", "Sân 5",
                    "100 nghìn đồng", "200 nghìn đông"),
                DetailTypePitchModel(
                    "Sân B", "assets/images/sanbanh1.png", "Sân 5",
                    "100 nghìn đồng", "200 nghìn đông")
              ]),
        ]
    );
  }

  static PitchModel? getPitchById(String id){
       PitchesModel pitches = fetchNearestPitch();
       for(int i = 0 ; i < pitches.listPitches.length;i++){
         if(pitches.listPitches[i].id == id){
            return pitches.listPitches[i];
         }
       }
       pitches = fetchHighestRatePitch();
       for(int i = 0 ; i < pitches.listPitches.length;i++){
         if(pitches.listPitches[i].id == id){
           return pitches.listPitches[i];
         }
       }
       return null;
  }
}