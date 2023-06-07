import 'package:get/get.dart';

class CalculatorController extends GetxController {

  var firstNumber  = '10'.obs; // todos son observables con el .obs, se declara como var
  var secondNumber = '20'.obs;
  var mathResult   = '30'.obs;
  var operation    = '+'.obs;

// para resetear la calculadora en cero 
  resetAll() {
    firstNumber.value  = '0';
    secondNumber.value = '0';
    mathResult.value   = '0';
    operation.value    = '+';
  }
//para cambiar si es positivo o negativo 
  changeNegativePositive() {
    if ( mathResult.startsWith('-') ) {
        mathResult.value = mathResult.value.replaceFirst('-', '');
    } else {
      mathResult.value = '-' + mathResult.value;
    }
  }
// corresponden con los numeros con los cuales se va a operar 

  addNumber( String number ) {

    if ( mathResult.value == '0' ) 
      return mathResult.value = number;

    if ( mathResult.value == '-0' ){
      return mathResult.value = '-' + number;
    }
    
    mathResult.value = mathResult.value + number;

  }
// para Agregar decimal 

  addDecimalPoint() {

    if ( mathResult.contains('.') ) return;

    if ( mathResult.startsWith('0') ){
      mathResult.value = '0.';
    } else {
      mathResult.value = mathResult.value + '.';
    }

  }

  // Recibe la operacion que necesita y lo almacena 

  selectOperation( String newOperation ) {

    operation.value   = newOperation;
    firstNumber.value = mathResult.value;
    mathResult.value  = '0';

  }
// Corresponde con la funcion del boton "del" de la calculadora
  deleteLastEntry() {

    if ( mathResult.value.replaceAll('-', '').length > 1 ) {
      mathResult.value = mathResult.value.substring(0, mathResult.value.length - 1 );
    } else {
      mathResult.value = '0';
    }

  }

  calculateResult() {

    double num1 = double.parse( firstNumber.value );
    double num2 = double.parse( mathResult.value );

    secondNumber.value = mathResult.value;

    switch( operation.value ){

      case '+':
        mathResult.value = '${ num1 + num2 }';
      break;

      case '-':
        mathResult.value = '${ num1 - num2 }';
      break;

      case '/':
        mathResult.value = '${ num1 / num2 }';
      break;

      case 'X':
        mathResult.value = '${ num1 * num2 }';
      break;

      default:
        return;
    }

    if ( mathResult.value.endsWith('.0') ) {
      mathResult.value = mathResult.value.substring(0, mathResult.value.length - 2 );
    }

  }


}