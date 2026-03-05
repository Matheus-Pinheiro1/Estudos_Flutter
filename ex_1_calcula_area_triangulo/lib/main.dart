import 'package:flutter/material.dart';
import 'calculoA.dart';
import 'BLLcalculoA.dart';
import 'erro.dart' as Error;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Calcule a área do triângulo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  String resposta = '';
  String area = '';
  TextEditingController controleB=TextEditingController();
  TextEditingController controleH=TextEditingController();

  void calcularA(){
    setState(() {
      Calculo calc= Calculo();
      calc.valorB=controleB.text;
      calc.valorH=controleH.text;

      BLLcalculoA.validaDados(calc);

      if (Error.Erro.error){
        resposta=Error.Erro.msg;
      }else{
        area=calc.area;
        resposta='A área do triângulo é: $area';
      }
    });
  }
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      body: Center( 
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.center, 
          children: <Widget>[ 
         Row( 

           children: [ 
             Text( 

               'Digite a base do triângulo:', 
             ), 
             Container( 

               width: 100, 
               child: TextField( 

                 controller: controleB, 
               ), 
             ), 
           ], 
         ), 
         Row( 

           children: [ 
             Text( 

               'Digite a altura do triângulo:', 
             ), 
             Container( 

               width: 100,
               child: TextField( 

                 controller: controleH, 
                 keyboardType: TextInputType.number, 
               ), 
             ), 
           ], 
         ), 
 
ElevatedButton( 

           onPressed: calcularA, 
           child: Text('Calcular')
         ), 
 
         Row( 

           children: [ 
             Text( 

               'Sua área é:', 
             ), 
             Text('$resposta'  )
           ], 
         ), 
       ],
     ),
   ),
    );
  }
} 
