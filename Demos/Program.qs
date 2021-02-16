namespace Demos {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Preparation;
    

    @EntryPoint()
    operation Start() : Unit {
        use qubit = Qubit();
        H(qubit);
        let result = MResetZ(qubit) == One ? 1 | 0;
        Message($"Measured: {IntAsString(result)}");
    }
}