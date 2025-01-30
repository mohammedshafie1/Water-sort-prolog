:- include('KB.pl').

state(B1, B2, B3, result(pour(X,Y),S)) :-
    state(B1P,B2P,B3P,S),
    pourvalid(X,Y,B1P,B2P,B3P,B1,B2,B3).
	
goal2(S) :-
    state([C1,C1],[C2,C2],[C3,C3],S).



ids(X, L, MaxLimit) :-
    ( call_with_depth_limit(goal2(X), L, R), number(R));
    ( call_with_depth_limit(goal2(X), L, R),R = depth_limit_exceeded,  
      L1 is L + 1, 
      L1 =< MaxLimit,  
      ids(X, L1, MaxLimit));
    ( L > MaxLimit,false).
 
goal(S):-
   ids(S,10,20).
   

state([X1,X2],[Y1,Y2],[Z1,Z2],s0):-
   bottle1(X1,X2),
   bottle2(Y1,Y2),
   bottle3(Z1,Z2).
   
	

pourvalid(1, 2,[H1,T1|_],[H2,T2|_], B3,B1New,B2New,B3):- 
(H1\=e ,H1==T2,H2==e,B2New=[H1,T2],B1New=[e,T1]);
(H1==e,T1==T2,H2==e,B2New=[T1,T2],B1New=[e,e]);
(H1\=e,T2==e,B1New=[e,T1],B2New=[e,H1]).

pourvalid(2, 3,B1,[H2,T2|_],[H3,T3|_],B1,B2New,B3New):- 
(H2\=e ,H2==T3,H3==e,B3New=[H2,T3],B2New=[e,T2]);
(H2==e,T2==T3,H3==e,B3New=[T2,T3],B2New=[e,e]);
(H2\=e,T3==e,B2New=[e,T2],B3New=[e,H2]).

pourvalid(1, 3, [H1,T1|_],B2,[H3,T3|_],B1New,B2,B3New):-
(H1\=e ,H1==T3,H3==e,B3New=[H1,T3],B1New=[e,T1]);
(H1==e,T1==T3,H3==e,B3New=[T1,T3],B1New=[e,e]);
(H1\=e,T3==e,B1New=[e,T1],B3New=[e,H1]).

pourvalid(2, 1, [H1,T1|_],[H2,T2|_],B3,B1New,B2New,B3) :- 
(H2\=e ,H2==T1,H1==e,B1New=[H2,T1],B2New=[e,T2]);
(H2==e,T2==T1,H1==e,B1New=[T2,T1],B2New=[e,e]);
(H2\=e,T1==e,B2New=[e,T2],B1New=[e,H2]).

pourvalid(3, 1, [H1,T1|_],B2,[H3,T3|_],B1New,B2,B3New) :-
(H3\=e ,H3==T1,H1==e,B1New=[H3,T1],B3New=[e,T3]);
(H3==e,T3==T1,H1==e,B1New=[T3,T1],B3New=[e,e]);
(H3\=e,T1==e,B3New=[e,T3],B1New=[e,H3]).

pourvalid(3, 2,B1,[H2,T2|_],[H3,T3|_],B1,B2New,B3New) :- 
(H3\=e ,H3==T2,H2==e,B2New=[H3,T2],B3New=[e,T3]);
(H3==e,T3==T2,H2==e,B2New=[T3,T2],B3New=[e,e]);
(H3\=e,T2==e,B3New=[e,T3],B2New=[e,H3]).

