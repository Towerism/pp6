#ifndef _H_LIVE_VARIABLE
#define _H_LIVE_VARIABLE

#include "df_base.h"
#include "tac.h"

#include <set>

typedef std::set<const Location *> LiveVariablesT;

class LiveVariable
    : public DataFlow<LiveVariablesT, ControlFlowGraph::ReverseFlow> {
public:
  LiveVariable(ControlFlowGraph &cfg) : DataFlow(cfg) {}

protected:
  LiveVariablesT init() override;
  LiveVariablesT top() override;
  LiveVariablesT effect(const Instruction *instr, const LiveVariablesT &in);
  LiveVariablesT meet(const LiveVariablesT &a, const LiveVariablesT &b);
};

#endif
