// To parse this JSON data, do
//
//     final course = courseFromJson(jsonString);

import 'dart:convert';

Course courseFromJson(String str) => Course.fromJson(json.decode(str));

String courseToJson(Course data) => json.encode(data.toJson());

class Course {
  Course({
    this.author,
    this.averageRating,
    this.coinCashback,
    this.coinFlag,
    this.curriculum,
    this.id,
    this.ikhtisar,
    this.regularPrice,
    this.review,
    this.salePrice,
    this.skillYangAkanDiperoleh,
    this.slug,
    this.thumbnail,
    this.title,
    this.totalStudent,
    this.yangAkanDipelajari,
  });

  String? author;
  int? averageRating;
  int? coinCashback;
  int? coinFlag;
  List<Curriculum>? curriculum;
  int? id;
  Ikhtisar? ikhtisar;
  int? regularPrice;
  List<Review>? review;
  int? salePrice;
  String? skillYangAkanDiperoleh;
  String? slug;
  String? thumbnail;
  String? title;
  String? totalStudent;
  String? yangAkanDipelajari;

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        author: json["author"],
        averageRating: json["average_rating"],
        coinCashback: json["coin_cashback"],
        coinFlag: json["coin_flag"],
        curriculum: List<Curriculum>.from(
            json["curriculum"].map((x) => Curriculum.fromJson(x))),
        id: json["id"],
        ikhtisar: Ikhtisar.fromJson(json["ikhtisar"]),
        regularPrice: json["regular_price"],
        review:
            List<Review>.from(json["review"].map((x) => Review.fromJson(x))),
        salePrice: json["sale_price"],
        skillYangAkanDiperoleh: json["skill_yang_akan_diperoleh"],
        slug: json["slug"],
        thumbnail: json["thumbnail"],
        title: json["title"],
        totalStudent: json["total_student"],
        yangAkanDipelajari: json["yang_akan_dipelajari"],
      );

  Map<String, dynamic> toJson() => {
        "author": author,
        "average_rating": averageRating,
        "coin_cashback": coinCashback,
        "coin_flag": coinFlag,
        "curriculum": List<dynamic>.from(curriculum!.map((x) => x.toJson())),
        "id": id,
        "ikhtisar": ikhtisar!.toJson(),
        "regular_price": regularPrice,
        "review": List<dynamic>.from(review!.map((x) => x.toJson())),
        "sale_price": salePrice,
        "skill_yang_akan_diperoleh": skillYangAkanDiperoleh,
        "slug": slug,
        "thumbnail": thumbnail,
        "title": title,
        "total_student": totalStudent,
        "yang_akan_dipelajari": yangAkanDipelajari,
      };
}

class Curriculum {
  Curriculum({
    this.content,
    this.headerTitle,
  });

  List<Content>? content;
  String? headerTitle;

  factory Curriculum.fromJson(Map<String, dynamic> json) => Curriculum(
        content:
            List<Content>.from(json["content"].map((x) => Content.fromJson(x))),
        headerTitle: json["header_title"],
      );

  Map<String, dynamic> toJson() => {
        "content": List<dynamic>.from(content!.map((x) => x.toJson())),
        "header_title": headerTitle,
      };
}

class Content {
  Content({
    this.duration,
    this.title,
    this.type,
  });

  int? duration;
  String? title;
  String? type;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        duration: json["duration"],
        title: json["title"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "duration": duration,
        "title": title,
        "type": type,
      };
}

class Ikhtisar {
  Ikhtisar({
    this.content,
    this.fasilitator,
    this.instruktur,
    this.sertifikat,
    this.sesiKonsultasi,
    this.title,
    this.tujuanKhusus,
    this.tujuanUmum,
  });

  String? content;
  Fasilitator? fasilitator;
  Instruktur? instruktur;
  String? sertifikat;
  String? sesiKonsultasi;
  String? title;
  String? tujuanKhusus;
  String? tujuanUmum;

  factory Ikhtisar.fromJson(Map<String, dynamic> json) => Ikhtisar(
        content: json["content"],
        fasilitator: Fasilitator.fromJson(json["fasilitator"]),
        instruktur: Instruktur.fromJson(json["instruktur"]),
        sertifikat: json["sertifikat"],
        sesiKonsultasi: json["sesi_konsultasi"],
        title: json["title"],
        tujuanKhusus: json["tujuan_khusus"],
        tujuanUmum: json["tujuan_umum"],
      );

  Map<String, dynamic> toJson() => {
        "content": content,
        "fasilitator": fasilitator!.toJson(),
        "instruktur": instruktur!.toJson(),
        "sertifikat": sertifikat,
        "sesi_konsultasi": sesiKonsultasi,
        "title": title,
        "tujuan_khusus": tujuanKhusus,
        "tujuan_umum": tujuanUmum,
      };
}

class Fasilitator {
  Fasilitator({
    this.detail,
    this.name,
    this.thumbnail,
  });

  String? detail;
  String? name;
  String? thumbnail;

  factory Fasilitator.fromJson(Map<String, dynamic> json) => Fasilitator(
        detail: json["detail"],
        name: json["name"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "detail": detail,
        "name": name,
        "thumbnail": thumbnail,
      };
}

class Instruktur {
  Instruktur({
    this.detail,
    this.name,
  });

  String? detail;
  String? name;

  factory Instruktur.fromJson(Map<String, dynamic> json) => Instruktur(
        detail: json["detail"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "detail": detail,
        "name": name,
      };
}

class Review {
  Review({
    this.content,
    this.date,
    this.name,
  });

  String? content;
  String? date;
  String? name;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        content: json["content"],
        date: json["date"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "content": content,
        "date": date,
        "name": name,
      };
}
