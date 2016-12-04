#include "live_variable.h"
#include "tac.h"

class Effector {
public:
  virtual void effect(LiveVariablesT &in) = 0;
};

class LoadConstantEffector : public Effector {
public:
  LoadConstantEffector(const LoadConstant *instr) : instr(instr) {}

  void effect(LiveVariablesT &in) override;

private:
  const LoadConstant *instr;
};

class LoadStringConstantEffector : public Effector {
public:
  LoadStringConstantEffector(const LoadStringConstant *instr) : instr(instr) {}

  void effect(LiveVariablesT &in) override;

private:
  const LoadStringConstant *instr;
};

class LoadLabelEffector : public Effector {
public:
  LoadLabelEffector(const LoadLabel *instr) : instr(instr) {}

  void effect(LiveVariablesT &in) override;

private:
  const LoadLabel *instr;
};

class AssignEffector : public Effector {
public:
  AssignEffector(const Assign *instr) : instr(instr) {}

  void effect(LiveVariablesT &in) override;

private:
  const Assign *instr;
};

class LoadEffector : public Effector {
public:
  LoadEffector(const Load *instr) : instr(instr) {}

  void effect(LiveVariablesT &in) override;

private:
  const Load *instr;
};

class StoreEffector : public Effector {
public:
  StoreEffector(const Store *instr) : instr(instr) {}

  void effect(LiveVariablesT &in) override;

private:
  const Store *instr;
};

class BinaryOpEffector : public Effector {
public:
  BinaryOpEffector(const BinaryOp *instr) : instr(instr) {}

  void effect(LiveVariablesT &in) override;

private:
  const BinaryOp *instr;
};

class IfZEffector : public Effector {
public:
  IfZEffector(const IfZ *instr) : instr(instr) {}

  void effect(LiveVariablesT &in) override;

private:
  const IfZ *instr;
};

class ReturnEffector : public Effector {
public:
  ReturnEffector(const Return *instr) : instr(instr) {}

  void effect(LiveVariablesT &in) override;

private:
  const Return *instr;
};

class PushParamEffector : public Effector {
public:
  PushParamEffector(const PushParam *instr) : instr(instr) {}

  void effect(LiveVariablesT &in) override;

private:
  const PushParam *instr;
};

class LCallEffector : public Effector {
public:
  LCallEffector(const LCall *instr) : instr(instr) {}

  void effect(LiveVariablesT &in) override;

private:
  const LCall *instr;
};

class ACallEffector : public Effector {
public:
  ACallEffector(const ACall *instr) : instr(instr) {}

  void effect(LiveVariablesT &in) override;

private:
  const ACall *instr;
};
