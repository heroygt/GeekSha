lead_cards({Player,[Card|HandCards]}, [Card|LeadCards]) :- lead_cards({Player,HandCards}, LeadCards), lead_card(Card).

lead_cards({Player,[_|HandCards]}, LeadCards) :- lead_cards({Player,HandCards}, LeadCards).

lead_cards(_,[]).

lead_card(sha).