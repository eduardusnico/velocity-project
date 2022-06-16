import 'dart:convert';
import 'dart:developer';
import 'package:cobafluttertiga/ikhitsar_section.dart';
import 'package:cobafluttertiga/kurikulum_section.dart';
import 'package:cobafluttertiga/models/m_course.dart';
import 'package:cobafluttertiga/review_section.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({Key? key}) : super(key: key);

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  Course course = Course();
  int tabIndex = 0;
  bool isLoading = true;

  static const tabTitle = ['Ikhtisar', 'Kurikulum', 'Review'];

  @override
  void initState() {
    super.initState();
    fetchCourse();
  }

  Future<void> fetchCourse() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref('course');
    final dbCourse = await ref.get();
    course = courseFromJson(json.encode(dbCourse.value));
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading == true
        ? const Scaffold(body: Center(child: CircularProgressIndicator()))
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.grey[100],
              leading: const Icon(
                Icons.chevron_left,
                color: Colors.black87,
                size: 30,
              ),
              titleSpacing: 0,
              centerTitle: false,
              title:
                  const Text('Kelas', style: TextStyle(color: Colors.black87)),
              actions: [
                IconButton(
                  padding: const EdgeInsets.only(right: 12),
                  icon: const Icon(
                    Icons.share,
                    color: Colors.black87,
                  ),
                  onPressed: () {},
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Image.network(course.thumbnail!),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 14),
                    color: Colors.blue[800],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          course.title!,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                        Row(
                          children: [
                            iconWithText(
                                icon: Icon(Icons.star,
                                    color: Colors.amber[400], size: 18),
                                text: course.averageRating.toString()),
                            iconWithText(
                                icon: const Icon(Icons.people,
                                    color: Colors.white, size: 18),
                                text: course.totalStudent!),
                            iconWithText(
                                icon: const Icon(Icons.sailing,
                                    color: Colors.white, size: 18),
                                text: course.author!),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (int i = 0; i < 3; i++)
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                tabIndex = i;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: tabIndex == i
                                      ? const Border(
                                          bottom: BorderSide(width: 3))
                                      : null),
                              width: MediaQuery.of(context).size.width * 0.332,
                              height: 40,
                              padding: const EdgeInsets.only(top: 6),
                              child: Text(
                                tabTitle[i],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 17),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Container(
                      color: Colors.grey[100],
                      width: MediaQuery.of(context).size.width,
                      child: tabIndex == 0
                          ? IkhtisarSection(
                              ikhitsar: course.ikhtisar!,
                            )
                          : tabIndex == 1
                              ? KurikulumSection(kurikulum: course.curriculum!)
                              : ReviewSection(
                                  review: course.review!,
                                ))
                ],
              ),
            ),
            bottomNavigationBar:
                Column(mainAxisSize: MainAxisSize.min, children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Text('Rp ${course.regularPrice}'),
                    const Spacer(),
                    Text('Cashback ${course.coinCashback} koin')
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Icon(Icons.favorite_outline),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () {},
                            child: Text('gabung ke pelatihan')))
                  ],
                ),
              )
            ]),
          );
  }
}

class iconWithText extends StatelessWidget {
  final String text;
  final Widget icon;

  const iconWithText({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        const SizedBox(width: 2),
        Text(text),
        const SizedBox(width: 18)
      ],
    );
  }
}
