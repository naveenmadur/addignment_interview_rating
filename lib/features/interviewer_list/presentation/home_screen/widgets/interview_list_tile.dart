import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/text_constants.dart';
import '../../../domain/entities/interview_list_entity.dart';
import '../../../../../core/constants/color_constants.dart';
import '../../../../../core/constants/text_styles.dart';
import '../../bloc/interviews_bloc.dart';

class InterviewListTile extends StatelessWidget {
  const InterviewListTile({Key? key, required this.index, required this.item})
      : super(key: key);
  final int index;
  final InterviewListEntity item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
        color: ColorConstants.kGrey,
        child: ListTile(
          title: Text(
            '${item.nameEntity.first} ${item.nameEntity.last}',
            style: TextStyles.kTitleTextStyle,
          ),
          subtitle: const Text('Tech Lead'),
          trailing: GestureDetector(
            onTap: () {
              BlocProvider.of<InterviewsBloc>(context)
                  .add(ToogleEvent(index: index));
              print(item.isSelected);
            },
            child: item.isSelected ? TextConstants.kAdded : TextConstants.kAdd,
          ),
        ),
      ),
    );
  }
}
