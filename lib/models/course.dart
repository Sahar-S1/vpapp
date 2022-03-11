import 'dart:convert';

class Year {
  final String title;
  final int number;

  Year({
    required this.title,
    required this.number,
  });

  Year copyWith({
    String? title,
    int? number,
  }) {
    return Year(
      title: title ?? this.title,
      number: number ?? this.number,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'number': number,
    };
  }

  factory Year.fromMap(Map<String, dynamic> map) {
    return Year(
      title: map['title'] ?? '',
      number: map['number']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Year.fromJson(String source) => Year.fromMap(json.decode(source));

  @override
  String toString() => 'Year(title: $title, number: $number)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Year && other.title == title && other.number == number;
  }

  @override
  int get hashCode => title.hashCode ^ number.hashCode;
}

class Semester {
  final String title;
  final int number;
  final Year year;

  Semester({
    required this.title,
    required this.number,
    required this.year,
  });

  Semester copyWith({
    String? title,
    int? number,
    Year? year,
  }) {
    return Semester(
      title: title ?? this.title,
      number: number ?? this.number,
      year: year ?? this.year,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'number': number,
      'year': year.toMap(),
    };
  }

  factory Semester.fromMap(Map<String, dynamic> map) {
    return Semester(
      title: map['title'] ?? '',
      number: map['number']?.toInt() ?? 0,
      year: Year.fromMap(map['year']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Semester.fromJson(String source) =>
      Semester.fromMap(json.decode(source));

  @override
  String toString() => 'Semester(title: $title, number: $number, year: $year)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Semester &&
        other.title == title &&
        other.number == number &&
        other.year == year;
  }

  @override
  int get hashCode => title.hashCode ^ number.hashCode ^ year.hashCode;
}

class Course {
  final String name;
  final String code;
  final String abbrivation;
  final String syllabus;
  final Semester semester;
  final int departmentId;

  Course({
    required this.name,
    required this.code,
    required this.abbrivation,
    required this.syllabus,
    required this.semester,
    required this.departmentId,
  });

  Course copyWith({
    String? name,
    String? code,
    String? abbrivation,
    String? syllabus,
    Semester? semester,
    int? departmentId,
  }) {
    return Course(
      name: name ?? this.name,
      code: code ?? this.code,
      abbrivation: abbrivation ?? this.abbrivation,
      syllabus: syllabus ?? this.syllabus,
      semester: semester ?? this.semester,
      departmentId: departmentId ?? this.departmentId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'code': code,
      'abbrivation': abbrivation,
      'syllabus': syllabus,
      'semester': semester.toMap(),
      'departmentId': departmentId,
    };
  }

  factory Course.fromMap(Map<String, dynamic> map) {
    return Course(
      name: map['name'] ?? '',
      code: map['code'] ?? '',
      abbrivation: map['abbrivation'] ?? '',
      syllabus: map['syllabus'] ?? '',
      semester: Semester.fromMap(map['semester']),
      departmentId: map['departmentId']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Course.fromJson(String source) => Course.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Course(name: $name, code: $code, abbrivation: $abbrivation, syllabus: $syllabus, semester: $semester, departmentId: $departmentId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Course &&
        other.name == name &&
        other.code == code &&
        other.abbrivation == abbrivation &&
        other.syllabus == syllabus &&
        other.semester == semester &&
        other.departmentId == departmentId;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        code.hashCode ^
        abbrivation.hashCode ^
        syllabus.hashCode ^
        semester.hashCode ^
        departmentId.hashCode;
  }
}
