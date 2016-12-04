#include "effector_factory.h"

Effector *EffectorFactory::MakeEffector(const Instruction *instr) {
  const LoadConstant *loadconstant = dynamic_cast<const LoadConstant *>(instr);
  if (loadconstant)
    return new LoadConstantEffector(loadconstant);
  const LoadStringConstant *loadstringconstant =
      dynamic_cast<const LoadStringConstant *>(instr);
  if (loadstringconstant)
    return new LoadStringConstantEffector(loadstringconstant);
  const LoadLabel *loadlabel = dynamic_cast<const LoadLabel *>(instr);
  if (loadlabel)
    return new LoadLabelEffector(loadlabel);
  const Assign *assign = dynamic_cast<const Assign *>(instr);
  if (assign)
    return new AssignEffector(assign);
  const Load *load = dynamic_cast<const Load *>(instr);
  if (load)
    return new LoadEffector(load);
  const Store *store = dynamic_cast<const Store *>(instr);
  if (store)
    return new StoreEffector(store);
  const BinaryOp *binaryop = dynamic_cast<const BinaryOp *>(instr);
  if (binaryop)
    return new BinaryOpEffector(binaryop);
  const IfZ *ifz = dynamic_cast<const IfZ *>(instr);
  if (ifz)
    return new IfZEffector(ifz);
  const Return *ret = dynamic_cast<const Return *>(instr);
  if (ret)
    return new ReturnEffector(ret);
  const PushParam *pushparam = dynamic_cast<const PushParam *>(instr);
  if (pushparam)
    return new PushParamEffector(pushparam);
  const LCall *lcall = dynamic_cast<const LCall *>(instr);
  if (lcall)
    return new LCallEffector(lcall);
  const ACall *acall = dynamic_cast<const ACall *>(instr);
  if (acall)
    return new ACallEffector(acall);
  return NULL;
}
