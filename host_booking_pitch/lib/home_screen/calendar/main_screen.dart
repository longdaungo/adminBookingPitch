import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

import '../../footer_menu.dart';

class CalendarOfCustomer extends StatelessWidget {
  const CalendarOfCustomer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
          appBar: AppBar(
            title: const Text("Lịch đặt sân", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            centerTitle: true,
            backgroundColor: Colors.green,
          ),
          body: ListView(
            children: [
              BookedPitch(),
              // Text("Lịch sử đặt sân")
            ],
          ),
          backgroundColor: Colors.grey[200],
          bottomNavigationBar: FooterMenu(1),
        );
  }
}

class BookedPitch extends StatefulWidget {
  const BookedPitch({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _BookedPitchState();
}

class _BookedPitchState extends State<BookedPitch> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BookedItem("Mason Mount", "", "", "assets/images/mason_mount.png", "Khu liên hiệp thể thao TNG", "6:00-7:00","06-01-2021","Sân A","Thể loại sân 5",BookedBottomPart()),
          BookedItem("Hà Đức Jame", "", "", "assets/images/haducjame.png", "Sân bóng đá Hiệp Phú", "13:00-14:00","06-10-2021","Sân A","Thể loại 5", BookedBottomPart())
        ],
      ),
    );
  }
}

class BookedBottomPart extends StatelessWidget {
  const BookedBottomPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
        Container(
          child: Row(
            children: [             
              FlatButton(
                onPressed: () {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Từ chối đặt sân'),
                      content: CancelForm(),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'OK'),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text("Hủy", style: TextStyle(fontWeight: FontWeight.bold)),
                color: Colors.red,
                textColor: Colors.white,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class CancelForm extends StatefulWidget {
  CancelForm({Key? key}) : super(key: key);

  @override
  _CancelFormState createState() => _CancelFormState();
}

List<String> reasonList = [
  'Bảo trì sân',
  'Tạm đóng cửa',
  'Lý do khác'
];

class _CancelFormState extends State<CancelForm> {
  var selected = reasonList.elementAt(0);
  var isVisibility = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 400,
        child: SingleChildScrollView(child: Column(children: getListReason())));
  }

  List<Widget> getListReason() {
    List<Widget> reasonItemList = [];

    for (int i = 0; i < reasonList.length; i++) {
      reasonItemList.add(ListTile(
          title: Text(reasonList.elementAt(i)),
          leading: Radio(
              value: reasonList.elementAt(i),
              groupValue: selected,
              onChanged: (value) {
                setState(() {
                  selected = value.toString();
                  if ('Lý do khác' == value.toString()) {
                    isVisibility = true;
                  } else {
                    isVisibility = false;
                  }
                });
              })));
    }
    reasonItemList.add(Visibility(
        visible: isVisibility,
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Lý do bạn hủy sân',
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
            border: OutlineInputBorder(),
          ),
          maxLines: 8,
          maxLength: 500,
        )));
    return reasonItemList;
  }
}

class BookedItem extends StatefulWidget {
  var type, time, date, img, name, address, datebooking, namedetailPitch, typePitch, button;

  BookedItem(this.type, this.time, this.date, this.img, this.name, this.address, this.datebooking,this.namedetailPitch, this.typePitch, this.button,  {Key? key}) : super(key: key);

  @override
  State<BookedItem> createState() => _BookedItemState();
}

class _BookedItemState extends State<BookedItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 10, top: 15, right: 10),
        margin: const EdgeInsets.only(top: 15),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
             Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text(widget.type, style: const TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(widget.time, style: const TextStyle(color: Colors.grey)),
                    const SizedBox(width: 20),
                    Text(widget.date, style: const TextStyle(color: Colors.grey))
                  ]
              )
            ]
        ),

    GestureDetector(
    onTap:() => Navigator.of(context).pushNamed('/detailPitch'),
    child:
    Container(
    child:
            Row(
              children: [
                Image(
                  image: AssetImage(widget.img),
                  width: 100,
                  height: 100,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 15),
                  width: 255,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                          children: [
                            Text("Tên sân: ", style: TextStyle(
                                fontWeight: FontWeight.bold
                            ),
                            ),
                            Text(widget.name),
                          ]
                      ),
                      const SizedBox(height: 10),
                      Row(
                          children: [
                            Text("Sân: ", style: TextStyle(
                                fontWeight: FontWeight.bold
                            ),
                            ),
                            Text(widget.namedetailPitch),
                          ]
                      ),
                      const SizedBox(height: 10),
                      Row(
                          children: [
                            Text("Thể loại sân: ", style: TextStyle(
                                fontWeight: FontWeight.bold
                            ),
                            ),
                            Text(widget.typePitch),
                          ]
                      ),
                      const SizedBox(height: 10),
                      Row(
                          children: [
                            Text("Giờ: ", style: TextStyle(
                                fontWeight: FontWeight.bold
                            ),
                            ),
                            Text(widget.address),
                          ]
                      ),
                      const SizedBox(height: 10),
                      Row(
                          children: [
                            Text("Ngày đặt sân: ", style: TextStyle(
                                fontWeight: FontWeight.bold
                            ),
                            ),
                            Text(widget.datebooking),
                          ]
                      ),

                      const SizedBox(height: 10),
                      Row(
                          children: [
                            Text("Tiền mặt: ", style: TextStyle(
                                fontWeight: FontWeight.bold
                            ),
                            ),
                            const Text("800,000đ"),
                          ]
                      )
                    ],
                  ),
                ),
              ],
            ))),
            const Divider(color: Colors.black),
            widget.button
          ],
        ),
      );
  }
}

// class BookedBottomPart extends StatelessWidget {
//   const BookedBottomPart({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         const Text("Đã đặt", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
//         FlatButton(
//           onPressed: () {},
//           child: const Text("Hủy", style: TextStyle(fontWeight: FontWeight.bold)),
//           color: Colors.red,
//           textColor: Colors.white,
//         )
//       ],
//     );
//   }
// }

class CompleteBottomPart extends StatelessWidget {
  const CompleteBottomPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Image(
          image: AssetImage("assets/images/complete.png"),
          // width: 100,
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/ratePitch');
              },
              child: const Text("Đánh giá", style: TextStyle(fontWeight: FontWeight.bold)),
              style: OutlinedButton.styleFrom(
                primary: Colors.green,
                backgroundColor: Colors.white,
                side: const BorderSide(color: Colors.green, width: 2)
              )
            ),
            const SizedBox(width: 20),
            FlatButton(
              onPressed: () {},
              child: const Text("Đặt lại", style: TextStyle(fontWeight: FontWeight.bold)),
              color: Colors.green,
              textColor: Colors.white,
            )
          ],
        )
      ],
    );
  }
}

class CancelBottomPart extends StatelessWidget {
  const CancelBottomPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Image(
          image: AssetImage("assets/images/cancel.png"),
          // width: 100,
          height: 50,
        ),
        FlatButton(
          onPressed: () {},
          child: const Text("Đặt lại", style: TextStyle(fontWeight: FontWeight.bold)),
          color: Colors.green,
          textColor: Colors.white,
        )
      ],
    );
  }
}