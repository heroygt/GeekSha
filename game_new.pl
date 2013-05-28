%
% Data structure:
%   player(name, role, health, handCards)
% 

game([P1|Players], Cards) :-
	round(P1, Players, Cards, mo_pai, nil, nil, nil).

%
%  round(CurrentPlayer, OtherPlayers, Cards, Stage, PlayingCard, TargetPlayer, NextPlayer)
%
%   CurrentPlayer = Current player
%   OtherPlayers  = Players expect CurrentPlayer
%   Cards  =  
%   Stage  = mo_pai, chu_pai, panding, etc.
%

% 摸牌
round({Name,HandCards}, Players, [C1,C2|Cards], mo_pai, _, _, _, _) :-
	append(HandCards, [C1,C2], HandCardsNew),
	round({Name, HandCardsNew}, Players, Cards, chu_pai, _, _, _, _).
% 
round(P1, Players, Cards, chu_pai, _, _, _, _) :-
	