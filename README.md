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
`live_variable.cc`, `effector.cc`, and `effector_factory.cc`. 

### `cfg.cc`
In `cfg.cc` I added logic to add edges such that loops and branching logic are handled
correctly. This applies to the tac instructions `ifz` and `goto`: I add an extra
edge that creates a flow to wherever the `ifz` or `goto` leads to in addition to
the instruction immediately after.

### `mips.cc`
In `mips.cc` I add a public method to change the control flow graph
that it uses to determine variable liveness. Live Variable Analysis is used in
the calculation for the `IsLive` function.

### `codegen.cc`
In `codegen.cc` I generate the control flow graph and pass it to `Mips` if we
are inside a function. Otherwise the cfg passed to `Mips` is `NULL` by default.

### `live_variable.cc`
In `live_variable.cc` I implement the four virtual CFG functions. The
implementations are straightforward. `Effect` being the most complicated of them
using the static function `EffectorFactory::MakeEffector` simply constructs
from the current TAC instruction an `Effector` which knows how to effect the
variable set coming IN from the previous instruction. If the effector coming
back from the factory method is `NULL`, then the IN variable set from the
previous instruction is simply passed through to the next node.

### `effector*.cc`
In the `effector*.cc` files I provide the logic that maps intructions to KILL
(erase) and GEN/IN (insert) actions. `EffectorFactory::MakeFactory` encapsulates
the logic of constructing the correct `Effector` given a TAC instruction.

