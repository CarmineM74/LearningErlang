-module (problem0).
-export ([start/2]).

start(AnAtom, Fun) ->
	try register(AnAtom, spawn(fun() -> Fun() end)) of
		true ->
			io:format("Successfully registered ~p~n",[AnAtom])
	catch
		_:_ -> {caught, error}
	end.