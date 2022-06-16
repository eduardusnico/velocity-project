import 'package:cobafluttertiga/models/m_course.dart';
import 'package:flutter/material.dart';

class ReviewSection extends StatelessWidget {
  final List<Review> review;
  const ReviewSection({Key? key, required this.review}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('review');
  }
}
