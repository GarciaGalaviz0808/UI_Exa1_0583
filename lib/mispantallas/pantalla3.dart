import 'package:flutter/material.dart';

class Pantalla3 extends StatelessWidget {
  const Pantalla3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F0EB),
      appBar: AppBar(
        centerTitle: true,
        // Ajuste de altura y posición para que el "Back" no se recorte
        toolbarHeight: 70, 
        leadingWidth: 80,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Back", 
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17)
            ),
          ),
        ),
        title: const Text("PAGO", 
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 2)
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://raw.githubusercontent.com/GarciaGalaviz0808/imgs/refs/heads/main/header.PNG'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView( // Para evitar errores de espacio en pantallas pequeñas
        child: Container(
          height: MediaQuery.of(context).size.height - 120, // Ajuste dinámico
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.shopping_cart_checkout, size: 80, color: Color(0xFF6D4C41)),
              const SizedBox(height: 20),
              const Text("Confirmación de Pedido", 
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.brown)
              ),
              const SizedBox(height: 20),
              const Text(
                "Estás a punto de adquirir materiales premium de ARTSTORE. ¿Deseas continuar con el proceso de pago seguro?",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black87, height: 1.5),
              ),
              const SizedBox(height: 40),
              
              // Botones con mejor tamaño
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildBoton("Cancelar", Colors.grey[500]!, () => Navigator.pop(context)),
                  const SizedBox(width: 25),
                  _buildBoton("Pagar", const Color(0xFF6D4C41), () {}),
                ],
              ),
              
              const Spacer(), 
              
              // RECUADROS GRANDES Y PROPORCIONADOS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildCuadroPago(
                    "https://raw.githubusercontent.com/GarciaGalaviz0808/imgs/refs/heads/main/oleo4.PNG", 
                    "Óleos"
                  ),
                  _buildCuadroPago(
                    "https://raw.githubusercontent.com/GarciaGalaviz0808/imgs/refs/heads/main/pinceles.jpg", 
                    "Pinceles"
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBoton(String texto, Color color, VoidCallback accion) {
    return SizedBox(
      width: 140,
      height: 50,
      child: ElevatedButton(
        onPressed: accion,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: Text(texto, style: const TextStyle(color: Colors.white, fontSize: 16)),
      ),
    );
  }

  Widget _buildCuadroPago(String url, String titulo) {
    return Container(
      width: 160, // Tamaño aumentado
      height: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFF6D4C41), width: 3),
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(2, 4))],
      ),
      child: ClipRRect( // Para que la imagen respete los bordes redondeados
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.network(url, fit: BoxFit.cover, width: double.infinity, height: double.infinity),
            Container(color: Colors.black38), // Capa para legibilidad
            Text(titulo, 
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)
            ),
          ],
        ),
      ),
    );
  }
}