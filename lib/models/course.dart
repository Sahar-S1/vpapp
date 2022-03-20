import 'dart:convert';

class Year {
  final int id;
  final String title;
  final int number;

  Year({
    required this.id,
    required this.title,
    required this.number,
  });

  Year copyWith({
    int? id,
    String? title,
    int? number,
  }) {
    return Year(
      id: id ?? this.id,
      title: title ?? this.title,
      number: number ?? this.number,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'number': number,
    };
  }

  factory Year.fromMap(Map<String, dynamic> map) {
    return Year(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      number: map['number']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Year.fromJson(String source) => Year.fromMap(json.decode(source));

  @override
  String toString() => 'Year(id: $id, title: $title, number: $number)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Year &&
        other.id == id &&
        other.title == title &&
        other.number == number;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ number.hashCode;
}

class Semester {
  final int id;
  final String title;
  final int number;
  final Year year;

  Semester({
    required this.id,
    required this.title,
    required this.number,
    required this.year,
  });

  Semester copyWith({
    int? id,
    String? title,
    int? number,
    Year? year,
  }) {
    return Semester(
      id: id ?? this.id,
      title: title ?? this.title,
      number: number ?? this.number,
      year: year ?? this.year,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'number': number,
      'year': year.toMap(),
    };
  }

  factory Semester.fromMap(Map<String, dynamic> map) {
    return Semester(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      number: map['number']?.toInt() ?? 0,
      year: Year.fromMap(map['year']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Semester.fromJson(String source) =>
      Semester.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Semester(id: $id, title: $title, number: $number, year: $year)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Semester &&
        other.id == id &&
        other.title == title &&
        other.number == number &&
        other.year == year;
  }

  @override
  int get hashCode {
    return id.hashCode ^ title.hashCode ^ number.hashCode ^ year.hashCode;
  }
}

class Course {
  final int id;
  final String name;
  final String code;
  final String abbr;
  final String syllabus;
  final Semester semester;
  final int departmentId;

  Course({
    required this.id,
    required this.name,
    required this.code,
    required this.abbr,
    required this.syllabus,
    required this.semester,
    required this.departmentId,
  });

  Course copyWith({
    int? id,
    String? name,
    String? code,
    String? abbr,
    String? syllabus,
    Semester? semester,
    int? departmentId,
  }) {
    return Course(
      id: id ?? this.id,
      name: name ?? this.name,
      code: code ?? this.code,
      abbr: abbr ?? this.abbr,
      syllabus: syllabus ?? this.syllabus,
      semester: semester ?? this.semester,
      departmentId: departmentId ?? this.departmentId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'code': code,
      'abbr': abbr,
      'syllabus': syllabus,
      'semester': semester.toMap(),
      'departmentId': departmentId,
    };
  }

  factory Course.fromMap(Map<String, dynamic> map) {
    return Course(
      id: map['course_id']['id']?.toInt() ?? 0,
      name: map['course_id']['name'] ?? '',
      code: map['course_id']['code'] ?? '',
      abbr: map['course_id']['abbr'] ?? '',
      syllabus: map['course_id']['syllabus'] ?? '',
      semester: Semester.fromMap(map['semester_id']),
      departmentId: map['department_id']['id']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Course.fromJson(String source) => Course.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Course(id: $id, name: $name, code: $code, abbr: $abbr, syllabus: $syllabus, semester: $semester, departmentId: $departmentId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Course &&
        other.id == id &&
        other.name == name &&
        other.code == code &&
        other.abbr == abbr &&
        other.syllabus == syllabus &&
        other.semester == semester &&
        other.departmentId == departmentId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        code.hashCode ^
        abbr.hashCode ^
        syllabus.hashCode ^
        semester.hashCode ^
        departmentId.hashCode;
  }
}
