import 'package:cobafluttertiga/models/m_course.dart';
import 'package:flutter/material.dart';

class KurikulumSection extends StatelessWidget {
  final List<Curriculum> kurikulum;
  const KurikulumSection({Key? key, required this.kurikulum}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < kurikulum.length; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(kurikulum[i].headerTitle!),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (int j = 0; j < kurikulum[i].content!.length; j++)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(kurikulum[i].content![j].title!),
                              Text(
                                  kurikulum[i].content![j].duration.toString()),
                              Text(kurikulum[i].content![j].type!)
                            ],
                          ),
                        )
                    ]),
              )
            ]),
          )
      ],
    );
  }
}
