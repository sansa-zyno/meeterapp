import 'package:flutter/material.dart';
import 'package:meeter/Widgets/GradientButton/GradientButton.dart';
import 'package:meeter/Widgets/TextWidgets/poppins_text.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class Verification extends StatefulWidget {
  TextEditingController otp;
  Function onpressed;
  Function resendOtp;
  String number;

  Verification({this.otp, this.onpressed, this.number, this.resendOtp});

  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  final FocusNode _pinPutFocusNode = FocusNode();
  double times = 60;
  CountdownController control = CountdownController();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border(
        bottom: BorderSide(width: 2.0, color: Colors.black),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset("assets/images/verification.png"),
                  SizedBox(
                    height: 10,
                  ),
                  PoppinsText(
                    text: "Verification",
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  PoppinsText(
                    text:
                        "Enter the 6 digit number that\nwas sent to ${widget.number}",
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                    align: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: 200,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xff00AEFF),
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PinPut(
                          fieldsCount: 6,
                          onSubmit: (String pin) => null,
                          focusNode: _pinPutFocusNode,
                          controller: widget.otp,
                          submittedFieldDecoration: _pinPutDecoration.copyWith(
                            border: Border(
                              bottom:
                                  BorderSide(width: 1.0, color: Colors.grey),
                            ),
                          ),
                          selectedFieldDecoration: _pinPutDecoration,
                          followingFieldDecoration: _pinPutDecoration.copyWith(
                            border: Border(
                              bottom:
                                  BorderSide(width: 1.0, color: Colors.grey),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        times != 0
                            ? Container(
                                width: 250,
                                height: 50,
                                child: Hero(
                                  tag: "verify",
                                  child: GradientButton(
                                    title: "Verify",
                                    clrs: [
                                      Color(0xff00AEFF),
                                      Color(0xff00AEFF)
                                    ],
                                    onpressed: widget.onpressed,
                                  ),
                                ),
                              )
                            : Container(
                                width: 250,
                                height: 50,
                                child: Hero(
                                  tag: "verify",
                                  child: GradientButton(
                                    title: "Resend Code",
                                    clrs: [
                                      Color(0xff00AEFF),
                                      Color(0xff00AEFF)
                                    ],
                                    onpressed: () {
                                      widget.resendOtp();
                                      setState(() {
                                        times = 60;
                                        control.restart();
                                      });
                                    },
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25),
                  Countdown(
                      controller: control,
                      onFinished: () {
                        setState(() {
                          times = 0;
                        });
                      },
                      seconds: 60,
                      build: (BuildContext context, double time) {
                        return PoppinsText(
                          text:
                              "Re-Send Code In 0:${time.floor() < 10 ? "0" : ""}${time.floor()} ",
                        );
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
