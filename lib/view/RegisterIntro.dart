import 'package:flutter/material.dart';

import 'package:travel_app2/view/MyCategory.dart';

import 'package:validators/validators.dart';
import '../component/Colors.dart';
import '../component/myStrings.dart';
import '../gen/assets.gen.dart';

class RegisterIntro extends StatelessWidget {
  RegisterIntro({super.key});
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  String emailOnChange = '';
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    final elevatedButtonTheme = ElevatedButtonTheme.of(context).style;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //wellcome image
            Assets.img.monkey.svg(height: 120, width: 120),

            //wellcome Text
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 90),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: textTheme.bodyLarge!
                        .apply(color: SolidColors.colorTextTitle),
                    text: MyStrings.wellcomeText,
                  )),
            ),

            //button
            ElevatedButton(
              style: elevatedButtonTheme,
              onPressed: () {
                //bottom sheet
                _showEmailBottomSheet(
                    context, size, textTheme, elevatedButtonTheme);
              },
              child: const Text(
                MyStrings.registerPagebutton,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> _showEmailBottomSheet(BuildContext context, Size size,
      TextTheme textTheme, ButtonStyle? elevatedButtonTheme) {
    return showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              width: size.width,
              height: size.height / 2.57,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'لطفا ایمیلت رو وارد کن',
                    style: textTheme.titleMedium!.apply(color: Colors.black),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  //text form field
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          size.width / 7, 0, size.width / 7, 0),
                      child: TextFormField(
                        onChanged: (value) {
                          emailOnChange = value;
                          isEmail(value);
                        },
                        controller: emailController,
                        style: textTheme.bodyLarge!.apply(color: Colors.black),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'ایمیل نمیتونه خالی باشه';
                          }

                          if (isEmail(value) == true) {
                            return 'بزن بریم';
                          } else {
                            return 'ایمیل وارد شده صحیح نمی باشد';
                          }
                        },
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          hintText: 'techblog@gmail.com',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                      style: elevatedButtonTheme,
                      onPressed: () {
                        _formKey.currentState!.validate()
                            ? ScaffoldMessenger.of(context).showSnackBar(
                                mySnakbar(context, ' 😊 بریم مرحله بعد'))
                            : ScaffoldMessenger.of(context).showSnackBar(
                                mySnakbar(context,
                                    ' 😔 اطلاعات وارد شده مجاز نمیباشد'));
                        Navigator.of(context).pop();
                        _activationCodeBottomSheet(
                            context, size, textTheme, elevatedButtonTheme);
                      },
                      child: const Text('ادامه'))
                ],
              ),
            ),
          );
        });
  }

  Future<dynamic> _activationCodeBottomSheet(BuildContext context, Size size,
      TextTheme textTheme, ButtonStyle? elevatedButtonTheme) {
    return showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              width: size.width,
              height: size.height / 2.57,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'کد فعال سازی رو وارد کن ',
                    style: textTheme.titleMedium!.apply(color: Colors.black),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  //text form field
                  Form(
                    key: _formKey2,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          size.width / 7, 0, size.width / 7, 0),
                      child: TextFormField(
                        onChanged: (value) {
                          emailOnChange = value;
                          isEmail(value);
                        },
                        controller: emailController,
                        style: textTheme.bodyLarge!.apply(color: Colors.black),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'کد فعال سازی وارد نشده است';
                          }

                          if (isEmail(value) == true) {
                            return 'بزن بریم';
                          } else {
                            return 'ایمیل وارد شده صحیح نمی باشد';
                          }
                        },
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          hintText: '******',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                      style: elevatedButtonTheme,
                      onPressed: () {
                        _formKey2.currentState!.validate()
                            ? ScaffoldMessenger.of(context).showSnackBar(
                                mySnakbar(context, ' 😊 بریم مرحله بعد'))
                            : ScaffoldMessenger.of(context).showSnackBar(
                                mySnakbar(context,
                                    ' 😔 اطلاعات وارد شده مجاز نمیباشد'));
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) {
                              return const MyCategory();
                            },
                          ),
                        );
                      },
                      child: const Text('ادامه'))
                ],
              ),
            ),
          );
        });
  }
}

mySnakbar(context, String content) {
  return SnackBar(
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 30),
      behavior: SnackBarBehavior.floating,
      content: Text(content));
}
