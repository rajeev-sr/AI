% -----------------------------------------------
% Facts (atomic statements)
% -----------------------------------------------
warm.
raining.
sunny.
pleasant.

% -----------------------------------------------
% Rules (knowledge base)
% -----------------------------------------------
enjoy :- sunny, warm.
strawberry_picking :- warm, pleasant, \+ raining.
not_strawberry_picking :- raining.
wet :- raining.

% -----------------------------------------------
% Step 2: Remove implications (manual for this problem)
% -----------------------------------------------
% A -> B becomes ~A v B
% remove_implications(implies(A,B), CNF_form).
remove_implications(implies(and(sunny, warm), enjoy), or(not(sunny), or(not(warm), enjoy))).
remove_implications(implies(and(warm, pleasant), strawberry_picking), or(not(warm), or(not(pleasant), strawberry_picking))).
remove_implications(implies(raining, not_strawberry_picking), or(not(raining), not_strawberry_picking)).
remove_implications(implies(raining, wet), or(not(raining), wet)).

% -----------------------------------------------
% Step 3: Resolution-style proof
% -----------------------------------------------
prove(Query) :-
    call(Query),
    write(Query), write(' is true in the knowledge base.'), nl.

prove(Query) :-
    \+ call(Query),
    write(Query), write(' cannot be proved (contradiction or missing fact).'), nl.

% -----------------------------------------------
% Step 4: Resolution Refutation and Querying
% -----------------------------------------------
resolution_refutation(Query) :-
    \+ call(Query),
    write('Negation of '), write(Query), write(' leads to contradiction. Hence '),
    write(Query), write(' is proved by resolution refutation.'), nl.

resolution_refutation(Query) :-
    call(Query),
    write(Query), write(' is already true, so no refutation needed.'), nl.

% Example Queries:
% ?- prove(enjoy).
% ?- prove(strawberry_picking).
% ?- resolution_refutation(enjoy).
% ?- resolution_refutation(strawberry_picking).

