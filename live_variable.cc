#include "effector_factory.h"
#include "live_variable.h"

LiveVariablesT LiveVariable::init() {
  LiveVariablesT var;
  return var;
}

LiveVariablesT LiveVariable::top() { return init(); }

LiveVariablesT LiveVariable::effect(const Instruction *instr,
                                    const LiveVariablesT &in) {
  LiveVariablesT out = in;
  Effector *effector = EffectorFactory::MakeEffector(instr);
  if (effector)
    effector->effect(out);
  return out;
}

LiveVariablesT LiveVariable::meet(const LiveVariablesT &a,
                                  const LiveVariablesT &b) {
  LiveVariablesT result;
  for (auto var : a)
    result.insert(var);
  for (auto var : b)
    result.insert(var);
  return result;
}
