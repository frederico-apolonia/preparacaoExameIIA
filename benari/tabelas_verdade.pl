:- [ops,def,intext,io,tt, cnfprop, resolv].
% a) (A ∧ (B ∨ C)) ≡ ((A ∧ B) ∨ (A ∧ C))
% create_tt((a ^ (b v c)) <-> ((a ^ b) v (a ^ c))).

% b) (A ∨ B) ≡ ¬(¬A ∧ ¬B)
% create_tt((a v b) <-> ~(~a ^ b)).

% c) (A ∧ B) ≡ (A ↔ B) ↔ (A ∨ B)
% create_tt((a ^ b) <-> ((a <-> b) <-> (a v b))).