import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tarjetas_app/src/utils/maps.dart';
import 'package:tarjetas_app/src/utils/app_colors.dart';
import 'package:tarjetas_app/src/di/dependency_provider.dart';
import 'package:tarjetas_app/src/presentation/widgets/widgets.dart';
import 'package:tarjetas_app/src/presentation/blocs/card_bloc.dart/cards_bloc.dart';

class FormNavbarWidget extends StatefulWidget {
  const FormNavbarWidget({
    super.key,
    required this.isEditMode,
  });
  final bool isEditMode;

  @override
  State<FormNavbarWidget> createState() => _FormNavbarWidgetState();
}

class _FormNavbarWidgetState extends State<FormNavbarWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final CardsBloc cardsBloc = DependencyProvider.of(context).cardsBloc;

    return Positioned(
      bottom: 0.0,
      right: 0.0,
      left: 0.0,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipPath(
            clipper: NavBarClipper(),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: CustomPaint(
                size: Size(size.width, size.height * 0.16),
                painter: CurvedNavBarPainter(),
              ),
            ),
          ),
          Positioned(
            top: -30,
            right: size.width * 0.5 - 40,
            left: size.width * 0.5 - 40,
            child: StreamBuilder<CardsState>(
                stream: cardsBloc.streamController,
                builder: (context, snapshot) {
                  final state = snapshot.data ?? cardsBloc.currentState;
                  return CustomRoundedButton(
                      tooltipText: widget.isEditMode ? 'Save' : 'Add',
                      icon: widget.isEditMode
                          ? CupertinoIcons.floppy_disk
                          : CupertinoIcons.check_mark,
                      onPressed: () {
                        if (state.titlecardToEditSaveText == '' ||
                            state.descriptioncardToEditSaveText == '') {
                          _showAlertDialog(context);
                        } else {
                          if (widget.isEditMode) {
                            cardsBloc.updateCard();
                          } else {
                            cardsBloc.addCard();
                          }
                          Navigator.pushNamed(context, '/');
                        }
                      });
                }),
          ),
          Positioned(
            bottom: 25,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _ButtonColor(color: getCardColorByIndex(1), index: 1),
                _ButtonColor(color: getCardColorByIndex(2), index: 2),
                _ButtonColor(color: getCardColorByIndex(3), index: 3),
                _ButtonColor(color: getCardColorByIndex(4), index: 4),
                _ButtonColor(color: getCardColorByIndex(5), index: 5),
                _ButtonColor(color: getCardColorByIndex(6), index: 6),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> _showAlertDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.warning,
              color: AppColors.orangeCard,
            ),
            const Text(
              'Please fill all fields',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}

class _ButtonColor extends StatelessWidget {
  final Color color;
  final int index;
  const _ButtonColor({required this.color, required this.index});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final CardsBloc cardsBloc = DependencyProvider.of(context).cardsBloc;

    return GestureDetector(
      onTap: () => cardsBloc.updateColorSelection(index),
      child: StreamBuilder<CardsState>(
          stream: cardsBloc.streamController,
          builder: (context, snapshot) {
            final state = snapshot.data ?? cardsBloc.currentState;
            return TweenAnimationBuilder(
              tween: Tween<double>(begin: 100.0 - 10.0 * index, end: 0),
              curve: Curves.easeInOutCirc,
              duration: Duration(milliseconds: 300 * index),
              builder: (context, animation, child) => Transform.translate(
                offset: Offset(0, animation),
                child: TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: 1),
                  duration: Duration(milliseconds: 300 * index),
                  builder: (context, opacity, child) => Opacity(
                    opacity: opacity,
                    child: Container(
                        width: size.width * 0.1,
                        height: size.width * 0.1,
                        decoration: BoxDecoration(
                            color: color,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(6.0))),
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 500),
                          child: state.selectedColorIndex == index
                              ? const Icon(CupertinoIcons.check_mark)
                              : const SizedBox.shrink(),
                        )),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
