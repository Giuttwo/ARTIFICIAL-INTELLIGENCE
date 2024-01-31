 

% Define el estado inicial 

initialState(state(3, 3, left, 0, 0)). 

  

% Define el estado final 

goalState(state(0, 0, right, 3, 3)). 

  

% Define las transiciones validas 

valid(state(M1, C1, left, M2, C2)) :- 

    M1 >= 0, C1 >= 0, M2 >= 0, C2 >= 0, 

    M1 >= C1, M2 >= C2. 

  

valid(state(M1, C1, right, M2, C2)) :- 

    M1 >= 0, C1 >= 0, M2 >= 0, C2 >= 0, 

    M1 >= C1, M2 >= C2. 

  

% Define las tranciciones 

move(state(M1, C1, left, M2, C2), state(M1New, C1New, right, M2New, C2New)) :- 

    between(0, 2, M), between(0, 2, C), 

    M1New is M1 - M, C1New is C1 - C, 

    M2New is M2 + M, C2New is C2 + C, 

    valid(state(M1New, C1New, right, M2New, C2New)). 

  

move(state(M1, C1, right, M2, C2), state(M1New, C1New, left, M2New, C2New)) :- 

    between(0, 2, M), between(0, 2, C), 

    M1New is M1 + M, C1New is C1 + C, 

    M2New is M2 - M, C2New is C2 - C, 

    valid(state(M1New, C1New, left, M2New, C2New)). 

% Define el estado printing 

printState(state(M1, C1, Boat, M2, C2)) :- 

    format('Left side: ~d missionaries, ~d cannibals\n', [M1, C1]), 

    format('Boat: ~w\n', [Boat]), 

    format('Right side: ~d missionaries, ~d cannibals\n\n', [M2, C2]). 

% Define la búsqueda recursiva con prints 

path(Start, Start, _). 

path(Start, Goal, Visited) :- 

    move(Start, Next), 

    \+ member(Next, Visited), 

    printState(Next), 

    path(Next, Goal, [Next | Visited]).  

% Para imprimir la solución: 

solve :- 

    initialState(InitialState), 

    goalState(GoalState), 

    printState(InitialState), 

    path(InitialState, GoalState, [InitialState]). 

% Usar “solve.” para obtener la solución. 
