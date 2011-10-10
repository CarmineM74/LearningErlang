-module (excap3).
-export ([sum/1]).
-export ([sum/2]).
-export ([sum_r/2]).
-export ([sum_a/2]).
-export ([create/1]).
-export ([create_reverse/1]).
-export ([print_int/1]).
-export ([print_even_int/1]).

%% Exercise 3-1: Evaluatin Expressions
sum(0) -> 0;
sum(N) when N > 0 ->
	N + sum(N-1).
	
%% Non recursive solution	
sum(N,M) when N > M ->
	error(n_greater_than_m);
	
sum(N,M) when N =< M ->
	sum(M)-sum(N)+N.
	
%% Recursive solution
sum_r(N,M) when N > M ->
	error(n_greater_than_m);
sum_r(N,M) when N == M ->
	M;
sum_r(N,M) when N < M ->
	N + sum_r(N+1,M).
	
%% Tail Recursive solution
sum_acc(N,N,Sum) -> Sum+N;
sum_acc(N,M,Sum) -> 
	sum_acc(N+1,M,Sum+N).

sum_a(N,M) when N > M ->
	error(n_greater_than_m);

sum_a(N,M) ->
	sum_acc(N,M,0).


%% Exercise 3-2: Creating Lists
create_acc(Limit,Limit,Acc) -> [Limit|Acc];
create_acc(Cur,Limit,Acc) ->
	create_acc(Cur-1,Limit,[Cur|Acc]).

create(N) when N == 0 -> [];
create(N) ->
	create_acc(N,1,[]).
	
create_acc_rev(Limit,Limit,Acc) -> Acc;
create_acc_rev(Cur,Limit,Acc) ->
	create_acc_rev(Cur+1,Limit,[Cur+1|Acc]).

create_reverse(N) when N == 0 -> [];
create_reverse(N) ->
	create_acc_rev(1,N,[1]).
	

%% Exercise 3-3: Side Effects
print_int_r(Cur, N) when Cur > N -> ok;
print_int_r(Cur, N) ->
	io:format("Number: ~p~n",[Cur]),
	print_int_r(Cur+1, N).
	
print_int(N) ->
	print_int_r(1,N).

print_even_int_r(Cur, N) when Cur > N -> ok;
print_even_int_r(Cur, N) ->
	io:format("Number: ~p~n",[Cur]),
	print_even_int_r(Cur+2, N).
	
print_even_int(N) ->
	print_even_int_r(2,N).
	