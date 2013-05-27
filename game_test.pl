:- ['game.pl'].
  
:- Players = [zhang3, li4, wang5], 
   Cards = [kill, hide, health, hide, kill, health, kill, kill],
   
   deal(Players, Cards, Result, RemainingCards),  
    
   Result = [{zhang3, [kill, hide]}, {li4, [health, hide]}, {wang5, [kill, health]}],
   RemainingCards = [kill, kill].

:- removeUsedCard([kill, hide, hide], CardsAfter, kill),
   CardsAfter = [hide, hide].

:- removeUsedCard([kill, hide, hide], CardsAfter, hide),
   CardsAfter = [kill, hide].
