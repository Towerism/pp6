#include "effector.h"

class EffectorFactory {
public:
  static Effector* MakeEffector(const Instruction *instr);
};
