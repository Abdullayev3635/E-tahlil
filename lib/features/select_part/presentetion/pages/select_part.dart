import 'package:etahlil/core/utils/app_constants.dart';
import 'package:etahlil/di/dependency_injection.dart';
import 'package:etahlil/features/select_part/presentetion/bloc/select_part_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectPart extends StatefulWidget {
  const SelectPart({Key? key}) : super(key: key);

  static Widget screen() => BlocProvider(
        create: (context) => di<SelectPartBloc>()..add(GetSelectPartEvent()),
        child: const SelectPart(),
      );

  @override
  _SelectPartState createState() => _SelectPartState();
}

class _SelectPartState extends State<SelectPart> {
  late SelectPartBloc _bloc;

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    _bloc = BlocProvider.of<SelectPartBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: cBackButtonColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      elevation: 2,
      insetPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 50.h),
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        color: cBackButtonColor,
        child: BlocBuilder<SelectPartBloc, SelectPartState>(
          builder: (context, state) {
            if (state is SelectPartSuccess) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  TextField(
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        hintText: 'Қидириш',
                        prefixIcon: const Icon(Icons.search),
                        contentPadding: EdgeInsets.all(20.0.sp),
                      ),
                      onChanged: (text) {
                        _bloc.add(FilterSelectPartEvent(
                            text: text, list: state.list));
                      }),
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.list.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.pop(context, {
                              "name": state.list[index].name!,
                              "id": state.list[index].id,
                            });
                          },
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 6.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: cSecondColor),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  state.list[index].name!,
                                  style: TextStyle(
                                      fontSize: 16.sp, color: cWhiteColor),
                                  maxLines: 2,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              );
            } else if (state is SelectPartLoading) {
              return SizedBox(
                child: const CupertinoActivityIndicator(),
                height: 350.h,
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
