%% 3-6: Sorting Lists
-module (excap36).
-export ([qsort/1]).
-export ([merge_sort/1]).

qsort_acc_l([], _Pivot, Acc) -> lists:reverse(Acc);
qsort_acc_l([H|T], Pivot, Acc) ->
	case H<Pivot of
		true ->
			qsort_acc_l(T,Pivot,[H|Acc]);
		false ->
			qsort_acc_l(T,Pivot,Acc)
	end.

qsort_acc_r([], _Pivot, Acc) -> lists:reverse(Acc);
qsort_acc_r([H|T], Pivot, Acc) ->
	case H<Pivot of
		false ->
			qsort_acc_r(T,Pivot,[H|Acc]);
		true ->
			qsort_acc_r(T,Pivot,Acc)
	end.

qsort([]) -> [];
qsort([H|T]) ->
	Pivot = H,
	Left = qsort_acc_l(T,Pivot,[]),
	Right = qsort_acc_r(T,Pivot,[]),
	qsort(Left) ++ [Pivot] ++ qsort(Right).

merge_acc([Lh|Th],[],Acc) -> Acc ++ [Lh|Th];
merge_acc([],[Rh|Th],Acc) -> Acc ++ [Rh|Th];

merge_acc([Lh|Lt],[Rh|Rt], Acc) when Lh<Rh ->
	merge_acc(Lt,[Rh|Rt],Acc ++ [Lh]);

merge_acc([Lh|Lt],[Rh|Rt], Acc) ->
	merge_acc([Lh|Lt],Rt,Acc ++ [Rh]).

merge([Lh|Lt],[Rh|Rt]) when Lh<Rh ->
	merge_acc(Lt,[Rh|Rt],[Lh]);
	
merge([Lh|Lt],[Rh|Rt]) ->
	merge_acc([Lh|Lt],Rt,[Rh]).

%% Test con: 65318724
merge_sort([]) -> [];
merge_sort([H|[]]) -> [H];
merge_sort([H|T]) ->
	Split_point = length([H|T]) div 2,
	{Left,Right} = lists:split(Split_point,[H|T]),
	Left_list = merge_sort(Left),
	Right_list = merge_sort(Right),
	merge(Left_list,Right_list).
