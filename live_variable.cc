#include "live_variable.h"

LiveVariablesT LiveVariable::init() {
  LiveVariablesT tmp;
  return tmp;
}

LiveVariablesT LiveVariable::top() { return init(); }

LiveVariablesT LiveVariable::effect(const Instruction *instr, const LiveVariablesT &in) {
  LiveVariablesT current = in;
  const LoadConstant *loadconstant = dynamic_cast<const LoadConstant *>(instr);
  if (loadconstant != NULL) {
    current.erase(loadconstant->GetLocation());
  }
  const LoadStringConstant *loadstringconstant =
      dynamic_cast<const LoadStringConstant *>(instr);
  if (loadstringconstant != NULL) {
    current.erase(loadstringconstant->GetLocation());
  }
  const LoadLabel *loadlabel = dynamic_cast<const LoadLabel *>(instr);
  if (loadlabel != NULL) {
    current.erase(loadlabel->GetLocation());
  }
  const Assign *assign = dynamic_cast<const Assign *>(instr);
  if (assign != NULL) {
    current.erase(assign->GetDestination());
    current.insert(assign->GetSource());
  }
  const Load *load = dynamic_cast<const Load *>(instr);
  if (load != NULL) {
    current.erase(load->GetDestination());
    current.insert(load->GetSource());
  }
  const Store *store = dynamic_cast<const Store *>(instr);
  if (store != NULL) {
    current.insert(store->GetDestination());
    current.insert(store->GetSource());
  }
  const BinaryOp *binaryop = dynamic_cast<const BinaryOp *>(instr);
  if (binaryop != NULL) {
    current.erase(binaryop->GetDestination());
    current.insert(binaryop->GetOp1());
    current.insert(binaryop->GetOp2());
  }
  const IfZ *ifz = dynamic_cast<const IfZ *>(instr);
  if (ifz != NULL) {
    current.insert(ifz->GetLocation());
  }
  const Return *ret = dynamic_cast<const Return *>(instr);
  if (ret != NULL) {
    current.insert(ret->GetLocation());
  }
  const PushParam *pushparam = dynamic_cast<const PushParam *>(instr);
  if (pushparam != NULL) {
    current.insert(pushparam->GetLocation());
  }
  const LCall *lcall = dynamic_cast<const LCall *>(instr);
  if (lcall != NULL) {
    current.insert(lcall->GetLocation());
  }
  const ACall *acall = dynamic_cast<const ACall *>(instr);
  if (acall != NULL) {
    current.insert(acall->GetLocation());
    current.insert(acall->GetAddress());
  }
  return current;
}

LiveVariablesT LiveVariable::meet(const LiveVariablesT &a, const LiveVariablesT &b) {
  LiveVariablesT tmp;
  for (auto var : a)
    tmp.insert(var);
  for (auto var : b)
    tmp.insert(var);
  return tmp;
}
