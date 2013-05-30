%
% Data structure:
%
%   player(name, handCards, health, role)
%
%

writePlayerName({Name, _, _}) :- write(Name).

writePlayerNames([]).
writePlayerNames([{N,_,_}|Other]) :- write(N), write(' '), writePlayerNames(Other).

playerGetNewCards({Name,HandCards,Health}, [C1,C2|Cards], {Name, HandCardsNew, Health}, Cards) :-
        HandCardsNew = [C1,C2|HandCards].

playerChooseCard({Name, HandCards, Health}, {Name, RemainedHandCards, Health}, Card) :-
        write('Choose card from: '), write(HandCards), writeln(':'),
        read_line_to_codes(user_input, C), atom_codes(Card, C),
        removeElement(HandCards, Card, RemainedHandCards).

playerDisposeCards({Name,HandCards,Health}, {Name,HandCards,Health}) :-
        length(HandCards, Num), not(Num > Health).
playerDisposeCards({Name,HandCards,Health}, PlayerNew) :-
        write('Choose a card from '), write(HandCards), writeln(' to dispose.'),
        read_line_to_codes(user_input, C), atom_codes(Card, C),
        removeElement(HandCards, Card, HandCardsNew),
        playerDisposeCards({Name, HandCardsNew, Health}, PlayerNew).

removeElement(E, done, E).
removeElement([E|R], E, R).
removeElement([H|R], E, [H|R2]) :- removeElement(R, E, R2).
	
