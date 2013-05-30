io_write(W) :- write(W).
io_writeln(W) :- writeln(W).
io_nl :- nl.

io_read(W) :-
        read_line_to_codes(user_input, P), 
        atom_codes(W,P).

io_choose_target(_, TargetPlayer) :- io_read(TargetPlayer).

io_choose_card(_, ChoosedCard) :- io_read(ChoosedCard).

