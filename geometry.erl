-module (geometry).
-export ([area/1]).
area({rectangle, Width, Ht})	-> Width * Ht;
area({circle, R})				-> 3.14159 * R * R;
area (_Other) ->
	{error, unknown_shape}.