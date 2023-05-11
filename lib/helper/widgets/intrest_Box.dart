import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tap_cash/business_logic/selctor/selector_cubit.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/helper/constants/myColors.dart';


class intrestBox extends StatelessWidget {
  final title;
  final index ;

  const intrestBox({Key? key, required this.title,required this.index}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: myApplication.hightClc(15, context),
        ),
        Container(
          height: 60,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Theme.of(context).dialogBackgroundColor,
            boxShadow: [
              BoxShadow(
                color: myColors.shadow,
                blurRadius: 10,
                offset: const Offset(1, 1.5),
                spreadRadius: 10,
              )
            ],
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  title,
                  style:  TextStyle(
                    fontSize: myApplication.widthClc(16, context),
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
              BlocBuilder<SelectorCubit, SelectorState>(
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () => BlocProvider.of<SelectorCubit>(
                        context)
                        .ChangeRemember(index),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            color: SelectorCubit.check![index]
                                ? myColors.blu
                                : Colors.transparent,
                            border: Border.all(color: myColors.blu),
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: SelectorCubit.check![index]
                          ? const Icon(
                                    Icons.check,
                                    size: 15.0,
                                    color: Colors.white,
                                  )
                                : const Icon(
                                    Icons.check,
                                    size: 15.0,
                                    color: myColors.blu,
                                  ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        SizedBox(
          height: myApplication.hightClc(15, context),
        ),
      ],
    );
  }
}
