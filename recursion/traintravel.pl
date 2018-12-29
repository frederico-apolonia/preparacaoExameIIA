directTrain(saarbruecken,dudweiler). 
directTrain(forbach,saarbruecken). 
directTrain(freyming,forbach). 
directTrain(stAvold,freyming). 
directTrain(fahlquemont,stAvold). 
directTrain(metz,fahlquemont). 
directTrain(nancy,metz).

travelFromTo(X, Y) :- directTrain(X, Y); directTrain(Y, X).
travelFromTo(X, Y) :-
    directTrain(X, Z), travelFromTo(Z, Y);
    directTrain(Z, X), travelFromTo(Y, Z).