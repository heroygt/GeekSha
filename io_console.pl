io_write(W) :- write(W).
io_writeln(W) :- writeln(W).
io_nl :- nl.

read_from_console(W) :-
        read_line_to_codes(user_input, P), 
        atom_codes(W,P).

io_choose_target(_, TargetPlayer) :- read_from_console(TargetPlayer).

io_choose_card(_, ChoosedCard) :- read_from_console(ChoosedCard).

io_choose_dispose_card(_, DisposedCard) :- read_from_console(DisposedCard).

