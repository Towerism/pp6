# pp6
The register allocation algorithm prefers to work with general purpose registers
t3-t9. If more registers are required, the algorithm will fall back to loading
from and immediately spilling to memory using registers t0-t2. The reason for
choosing registers t0-t2 as fallback registers is that it is easier to spot
those registers when reading the assembly.
