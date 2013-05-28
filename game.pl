%
% Data structure:
%
%   player(name, handCards, health, role)
%
%


game([P1|Players], Cards) :-
	round(P1, Players, Cards, mo_pai, nil, nil).

%
%  round(
%     CurrentPlayer,    % Current player
%     OtherPlayers,     % All players expect current player
%     Cards,            % 
%     Stage,            % mo_pai, chu_pai, pan_ding, etc. 
%     PlayingCard,      % Playing card during chu_pai stage
%     TargetPlayer      % Target player
%  )
%

% 摸牌
round({Name,HandCards,Health}, Players, [C1,C2|Cards], mo_pai, nil, nil) :-
        write('Current player: '), writeln(Name),
	append(HandCards, [C1,C2], HandCardsNew),
	round({Name, HandCardsNew,Health}, Players, Cards, chu_pai, nil, nil).
% 出牌
round({P1,HandCards,Health}, Players, Cards, chu_pai, nil, nil) :-
        chooceOneCard(HandCards, OneCard, RemainedHandCards),
        chooceOneTarget(Players, Target),
        round({P1,RemainedHandCards,Health}, Players, Cards, chu_pai, OneCard, Target).

round(Current, [P1|Players], Cards, chu_pai, done, _) :-
	threwCardsAway(Current, CurrentNew),
	append(Players, [CurrentNew], PlayersNew),
	round(P1, PlayersNew, Cards, mo_pai, nil, nil).

% Debugging
round(P, Players, Cards, Stage, PlayingCard, Target) :-
	write('Current player: '), writeln(P),
	write('Players: '), writeln(Players),
	write('Cards: '), writeln(Cards),
	write('Stage: '), writeln(Stage),
	write('Playing card: '), writeln(PlayingCard),
	write('Target: '), writeln(Target).

chooceOneCard(AllCards, ChoosedCard, RemainedCards) :-
	write('Choose one card from '), write(AllCards), writeln(': '),
        read_line_to_codes(user_input, C), atom_codes(ChoosedCard, C),
        removeElement(AllCards, ChoosedCard, RemainedCards).

chooceOneTarget(Players, TargetPlayer) :-
	write('Choose one target player from '), writePlayerNames(Players), writeln(': '),
        read_line_to_codes(user_input, P), atom_codes(TargetPlayer, P).

threwCardsAway({Name, HandCards, Health}, {Name, HandCards, Health}) :-
	length(HandCards, Num), not(Num > Health).
threwCardsAway({Name, HandCards, Health}, Updated) :-
	write('Choose a card from '), write(HandCards), writeln(' and threw away'),
        read_line_to_codes(user_input, C), atom_codes(Card, C),
	removeElement(HandCards, Card, HandCardsNew),
	threwCardsAway({Name, HandCardsNew, Health}, Updated).
	

writePlayerNames([]).
writePlayerNames([{N,_,_}|Other]) :- write(N), write(' '), writePlayerNames(Other).

removeElement(E, done, E).
removeElement([E|R], E, R).
removeElement([H|R], E, [H|R2]) :- removeElement(R, E, R2).
	