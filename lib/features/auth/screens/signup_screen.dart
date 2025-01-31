import 'package:ecocoleta/helper/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  
  bool _isPasswordVisible = false;
  bool _isCollector = false;
  bool _isValidEmail = true;
  bool _isValidCPF = true;
  bool _isValidPassword = true;
  bool _isFormValid = false;

  var cpfFormatter = MaskTextInputFormatter(mask: '###.###.###-##', filter: {"#": RegExp(r'[0-9]')});

  void _validateForm() {
    setState(() {
      _isValidEmail = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}").hasMatch(_emailController.text);
      _isValidCPF = cpfFormatter.getUnmaskedText().length == 11;
      _isValidPassword = _passwordController.text.length >= 8;
      _isFormValid = _nameController.text.isNotEmpty && _isValidEmail && _isValidCPF && _isValidPassword && _birthDateController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastro')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Nome Completo'),
                onChanged: (value) => _validateForm(),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  errorText: _isValidEmail ? null : 'Email inválido',
                ),
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) => _validateForm(),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _cpfController,
                decoration: InputDecoration(
                  labelText: 'CPF',
                  errorText: _isValidCPF ? null : 'CPF inválido',
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [cpfFormatter],
                onChanged: (value) => _validateForm(),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  errorText: _isValidPassword ? null : 'A senha deve ter no mínimo 8 caracteres',
                  suffixIcon: IconButton(
                    icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
                obscureText: !_isPasswordVisible,
                onChanged: (value) => _validateForm(),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _birthDateController,
                decoration: InputDecoration(labelText: 'Data de Nascimento'),
                keyboardType: TextInputType.datetime,
                onChanged: (value) => _validateForm(),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text('Sou:'),
                  SizedBox(width: 10),
                  ChoiceChip(
                    label: Text('Catador'),
                    selected: _isCollector,
                    onSelected: (selected) {
                      setState(() {
                        _isCollector = true;
                      });
                    },
                  ),
                  SizedBox(width: 10),
                  ChoiceChip(
                    label: Text('Morador'),
                    selected: !_isCollector,
                    onSelected: (selected) {
                      setState(() {
                        _isCollector = false;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isFormValid ? () {
                    Get.toNamed(RouteHelper.getLoginScreen());
                  } : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isFormValid ? Colors.green : Colors.grey,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: Text('Cadastrar', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
