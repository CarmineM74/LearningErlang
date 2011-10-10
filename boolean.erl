-module (boolean).
-export ([b_not/1]).
-export ([b_and/2]).
-export ([b_or/2]).
-export ([b_nand/2]).

b_not (true) ->
	false;
b_not (false) ->
	true.
	
b_and (true, true) ->
	true;
b_and(_and1, _and2) ->
	false.
	
b_or(false, false) ->
	false;
b_or(_or1,_or2) ->
	true.
	
b_nand(First,Second) ->
	b_not(b_and(First,Second)).