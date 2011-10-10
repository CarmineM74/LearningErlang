%% Exercise 3-4: Database Handling Using Lists
-module (db).
-export ([new/0]).
-export ([destroy/1]).
-export ([write/3]).
-export ([read/2]).
-export ([match/2]).
-export ([delete/2]).

new() ->
	[].

destroy(Db) -> 
	ok.
	
write(Key, Element, Db) ->
	[{Key,Element}|Db].


%%read(_, []) ->
%%	{error, instance};
%%
%%read(Key, [{Key,Element}|_]) ->
%%	{ok, Element};
%%
%%read(Key, [{_Other,_Element}|T]) ->
%%	read(Key,T).
	
read(Key,Db) ->
	case Db of
		[{Key,Element}|_] ->
			{ok, Element};
		[{_Other,_Element}|T] ->
			read(Key,T);
		[] ->
			{error,instance}
	end.

match_acc(_Element,[],Acc) -> Acc;

match_acc(Element,[{_Key,Element}|T],Acc) ->
	match_acc(Element,T,[_Key|Acc]);

match_acc(Element,[{_Key,_Other}|T],Acc) ->
	match_acc(Element,T,Acc).
	
match(Element,Db) ->
	match_acc(Element,Db,[]).
	

%%delete_acc(_Key,[],Acc) -> Acc;	
%%
%%delete_acc(Key,[{Key,_Element}|T],Acc) ->
%%	delete_acc(Key,T,Acc);
%%
%%delete_acc(Key,[{_Key,_Element}|T],Acc) ->
%%	delete_acc(Key,T,[{_Key,_Element}|Acc]).
%%
%%delete(Key,Db)->
%%	delete_acc(Key,Db,[]).

delete(Key,[]) -> [];
delete(Key,[{Key,_}|Db]) -> Db;
delete(Key,[H|T]) -> [H|delete(Key,T)].