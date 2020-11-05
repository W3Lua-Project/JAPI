--===================================================
-- Limit Event API s
-- variable, player state, game state, and unit state events
-- ( do NOT change the order of these... )
--===================================================
LESS_THAN                              = ConvertLimitOp(0) ---@type limitop
LESS_THAN_OR_EQUAL                     = ConvertLimitOp(1) ---@type limitop
EQUAL                                  = ConvertLimitOp(2) ---@type limitop
GREATER_THAN_OR_EQUAL                  = ConvertLimitOp(3) ---@type limitop
GREATER_THAN                           = ConvertLimitOp(4) ---@type limitop
NOT_EQUAL                              = ConvertLimitOp(5) ---@type limitop