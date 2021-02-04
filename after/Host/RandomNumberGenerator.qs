namespace Demos {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Preparation;
    
    operation RandomNumberGenerator() : Bool[] {
        mutable randomBits = new Bool[32];
        
        for idx in 0..31 {
            use qubit = Qubit();
            H(qubit);                
            let result = MResetZ(qubit);
            set randomBits w/= idx <- result == One;
        }
        
        return randomBits;
    }  
}