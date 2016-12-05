# pp7
The register allocation algorithm prefers to work with general purpose registers
t3-t9. If more registers are required, the algorithm will fall back to loading
from and immediately spilling to memory using registers t0-t2. The reason for
choosing registers t0-t2 as fallback registers is that it is easier to spot
those registers when reading the assembly. Register allocation using Live
Variable Analysis is almost finished. The actual CFG algorithm is fully
implemented, there is just some minor tweaks to be made in `mips.cc` such as
only spilling global variables upon function return.

## Live Variable Analysis
Live variable analysis is implemented in `cfg.cc`, `mips.cc`, `codegen.cc`,
`live_variable.cc`, `effector.cc`, and `effector_factory.cc`. In `cfg.cc` I
added logic to add edges such that loops and branching logic are handled
correctly. In `mips.cc` I add a public method to change the control flow graph
that it uses to determine variable liveness. In `codegen.cc` I generate the
control flow graph and pass it to `Mips`. In `live_variable.cc` I implement the
fou virtual CFG functions. In the `effector*.cc` files I provide the logic that
maps intructions to KILL (erase) and GEN/IN (insert) actions.
