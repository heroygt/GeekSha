game(InitPlayers, Cards) :-
    deal(InitPlayers, Cards, Players, RemainingCards),
    play(Players, RemainingCards).

deal([], Cards, [], Cards).
deal([P1|Players], [C1,C2|Cards], [{P1, [C1,C2]}|Other], RemainingCards) :-
    deal(Players, Cards, Other, RemainingCards).

play([{P1Name,P1Cards}|Players], [C1,C2|Cards]) :-
    append([C1, C2], P1Cards, P1Cards2),
    write(P1Name), write(' has cards '), writeln(P1Cards2), 
    writeln('Choose a card:'),
    read_line_to_codes(user_input, C), atom_codes(CardToUse, C),
    write('There are players: '), writePlayers(Players), nl,
    writeln('Choose a target:'),
    read_line_to_codes(user_input, P), atom_codes(TargetPlayer, P),
    removeUsedCard(P1Cards2, P1Cards3, CardToPlay), !,
    write(P1Name), write(' has cards '), write(P1Cards3), writeln(' left.').
%%    play([{P1Name, P1Cards3}|Players], Cards).
    
removeUsedCard([UsedCard|Cards], Cards, UsedCard).
removeUsedCard([C1|CardsBefore], [C1|CardsAfter], UsedCard) :-
    removeUsedCard(CardsBefore, CardsAfter, UsedCard).    

writePlayer({P1Name,_}) :- write(P1Name), write(' ').

writePlayers([]).
writePlayers([P1|Players]) :-
    writePlayer(P1),
    writePlayers(Players).
