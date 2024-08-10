pragma circom 2.0.0;

/*This circuit template checks that c is the multiplication of a and b.*/  

template XelaCircuit () {  
  // signal inputs
   signal input A;
   signal input B;

   // signals from gates
   signal X;
   signal Y;

   // final signal output
   signal output Q;

   // Component gates used to create custom circuit
   component andGate = AND();
   component notGate = NOT();
   component orGate = OR();

   // Circuit logic
   // AND gate logic
   andGate.a <== A;
   andGate.b <== B;
   X <== andGate.out;
 
   // NOT gate logic
   notGate.in <== B;
   Y <== notGate.out;

   // OR gate logic 
   orGate.a <== X;
   orGate.b <== Y;

   Q <== orGate.out; //Final output
}

template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a*b;
}

template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}

template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a*b;
}

component main = XelaCircuit();