using System;
using System.Linq;
using System.Threading.Tasks;
using Demos;
using Microsoft.Quantum.Simulation.Simulators;

namespace CSharpHost
{
    class Program
    {
        static async Task Main(string[] args)
        {
            using var qsim = new QuantumSimulator();

            var randomBits = await RandomNumberGenerator.Run(qsim);
            var bitString = string.Join("", randomBits.Select(x => x ? 1 : 0));

            Console.WriteLine($"Generated random bit string: {bitString}");
            Console.WriteLine($"Generated random uint32: {Convert.ToUInt32(bitString, 2)}");
        }
    }
}