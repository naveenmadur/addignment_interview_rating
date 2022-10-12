import '../../domain/entities/interview_list_entity.dart';

class InterviewListModel extends InterviewListEntity {
  InterviewListModel({
    required super.nameEntity,
    required super.cell,
    super.isSelected,
  });

  factory InterviewListModel.fromJson(Map<String, dynamic> json) {
    return InterviewListModel(
      nameEntity: Name.fromJson(json['name']),
      cell: json['cell'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = Name(
            title: data['name']['title'],
            first: data['name']['first'],
            last: data['name']['last'])
        .toJson();
    data['cell'] = cell;
    return data;
  }

  @override
  List<Object?> get props => [nameEntity, cell, isSelected];
}

class Name extends NameEntity {
  const Name({
    required super.title,
    required super.first,
    required super.last,
  });

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      title: json['title'],
      first: json['first'],
      last: json['last'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['first'] = first;
    data['last'] = last;
    return data;
  }

  @override
  List<Object?> get props => [title, first, last];
}
