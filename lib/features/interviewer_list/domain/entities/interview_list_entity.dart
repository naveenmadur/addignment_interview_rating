import 'package:equatable/equatable.dart';

class InterviewListEntity extends Equatable {
  InterviewListEntity(
      {required this.nameEntity, required this.cell, this.isSelected = false});
  final NameEntity nameEntity;
  final String cell;
  bool isSelected;

  @override
  List<Object?> get props => [nameEntity, cell, isSelected];
}

class NameEntity extends Equatable {
  const NameEntity({
    required this.title,
    required this.first,
    required this.last,
  });
  final String title, first, last;

  @override
  List<Object?> get props => [title, first, last];
}
