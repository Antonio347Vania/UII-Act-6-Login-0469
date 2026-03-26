import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // Controladores para capturar el texto de los 4 campos
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _confirmPassController = TextEditingController();

  void _registrarUsuario() {
    // Lógica simple de validación
    if (_nameController.text.isEmpty || _emailController.text.isEmpty || 
        _passController.text.isEmpty || _confirmPassController.text.isEmpty) {
      _mostrarMensaje("Por favor, llena todos los campos");
      return;
    }

    if (_passController.text != _confirmPassController.text) {
      _mostrarMensaje("Las contraseñas no coinciden");
      return;
    }

    // Si todo está bien, simulamos el registro exitoso
    _mostrarMensaje("¡Cuenta creada para ${_nameController.text}!");
    Navigator.pop(context); // Regresa al Login
  }

  void _mostrarMensaje(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mensaje), backgroundColor: const Color(0xFF4CAF50)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7C02F), // Amarillo Soriana
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const Text(
                "Crear Cuenta",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text("Únete a Soriana Vania"),
              const SizedBox(height: 30),
              
              // 1. Campo Nombre
              _buildField("Nombre Completo", _nameController, false, Icons.person),
              const SizedBox(height: 15),
              
              // 2. Campo Email
              _buildField("Correo Electrónico", _emailController, false, Icons.email),
              const SizedBox(height: 15),
              
              // 3. Campo Contraseña
              _buildField("Contraseña", _passController, true, Icons.lock),
              const SizedBox(height: 15),
              
              // 4. Campo Confirmar Contraseña
              _buildField("Confirmar Contraseña", _confirmPassController, true, Icons.lock_outline),
              
              const SizedBox(height: 40),
              
              // Botón de Registro
              ElevatedButton(
                onPressed: _registrarUsuario,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4CAF50), // Verde Soriana
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                ),
                child: const Text("REGISTRARSE", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget reutilizable para los campos de texto
  Widget _buildField(String hint, TextEditingController controller, bool isPass, IconData icon) {
    return TextField(
      controller: controller,
      obscureText: isPass,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.grey),
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
