
nRows(3).
nCols(3).
setQ(3).
valK(4).

rows(1..X) :- nRows(X).
cols(1..X) :- nCols(X).
values(1..X) :- setQ(X).
valuesID(1..M) :- valK(M).

nRno(X+1) :- nRows(X).
nCno(X+1) :- nCols(X).
nRnos(0).
nCnos(0).

% combinations of rows/columns are different
1 { m(T, Row, Col, Val) : values(Val)} 1 :- rows(Row), cols(Col), valuesID(T).

% ----------------------------------------------------------------------------------------------------------------------------
% -------------------------------------------- DIAGONALE L to R --------------------------------------------------------------
% ----------------------------------------------------------------------------------------------------------------------------

checkSubMatrixAUX(Id, Id2, X, Y, Z, W) :- valuesID(Id), valuesID(Id2), rows(Z), cols(W), rows(X), nCno(Y).
checkSubMatrixAUX(Id, Id2, X, Y, Z, W) :- valuesID(Id), valuesID(Id2), rows(Z), cols(W), nRno(X), cols(Y).
checkSubMatrixAUX(Id, Id2, X, Y, Z, W) :- valuesID(Id), valuesID(Id2), rows(Z), cols(W), nRno(X), nCno(Y).
checkSubMatrixAUX(Id, Id2, X, Y, Z, W) :- valuesID(Id), valuesID(Id2), rows(Z), nCno(W), rows(X), cols(Y).
checkSubMatrixAUX(Id, Id2, X, Y, Z, W) :- valuesID(Id), valuesID(Id2), rows(Z), nCno(W), rows(X), nCno(Y).
checkSubMatrixAUX(Id, Id2, X, Y, Z, W) :- valuesID(Id), valuesID(Id2), rows(Z), nCno(W), nRno(X), cols(Y).
checkSubMatrixAUX(Id, Id2, X, Y, Z, W) :- valuesID(Id), valuesID(Id2), rows(Z), nCno(W), nRno(X), nCno(Y).
checkSubMatrixAUX(Id, Id2, X, Y, Z, W) :- valuesID(Id), valuesID(Id2), nRno(Z), cols(W), rows(X), cols(Y).
checkSubMatrixAUX(Id, Id2, X, Y, Z, W) :- valuesID(Id), valuesID(Id2), nRno(Z), cols(W), rows(X), nCno(Y).
checkSubMatrixAUX(Id, Id2, X, Y, Z, W) :- valuesID(Id), valuesID(Id2), nRno(Z), cols(W), nRno(X), cols(Y).
checkSubMatrixAUX(Id, Id2, X, Y, Z, W) :- valuesID(Id), valuesID(Id2), nRno(Z), cols(W), nRno(X), nCno(Y).
checkSubMatrixAUX(Id, Id2, X, Y, Z, W) :- valuesID(Id), valuesID(Id2), nRno(Z), nCno(W), rows(X), cols(Y).
checkSubMatrixAUX(Id, Id2, X, Y, Z, W) :- valuesID(Id), valuesID(Id2), nRno(Z), nCno(W), rows(X), nCno(Y).
checkSubMatrixAUX(Id, Id2, X, Y, Z, W) :- valuesID(Id), valuesID(Id2), nRno(Z), nCno(W), nRno(X), cols(Y).
checkSubMatrixAUX(Id, Id2, X, Y, Z, W) :- valuesID(Id), valuesID(Id2), nRno(Z), nCno(W), nRno(X), nCno(Y).

checkSubMatrixAUX(Id, Id2, X, Y, Z, W) :- rows(X), cols(Y), rows(Z), cols(W), m(Id, X, Y, Val), m(Id2, Z, W, Val), Id != Id2,
                                          checkSubMatrixAUX(Id, Id2, X+1, Y, Z+1, W), 
                                          checkSubMatrixAUX(Id, Id2, X, Y+1, Z, W+1), 
                                          checkSubMatrixAUX(Id, Id2, X+1, Y+1, Z+1, W+1).

checkSubMatrix(Id, Id2) :- valuesID(Id), valuesID(Id2), Id != Id2, rows(X), cols(Y), checkSubMatrixAUX(Id, Id2, X, Y, 1, 1).

:- checkSubMatrix(Id, Id2), valuesID(Id), valuesID(Id2), Id != Id2.

% ----------------------------------------------------------------------------------------------------------------------------
% -------------------------------------------- DIAGONALE R to L --------------------------------------------------------------
% ----------------------------------------------------------------------------------------------------------------------------

checkSubMatrixSxAUX(Id, Id2, X, Y, Z, W) :- valuesID(Id), valuesID(Id2), rows(Z), cols(W), rows(X), nCnos(Y).
checkSubMatrixSxAUX(Id, Id2, X, Y, Z, W) :- valuesID(Id), valuesID(Id2), rows(Z), cols(W), nRnos(X), cols(Y).
checkSubMatrixSxAUX(Id, Id2, X, Y, Z, W) :- valuesID(Id), valuesID(Id2), rows(Z), cols(W), nRnos(X), nCnos(Y).
checkSubMatrixSxAUX(Id, Id2, X, Y, Z, W) :- valuesID(Id), valuesID(Id2), rows(Z), nCnos(W), rows(X), cols(Y).
checkSubMatrixSxAUX(Id, Id2, X, Y, Z, W) :- valuesID(Id), valuesID(Id2), rows(Z), nCnos(W), rows(X), nCnos(Y).
checkSubMatrixSxAUX(Id, Id2, X, Y, Z, W) :- valuesID(Id), valuesID(Id2), rows(Z), nCnos(W), nRnos(X), cols(Y).
checkSubMatrixSxAUX(Id, Id2, X, Y, Z, W) :- valuesID(Id), valuesID(Id2), rows(Z), nCnos(W), nRnos(X), nCnos(Y).
checkSubMatrixSxAUX(Id, Id2, X, Y, Z, W) :- valuesID(Id), valuesID(Id2), nRnos(Z), cols(W), rows(X), cols(Y).
checkSubMatrixSxAUX(Id, Id2, X, Y, Z, W) :- valuesID(Id), valuesID(Id2), nRnos(Z), cols(W), rows(X), nCnos(Y).
checkSubMatrixSxAUX(Id, Id2, X, Y, Z, W) :- valuesID(Id), valuesID(Id2), nRnos(Z), cols(W), nRnos(X), cols(Y).
checkSubMatrixSxAUX(Id, Id2, X, Y, Z, W) :- valuesID(Id), valuesID(Id2), nRnos(Z), cols(W), nRnos(X), nCnos(Y).
checkSubMatrixSxAUX(Id, Id2, X, Y, Z, W) :- valuesID(Id), valuesID(Id2), nRnos(Z), nCnos(W), rows(X), cols(Y).
checkSubMatrixSxAUX(Id, Id2, X, Y, Z, W) :- valuesID(Id), valuesID(Id2), nRnos(Z), nCnos(W), rows(X), nCnos(Y).
checkSubMatrixSxAUX(Id, Id2, X, Y, Z, W) :- valuesID(Id), valuesID(Id2), nRnos(Z), nCnos(W), nRnos(X), cols(Y).
checkSubMatrixSxAUX(Id, Id2, X, Y, Z, W) :- valuesID(Id), valuesID(Id2), nRnos(Z), nCnos(W), nRnos(X), nCnos(Y).

checkSubMatrixSxAUX(Id, Id2, X, Y, Z, W) :- rows(X), cols(Y), rows(Z), cols(W), m(Id, X, Y, Val), m(Id2, Z, W, Val), Id != Id2,
                                            checkSubMatrixSxAUX(Id, Id2, X-1, Y, Z-1, W),
                                            checkSubMatrixSxAUX(Id, Id2, X, Y-1, Z, W-1),
                                            checkSubMatrixSxAUX(Id, Id2, X-1, Y-1, Z-1, W-1).

checkSubMatrixSx(Id, Id2) :- valuesID(Id), valuesID(Id2), Id != Id2, rows(X), cols(Y), nCols(Z), checkSubMatrixAUX(Id, Id2, X, Y, 1, Z).

:- checkSubMatrixSx(Id, Id2), valuesID(Id), valuesID(Id2), Id != Id2.

#show m/4.