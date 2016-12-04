#include "effector.h"

void LoadConstantEffector::effect(LiveVariablesT &in) {
  in.erase(instr->GetLocation());
}

void LoadStringConstantEffector::effect(LiveVariablesT &in) {
  in.erase(instr->GetLocation());
}

void LoadLabelEffector::effect(LiveVariablesT &in) {
  in.erase(instr->GetLocation());
}

void AssignEffector::effect(LiveVariablesT &in) {
  in.erase(instr->GetDestination());
  in.insert(instr->GetSource());
}

void LoadEffector::effect(LiveVariablesT &in) {
  in.erase(instr->GetDestination());
  in.insert(instr->GetSource());
}

void StoreEffector::effect(LiveVariablesT &in) {
  in.insert(instr->GetDestination());
  in.insert(instr->GetSource());
}

void BinaryOpEffector::effect(LiveVariablesT &in) {
  in.erase(instr->GetDestination());
  in.insert(instr->GetOp1());
  in.insert(instr->GetOp2());
}

void IfZEffector::effect(LiveVariablesT &in) {
  in.insert(instr->GetLocation());
}

void ReturnEffector::effect(LiveVariablesT &in) {
  in.insert(instr->GetLocation());
}

void PushParamEffector::effect(LiveVariablesT &in) {
  in.insert(instr->GetLocation());
}

void LCallEffector::effect(LiveVariablesT &in) {
  in.insert(instr->GetLocation());
}

void ACallEffector::effect(LiveVariablesT &in) {
  in.insert(instr->GetLocation());
  in.insert(instr->GetAddress());
}
