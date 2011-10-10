%% 3-5: Manipulating Lists
-module (excap35).
-export ([filter/2]).
-export ([concatenate/1]).
-export ([reverse/1]).
-export ([flatten/1]).

filter_acc([],_I,Acc) -> lists:reverse(Acc);
filter_acc([H|T],I,Acc) when H > I ->
	filter_acc(T,I,Acc);
filter_acc([H|T],I,Acc) when H =< I ->
	filter_acc(T,I,[H|Acc]).
	
filter(L,I) ->
	filter_acc(L,I,[]).

reverse_acc([],Acc) -> Acc;
reverse_acc([H|T],Acc) ->
	reverse_acc(T,[H|Acc]).

reverse([H|T]) ->
	reverse_acc(T,[H]).

concatenate_helper([],GenAcc) -> lists:reverse(GenAcc);
concatenate_helper([H|T],GenAcc) ->
	concatenate_single_list(H,T,GenAcc).

concatenate_single_list([],Lists,GenAcc) -> concatenate_helper(Lists,GenAcc);
concatenate_single_list([H|T],Lists,GenAcc) ->
			concatenate_single_list(T,Lists,[H|GenAcc]).
			
concatenate(Lists) ->
	concatenate_helper(Lists,[]).

flatten_helper([],Acc) -> Acc;
flatten_helper([H|T], Acc) ->
		L1 = flatten_helper(H,Acc),
		L2 = flatten_helper(T,Acc),
		concatenate([L1,L2]);
flatten_helper(Item,Acc) -> [Item|Acc].

flatten([]) -> [];
flatten(Lists) ->
	flatten_helper(Lists,[]).