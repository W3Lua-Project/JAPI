--============================================================================
-- Boolean Expr API ( for compositing trigger conditions and unit filter funcs...)
--============================================================================
---@param operandA boolexpr
---@param operandB boolexpr
---@return boolexpr
function And(operandA, operandB) end

---@param operandA boolexpr
---@param operandB boolexpr
---@return boolexpr
function Or(operandA, operandB) end

---@param operand boolexpr
---@return boolexpr
function Not(operand) end

---@param func code
---@return conditionfunc
function Condition(func) end

---@param c conditionfunc
function DestroyCondition(c) end

---@param func code
---@return filterfunc
function Filter(func) end

---@param f filterfunc
function DestroyFilter(f) end

---@param e boolexpr
function DestroyBoolExpr(e) end