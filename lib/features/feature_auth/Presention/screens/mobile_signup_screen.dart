import 'package:flutter/material.dart';
import 'package:android_sms_retriever/android_sms_retriever.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_application/common/params/signup_params.dart';
import 'package:flutter_shopping_application/common/utills/prefs_operator.dart';
import 'package:flutter_shopping_application/common/widgets/dot_loading_widget.dart';
import 'package:flutter_shopping_application/features/feature_auth/Presention/bloc/call_status_data.dart';
import 'package:flutter_shopping_application/features/feature_auth/Presention/bloc/signup_bloc.dart';
import 'package:flutter_shopping_application/features/feature_auth/Presention/bloc/signup_data_status.dart';
import 'package:flutter_shopping_application/features/feature_auth/Presention/bloc/signup_event.dart';
import 'package:flutter_shopping_application/features/feature_auth/Presention/bloc/signup_state.dart';
import 'package:flutter_shopping_application/features/feature_auth/Presention/screens/mobile_login_screen.dart';
import 'package:flutter_shopping_application/features/feature_auth/models/signup_model.dart';
import 'package:flutter_shopping_application/features/feature_auth/widget/costum_clippath_signup.dart';
import 'package:flutter_shopping_application/locator.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/src/material/scaffold.dart';

import '../../models/login_with_sms.dart';

class MobileSignUpScreen extends StatefulWidget {
  static const routeName = '/mobile_signup_screen';
  const MobileSignUpScreen({super.key});

  @override
  State<MobileSignUpScreen> createState() => _MobileSignUpScreenState();
}

class _MobileSignUpScreenState extends State<MobileSignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  @override
  void initState() {
    super.initState();

    ///sms Init
    initSmsRetriever();
  }

  void dipose() {
    // AndroidSmsRetriever.stopSmsListener();
    // super.dispose();
  }

  initSmsRetriever() async {
    // await AndroidSmsRetriever.listenForSms().then((value) {
    //   if (value == null) {
    //     return;
    //   }
    //   value = value.substring(10, 17);

    //   codeController.text = value;
    //   // BlocProvider.of<SignupBloc>(context).add(
    //   //   LoadSignUp(
    //   //     SignUpParams(userNameController.text, phoneController.text),
    //   //   ),
    //   // );
    // });
  }

  @override
  Widget build(BuildContext context) {
    ///get device size
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {},
      // => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          elevation: 0,
        ),
        body: Directionality(
            textDirection: TextDirection.rtl,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipPath(
                    clipper: CustomClipPathSignUp(),
                    child: Container(
                      width: width,
                      height: height * 0.18,
                      color: Colors.redAccent,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Shimmer.fromColors(
                                baseColor: Colors.white,
                                highlightColor: Colors.grey,
                                child: const Text('ثبت نام',
                                    style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold))),
                            Text(
                              'ساخت حساب جدید',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey[200],
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  ///sign up botton
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "نام و نام خانوادگی",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: height * 0.005,
                          ),
                          SizedBox(
                            height: 80,
                            child: TextFormField(
                              controller: userNameController,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                              onTap: () {
                                // if (userNameController.text[
                                //         userNameController.text.length - 1] !=
                                //     ' ') {
                                //   userNameController.text =
                                //       (userNameController.text + ' ');
                                // }
                                // if (userNameController.selection ==
                                //     TextSelection.fromPosition(TextPosition(
                                //         offset: userNameController.text.length -
                                //             1))) {}
                              },
                              textAlign: TextAlign.start,
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                filled: true,
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 20),
                                fillColor: Colors.grey[300],
                                counterText: '',
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 0, color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 0, color: Colors.transparent),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 0, color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 1, color: Colors.blue),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'نام کاربری خالی است ';
                                } else if (value.length < 2) {
                                  return 'نام کاربری باید بیشتر از 7 کاراکتر باشد ';
                                } else if (value.length > 24) {
                                  return 'نام کاربری باید کمتر از 20 کاراکتر باشد ';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          const Text(
                            "شماره همراه ",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: height * 0.005,
                          ),
                          SizedBox(
                            height: 80,
                            child: TextFormField(
                              controller: phoneController,
                              maxLength: 11,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.end,
                              textAlignVertical: TextAlignVertical.center,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                filled: true,
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                fillColor: Colors.grey[300],
                                counterText: '',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 0, color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                errorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 0, color: Colors.transparent),
                                ),
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 0, color: Colors.transparent),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 1, color: Colors.blue),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'شماره همراه را وارد کنید';
                                } else if (value.length != 11) {
                                  return 'شماره همراه اشتباه است ';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),

                          ///submit Button
                          // BlocConsumer<SignupBloc, SignupState>(
                          // listenWhen: (previous, current) {
                          //   if (current.callCodeStatus ==
                          //       previous.callCodeStatus) {
                          //     return false;
                          //   }
                          //   return true;
                          // },
                          // buildWhen: (previous, current) {
                          //   if (current.callCodeStatus ==
                          //       previous.callCodeStatus) {
                          //     return false;
                          //   }
                          //   return true;
                          // },
                          // listener: (context, state) {
                          //   if (state.callCodeStatus is CallCodeError) {
                          //     CallCodeError callCodeError =
                          //         state.callCodeStatus as CallCodeError;
                          //     ShowSnack(context, callCodeError.errorMessage,
                          //         Colors.red);
                          //   }
                          //   if (state.callCodeStatus is CallCodeCompleted) {
                          //     CallCodeCompleted callCodeCompleted =
                          //         state.callCodeStatus as CallCodeCompleted;
                          //     // saveDataToPrefs(signUpCompleted.signupModel);
                          //     ShowMyBottomSheet(context,
                          //       callCodeCompleted.loginWithSmsModel);
                          //   }
                          // },
                          // builder: (context, state) {
                          //   if (state.callCodeStatus is CallCodeLoading) {
                          //     return const Center(
                          //       child: DotLoadingWidget(size: 30),
                          //     );
                          //   }
                          SizedBox(
                            width: width,
                            height: 58,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.redAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {
                                // if (_formKey.currentState!.validate()) {
                                //   BlocProvider.of<SignupBloc>(context).add(
                                //       LoadRegisterCodeCheck(
                                //           phoneController.text));
                                // }
                              },
                              child: const Text(
                                'ثبت نام ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  ///login btn
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      width: width,
                      height: 58,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side:
                                BorderSide(width: 1, color: Colors.grey[300]!),
                          ),
                        ),
                        onPressed: () {
                          // Navigator.pushNamed(
                          //     context, MobileLoginScreen.routeName);
                        },
                        child: const Text(
                          'حساب دارید؟',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )),
      ),
    );
  }

  ShowSnack(context, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(
            message,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700),
          ),
          backgroundColor: color),
    );
  }

  // void ShowMyBottomSheet(
  //     BuildContext context, LoginWithSmsModel loginWithSmsModel) {
  //   ///get divice size
  //   var height = MediaQuery.of(context).size.height;
  //   var width = MediaQuery.of(context).size.width;

  //   showModalBottomSheet(
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.only(
  //             topRight: Radius.circular(30), topLeft: Radius.circular(30)),
  //       ),
  //       context: context,
  //       builder: (context) {
  //         return GestureDetector(
  //           behavior: HitTestBehavior.opaque,
  //           onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
  //           child: Padding(
  //             padding: const EdgeInsets.symmetric(horizontal: 20),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 SizedBox(
  //                   height: height * 0.04,
  //                 ),
  //                 const Center(
  //                   child: Text(
  //                     "کد ورود را وارد کنید",
  //                     style: TextStyle(
  //                         fontSize: 17,
  //                         fontWeight: FontWeight.w700,
  //                         color: Colors.black),
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   height: height * 0.06,
  //                 ),
  //                 const Text(
  //                   'کد ورود',
  //                   style: TextStyle(
  //                       fontSize: 20,
  //                       fontWeight: FontWeight.bold,
  //                       color: Colors.black),
  //                 ),
  //                 SizedBox(
  //                   height: height * 0.005,
  //                 ),
  //                 SizedBox(
  //                   height: 80,
  //                   child: TextField(
  //                     onChanged: (value) {
  //                       if (value.length == 6) {
  //                         // BlocProvider.of<LoginBloc>(context).add(LoadCodeCheck(codeController.text));
  //                       }
  //                     },
  //                     controller: codeController,
  //                     maxLength: 6,
  //                     style: const TextStyle(
  //                       color: Colors.black,
  //                       fontSize: 17,
  //                       fontWeight: FontWeight.bold,
  //                     ),
  //                     textAlign: TextAlign.center,
  //                     textAlignVertical: TextAlignVertical.center,
  //                     keyboardType: TextInputType.number,
  //                     decoration: InputDecoration(
  //                       filled: true,
  //                       contentPadding: const EdgeInsets.symmetric(
  //                           horizontal: 10, vertical: 20),
  //                       fillColor: Colors.grey[200],
  //                       counterText: '',
  //                       enabledBorder: OutlineInputBorder(
  //                           borderSide: const BorderSide(
  //                               width: 0, color: Colors.transparent),
  //                           borderRadius: BorderRadius.circular(10)),
  //                       errorBorder: OutlineInputBorder(
  //                           borderSide: const BorderSide(
  //                               width: 0, color: Colors.transparent),
  //                           borderRadius: BorderRadius.circular(10)),
  //                       focusedBorder: OutlineInputBorder(
  //                           borderSide:
  //                               const BorderSide(width: 1, color: Colors.blue),
  //                           borderRadius: BorderRadius.circular(10)),
  //                     ),
  //                   ),
  //                 ),
  //                 const SizedBox(
  //                   height: 10,
  //                 ),

  //                 // /// code submit button
  //                 // BlocConsumer<SignupBloc, SignupState>(
  //                 //   buildWhen: (pervious, curret) {
  //                 //     if (pervious.signUpDataStatus ==
  //                 //         curret.signUpDataStatus) {
  //                 //       return false;
  //                 //     }
  //                 //     return true;
  //                 //   },
  //                 //   listenWhen: (pervious, curret) {
  //                 //     if (pervious.signUpDataStatus ==
  //                 //         curret.signUpDataStatus) {
  //                 //       return false;
  //                 //     }
  //                 //     return true;
  //                 //   },
  //                 //   listener: (context, state) {
  //                 //     if (state.signUpDataStatus is SignUpDataError) {
  //                 //       Navigator.pop(context);
  //                 //       SignUpDataError signUpDataError =
  //                 //           state.signUpDataStatus as SignUpDataError;
  //                 //       ShowSnack(
  //                 //           context, signUpDataError.errorMessage, Colors.red);
  //                 //     }
  //                 //     if (state.signUpDataStatus is SignUpCompleted) {
  //                 //       SignUpCompleted signUpCompleted =
  //                 //           state.signUpDataStatus as SignUpCompleted;
  //                 //       SignupModel signupModel = signUpCompleted.signupModel;
  //                 //       ShowSnack(context, 'ثبت نام با موفقیت انجام شد',
  //                 //           Colors.green);
  //                 //       PrefsOperator prefsOperator = locator();
  //                 //       prefsOperator.saveUserData(
  //                 //           signupModel.data!.token!,
  //                 //           signupModel.data!.name ?? 'نام کاربری',
  //                 //           signupModel.data!.mobile
  //                 //               .toString()
  //                 //               .toEnglishDigit());
  //                 //     }
  //                 //   },
  //                 //   builder: (context, state) {
  //                 //     if (state.signUpDataStatus is SignUpDataLoading) {
  //                 //       return const Center(
  //                 //         child: DotLoadingWidget(size: 30),
  //                 //       );
  //                 //     }
  //                 //     return SizedBox(
  //                 //       width: width,
  //                 //       height: 58,
  //                 //       child: ElevatedButton(
  //                 //         style: ElevatedButton.styleFrom(
  //                 //           backgroundColor: Colors.redAccent,
  //                 //           shape: RoundedRectangleBorder(
  //                 //             borderRadius: BorderRadius.circular(10),
  //                 //           ),
  //                 //         ),
  //                 //         onPressed: () {
  //                 //           if (
  //                 //             codeController.text ==
  //                 //              loginWithSmsModel.data!.code.toString()
  //                 //               ) {
  //                 //             BlocProvider.of<SignupBloc>(context).add(
  //                 //               LoadSignUp(
  //                 //                 SignUpParams(userNameController.text,
  //                 //                     phoneController.text),
  //                 //               ),
  //                 //             );
  //                 //           } else {
  //                 //             Navigator.pop(context);
  //                 //             ShowSnack(context, "کد وارد شده اشتباه می باشد",
  //                 //                 Colors.red);
  //                 //           }
  //                 //         },
  //                 //         child: const Text(
  //                 //           'ثبت نام ',
  //                 //           style: TextStyle(
  //                 //               color: Colors.white,
  //                 //               fontSize: 18,
  //                 //               fontWeight: FontWeight.bold),
  //                 //         ),
  //                 //       ),
  //                 //     );
  //                 //   },
  //                 // )
  //               ],
  //             ),
  //           ),
  //         );
  //       });
}
