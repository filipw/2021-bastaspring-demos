namespace Demos {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Preparation;
    

    @EntryPoint()
    operation Start() : Unit {
        BitflipExample();
        //HadamardExample();
        //HadamardWithLoopExample();
        //EntanglementExample();
        //EntanglementWithLoopExample();
        //DeutschAlgorithmExample();
    }

    operation HadamardExample() : Unit {
        use qubit = Qubit();
        DumpMachine();
        H(qubit);
        DumpMachine();
        let result = MResetZ(qubit) == One ? 1 | 0;
        Message($"Measured: {IntAsString(result)}");
    }

    operation BitflipExample() : Unit {
        use qubit = Qubit();
        DumpMachine();
        X(qubit);
        DumpMachine();
        let result = MResetZ(qubit) == One ? 1 | 0;
        Message($"Measured: {IntAsString(result)}");
    }
    
    operation EntanglementExample() : Unit {
        use (control, target) = (Qubit(), Qubit());
        DumpMachine();

        H(control);
        CNOT(control, target);

        DumpMachine();

        //PrepareEntangledState([control], [target]);
        
        let resultControl = ResultAsBool(MResetZ(control));
        let resultTarget = ResultAsBool(MResetZ(target));

        Message("Result: |" + (resultControl ? "1" |"0") + (resultTarget ? "1" | "0") +">");
    }  
}

