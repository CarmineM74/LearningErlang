-module (lib_misc).
-export ([for/3]).
-export ([odds_and_evens_acc/1]).

for(Max, Max, F) -> [F(Max)];
for(I, Max, F) -> [F(I)|for(I+1,Max,F)].

odds_and_evens_acc(L) -> odds_and_evens_acc(L, [], []).

odds_and_evens_acc([H|T], Odds, Evens) ->
	case (H rem 2) of
		1 -> odds_and_evens_acc(T,[H|Odds],Evens);
		0 -> odds_and_evens_acc(T,Odds,[H|Evens])
	end;
	
odds_and_evens_acc([], Odds, Evens) -> 
	{lists:reverse(Odds), lists:reverse(Evens)}.