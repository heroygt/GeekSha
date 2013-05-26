game(InitPlayers, Cards) :-
    deal(InitPlayers, Cards, Players, RemainingCards).

deal([], Cards, [], Cards).
deal([P1|Players], [C1,C2|Cards], [{P1, [C1,C2]}|Other], RemainingCards) :-
    deal(Players, Cards, Other, RemainingCards).

