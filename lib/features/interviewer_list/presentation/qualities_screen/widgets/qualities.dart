import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/color_constants.dart';
import '../../bloc/interviews_bloc.dart';

class Qualities extends StatelessWidget {
  Qualities(
      {Key? key,
      required this.quality,
      required this.isSelected,
      required this.index})
      : super(key: key);
  final String? quality;
  bool isSelected;
  final int index;

  @override
  Widget build(BuildContext context) {
    if (quality == null) {
      return const Text('');
    } else {
      return GestureDetector(
        onTap: () {
          BlocProvider.of<InterviewsBloc>(context)
              .add(ToogleQualities(index: index));
        },
        child: Container(
          margin: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            color: isSelected
                ? ColorConstants.kEnableQualityContainerColor
                : ColorConstants.kGrey,
            border: Border.all(
                color: isSelected
                    ? ColorConstants.kEnableButtonColor
                    : ColorConstants.kDisableButtonColor),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          child: Text(quality!,
              style: TextStyle(
                color: isSelected
                    ? ColorConstants.kEnableButtonColor
                    : Colors.black,
              )),
        ),
      );
    }
  }
}
