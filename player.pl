%
% Data structure:
%
%   player(name, handCards, health, role)
%
%

writePlayerName({Name, _, _}) :- io_write(Name).

writePlayerNames([]).
writePlayerNames([{N,_,_}|Other]) :- io_write(N), io_write(' '), writePlayerNames(Other).

playerGetNewCards({Name,HandCards,Health}, [C1,C2|Cards], {Name, HandCardsNew, Health}, Cards) :-
        HandCardsNew = [C1,C2|HandCards].

playerChooseCard({Name, HandCards, Health}, {Name, RemainedHandCards, Health}, Card) :-
        io_write('[Play]Choose card: '), io_write(HandCards), io_writeln(':'),
        io_choose_card(HandCards, Card),
        removeElement(HandCards, Card, RemainedHandCards).

playerDisposeCards({Name,HandCards,Health}, {Name,HandCards,Health}) :-
        length(HandCards, Num), not(Num > Health).
playerDisposeCards({Name,HandCards,Health}, PlayerNew) :-
        io_write('[Dispose]Choose cards: '), io_write(HandCards), io_writeln(':'),
        io_choose_dispose_card(HandCards, Card),
        removeElement(HandCards, Card, HandCardsNew),
        playerDisposeCards({Name, HandCardsNew, Health}, PlayerNew).

removeElement(E, done, E).
removeElement([E|R], E, R).
removeElement([H|R], E, [H|R2]) :- removeElement(R, E, R2).
	
