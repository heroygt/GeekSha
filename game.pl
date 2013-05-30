:-['player.pl'].

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
round(P1, Players, Cards, mo_pai, nil, nil) :-
        io_write('Current player: '), writePlayerName(P1), nl,
        playerGetNewCards(P1, Cards, P1New, RemainedCards),
	round(P1New, Players, RemainedCards, chu_pai, nil, nil).
% 出牌
round(P1, Players, Cards, chu_pai, nil, nil) :-
        playerChooseCard(P1, P1New, OneCard),
        chooceOneTarget(Players, Target),
        round(P1New, Players, Cards, chu_pai, OneCard, Target).

round(P1, [P2|Players], Cards, chu_pai, done, _) :-
	playerDisposeCards(P1, P1New),
	append(Players, [P1New], PlayersNew),
	round(P2, PlayersNew, Cards, mo_pai, nil, nil).

% Debugging
round(P, Players, Cards, Stage, PlayingCard, Target) :-
	io_write('Current player: '), io_writeln(P),
	io_write('Players: '), io_writeln(Players),
	io_write('Cards: '), io_writeln(Cards),
	io_write('Stage: '), io_writeln(Stage),
	io_write('Playing card: '), io_writeln(PlayingCard),
	io_write('Target: '), io_writeln(Target).

chooceOneTarget(Players, TargetPlayer) :-
	io_write('Choose one target player from '), writePlayerNames(Players), io_writeln(': '),
        % read_line_to_codes(user_input, P), atom_codes(TargetPlayer, P),
        io_read(TargetPlayer).
	
