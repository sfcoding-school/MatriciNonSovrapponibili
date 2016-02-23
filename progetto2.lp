
nRows(2).
nCols(3).
setQ(2).
valK(2).

rows(1..X) :- nRows(X).
cols(1..X) :- nCols(X).
values(1..X) :- setQ(X).
valuesID(1..M) :- valK(M).

1 { m(T, Row, Col, Val) : values(Val)} 1 :- rows(Row), cols(Col), valuesID(T).

% ----------------------------------------------------------------------------------------------------------------------------
% -------------------------------------------- DIAGONALE L to R --------------------------------------------------------------
% ----------------------------------------------------------------------------------------------------------------------------

checkSubMatrixSXAUX(Id, Id2, X, Y) :- rows(A), cols(B), X <= A, Y <= B, rows(X), cols(Y), valuesID(Id), valuesID(Id2), Id != Id2, m(Id, A, B, Val), m(Id2, A-X+1, B-Y+1, Val2), Val != Val2.

checkSubMatrixSX(Id, Id2) :- valuesID(Id), valuesID(Id2), Id != Id2, rows(X), cols(Y), not checkSubMatrixSXAUX(Id, Id2, X, Y).

:- checkSubMatrixSX(Id, Id2), valuesID(Id), valuesID(Id2), Id != Id2.

% ----------------------------------------------------------------------------------------------------------------------------
% -------------------------------------------- DIAGONALE R to L --------------------------------------------------------------
% ----------------------------------------------------------------------------------------------------------------------------

checkSubMatrixDXAUX(Id, Id2, X, Y) :- rows(A), cols(B), X <= A, B <= Y, rows(X), cols(Y), valuesID(Id), valuesID(Id2), Id != Id2, m(Id, A, B, Val), m(Id2, A-X+1, M-(Y-B), Val2), nCols(M), Val != Val2.

checkSubMatrixDX(Id, Id2) :- valuesID(Id), valuesID(Id2), Id != Id2, rows(X), cols(Y), not checkSubMatrixDXAUX(Id, Id2, X, Y).

:- checkSubMatrixDX(Id, Id2), valuesID(Id), valuesID(Id2), Id != Id2.

%#show m/4.