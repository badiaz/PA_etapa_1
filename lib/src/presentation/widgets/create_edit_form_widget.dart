import 'package:flutter/material.dart';
import 'package:tarjetas_app/src/di/dependency_provider.dart';
import 'package:tarjetas_app/src/domain/entities/card_entity.dart';
import 'package:tarjetas_app/src/presentation/blocs/card_bloc.dart/cards_bloc.dart';

class CreateEditFormWidget extends StatefulWidget {
  const CreateEditFormWidget({
    super.key,
    required this.cardsController,
    required this.card,
  });
  final CardsBloc cardsController;
  final CardEntity? card;

  @override
  State<CreateEditFormWidget> createState() => _CreateEditFormWidgetState();
}

class _CreateEditFormWidgetState extends State<CreateEditFormWidget> {
  final _formKey = GlobalKey<FormState>();
  String? _title;
  String? _description;

  @override
  void initState() {
    super.initState();
    _title = widget.card?.title;
    _description = widget.card?.description;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final CardsBloc cardsBloc = DependencyProvider.of(context).cardsBloc;
    return SizedBox(
      height: size.height * 0.8,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _title,
                cursorHeight: size.width * 0.1,
                maxLines: 1,
                style: TextStyle(
                    fontSize: size.width * 0.1, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    hintText: 'Title...',
                    hintStyle: TextStyle(
                        fontSize: size.width * 0.1,
                        fontWeight: FontWeight.bold)),
                onChanged: (value) {
                  _title = value;
                  cardsBloc.updateTitleCardToSaveEdit(value);
                },
              ),
              TextFormField(
                initialValue: _description,
                maxLines: 14,
                style: TextStyle(fontSize: size.width * 0.05),
                decoration: InputDecoration(
                    hintText: 'Description',
                    hintStyle: TextStyle(fontSize: size.width * 0.05)),
                onChanged: (value) {
                  _description = value;
                  cardsBloc.updateDescriptionCardToSaveEdit(value);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
