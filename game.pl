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
        io_write('[Begin]Player: '), io_write(P1), io_nl,
        playerGetNewCards(P1, Cards, P1New, RemainedCards),
	round(P1New, Players, RemainedCards, chu_pai, nil, nil).
% 出牌
round(P1, Players, Cards, chu_pai, nil, nil) :-
        playerChooseCard(P1, P1New, OneCard),
        chooceOneTarget(Players, Target),
        round(P1New, Players, Cards, chu_pai, OneCard, Target).

% 弃牌
round(P1, [P2|Players], Cards, chu_pai, done, _) :-
	playerDisposeCards(P1, P1New),
	append(Players, [P1New], PlayersNew),
	round(P2, PlayersNew, Cards, mo_pai, nil, nil).

round(P1, Players, Cards, chu_pai, kill, Target) :-
        playerChooseCard(Target, TargetNew, Card),
        playerMeetKill(TargetNew, Card, TargetNew2),
        playerUpdate(Players, TargetNew2, PlayersNew),
        round(P1, PlayersNew, Cards, chu_pai, nil, nil).

% Debugging
round(P, Players, Cards, Stage, PlayingCard, Target) :-
        writeln('----- begin of final result ------'),
	write('Current player: '), writeln(P),
	write('Players: '), writeln(Players),
	write('Cards: '), writeln(Cards),
	write('Stage: '), writeln(Stage),
	write('Playing card: '), writeln(PlayingCard),
	write('Target: '), writeln(Target),
        writeln('----- end of final result ------').

chooceOneTarget(Players, TargetPlayer) :-
	io_write('[Target] Choose target: '), writePlayerNames(Players), io_writeln(': '),
        io_choose_target(Players, TargetPlayerName),
        playerFindByName(Players, TargetPlayerName, TargetPlayer).
        	
