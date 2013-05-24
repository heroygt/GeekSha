game(Players, Cards) :-
    deal(Players, Cards, PlayersWithCards).


deal([], _, []).

deal([FirstPlayer|OtherPlayers], [FirstCard, SecondCard|OtherCards], [{FirstPlayer, [FirstCard, SecondCard]}|Other]) :-
    deal(OtherPlayers, OtherCards, Other).
