import 'package:cobafluttertiga/models/m_course.dart';
import 'package:flutter/material.dart';

class IkhtisarSection extends StatelessWidget {
  final Ikhtisar ikhitsar;

  const IkhtisarSection({Key? key, required this.ikhitsar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(ikhitsar.title!),
        Text(ikhitsar.content!),
        Text(ikhitsar.tujuanUmum!),
        Text(ikhitsar.tujuanKhusus!),
        Image.network(ikhitsar.sertifikat!),
        Text(ikhitsar.sesiKonsultasi!),
      ],
    );
  }
}
