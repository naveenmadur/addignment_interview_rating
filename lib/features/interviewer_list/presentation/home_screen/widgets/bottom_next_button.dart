import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/color_constants.dart';

import '../../bloc/interviews_bloc.dart';

class BottomNextButton extends StatelessWidget {
  const BottomNextButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InterviewsBloc, InterviewsState>(
      builder: (context, state) {
        if (state is LoadedState) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: state.buttonActiveStatus
                  ? ColorConstants.kDisableButtonColor
                  : ColorConstants.kEnableButtonColor,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            child: GestureDetector(
              onTap: null,
              child: const Text('Next'),
            ),
          );
        } else {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorConstants.kDisableButtonColor,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            child: GestureDetector(
              onTap: null,
              child: Row(
                children: const [
                  Text('Next'),
                  Icon(Icons.chevron_right_outlined, color: ColorConstants.kDarkBlue,)
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
