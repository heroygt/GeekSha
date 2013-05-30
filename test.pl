:-['game.pl'].
% :-['io_test.pl'].
:-['io_console.pl'].


test :- game([{z3, [kill,kill],3}, {l4, [hide,hide],4}, {w5,[health,health],5}], [kill,kill,health,health, kill,kill,hide,hide,kill,kill,health,health,kill,kill,hide,hide,kill,kill,hide,hide]).
console 
