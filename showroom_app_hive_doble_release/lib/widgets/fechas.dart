import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Fechas extends StatefulWidget {
  const Fechas({super.key});

  @override
  State<Fechas> createState() => _FechasState();
}

class _FechasState extends State<Fechas> {
  DateTime startDate = DateTime.now();
  DateTime? endDate;
  final TextEditingController _inputFieldDateController = TextEditingController();
  //String _vencimiento = '';
  final TextEditingController _inputFieldDateControllerVencimiento =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text(
              'Fecha: ',
              style: TextStyle(fontSize: 24),
            ),
            Container(
                decoration: BoxDecoration(
                    // border: Border.all(),
                    borderRadius: BorderRadius.circular(5)),
                width: MediaQuery.of(context).size.width / 5,
                child: _crearFecha(context))
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            const Text(
              'Fecha de Vencimiento: ',
              style: TextStyle(fontSize: 24),
            ),
            Container(
                decoration: BoxDecoration(
                    // border: Border.all(),
                    borderRadius: BorderRadius.circular(5)),
                width: MediaQuery.of(context).size.width / 5,
                child: _crearFechaVencimiento(context)
            )
          ],
        ),
      ],
    );
  }

  Widget _crearFecha(BuildContext context) {
    return TextFormField(
      controller: _inputFieldDateController,
      enableInteractiveSelection: false,
      decoration: const InputDecoration(
        icon: Icon(Icons.calendar_today),
        hintText: 'Fecha de Compra',
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        _selecDate(context);
      },
      validator: (value) {
        if (value!.length < 4) {
          return 'Ingrese una fecha correcta';
        } else {
          return null;
        }
      },
    );
  }

  _selecDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: startDate,
        firstDate: DateTime(2020),
        lastDate: DateTime.now(),
        locale: const Locale('es', 'UY'));
    if (picked != null) {
      setState(() {
        startDate = picked;
        _inputFieldDateController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  Widget _crearFechaVencimiento(BuildContext context) {
    return TextFormField(
      controller: _inputFieldDateControllerVencimiento,
      enableInteractiveSelection: false,
      decoration: const InputDecoration(
        icon: Icon(Icons.calendar_today),
        hintText: 'Fecha de Vencimiento',
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        _selecDateVencimiento(context);
      },
      validator: (value) {
        if (value!.length < 4) {
          return 'Ingrese una fecha correcta';
        } else {
          return null;
        }
      },
    );
  }

  _selecDateVencimiento(BuildContext context) async {
    DateTime? pickedVencimiento = await showDatePicker(
        context: context,
        initialDate: startDate,
        firstDate: startDate,
        lastDate: DateTime(2090),
        locale: const Locale('es', 'UY'));
    if (pickedVencimiento != null) {
      setState(() {
        endDate = pickedVencimiento;
        _inputFieldDateControllerVencimiento.text = DateFormat('dd/MM/yyyy').format(pickedVencimiento);
      });
    }
  }
}
