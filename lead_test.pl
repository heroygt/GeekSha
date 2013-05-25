:- ['lead.pl'].
  
:- PlayersWithHandCards = {li4, [shan, shan, tao, shan]},
   
   lead_cards(PlayersWithHandCards, LeadCards),
    
   LeadCards = [].
   
:- PlayersWithHandCards = {li4, [sha, shan, tao, sha]},
   
   lead_cards(PlayersWithHandCards, LeadCards),
    
   LeadCards = [sha, sha].
