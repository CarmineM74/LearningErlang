%% Evaluating 3-8: Evaluating and Compiling Expressions
-module (excap38).
-export ([parse/1]).

%% Input: ((2+3)-4)
%% Output: {minus, {plus, {num, 2}, {num,3}}, {num, 4}

parse(Stack, []) ->
	hd(Stack);

parse(Stack, [$~|T]) ->
	Expr = parse(Stack,T),
	{neg,Expr};

parse(Stack, [H|T]) when H == $+; H == $-; H == $* ->
	[LeftTerm|PrevStack] = Stack,
	{Expr, ModifiedStack, StringLeft} = parse(PrevStack,T),
	OperationName = case H of
		$+ -> plus;
		$- -> minus;
		$* -> times
	end,
	parse([{OperationName,LeftTerm,Expr}|ModifiedStack],StringLeft);

parse(Stack, [H|T]) when H >= $0, H =< $9 ->
	NewStack = [{num,H-$0}|Stack],
	parse(NewStack,T);
	
parse(Stack, [$(|T]) ->
	Expr = parse(Stack,T),
	parse([Expr|Stack],T);

parse(Stack, [$)|T]) ->
	[Expr|ModifiedStack] = Stack,
	{Expr,ModifiedStack,T}.
	
parse(Expression) ->
	parse([],Expression).