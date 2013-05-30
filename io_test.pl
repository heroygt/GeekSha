io_write(_). % :- write(W).
io_writeln(_). % :- writeln(W).
io_nl. % :- nl.

io_choose_target([H|_], H).

io_choose_card(_, done).

io_choose_dispose_card([H|_], H).

