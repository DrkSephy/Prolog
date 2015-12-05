%------------------------------
% Main idea
%------------------------------
% 1. B does not know how to drive, meaning
%    that either A or C supports B. 
% 2. C cannot do a crime without A. 
% 3. If one of the robbers is C, then A goes along (guilty)
% 4. If one of the robbers is B:
% 		- C can support, therefore A goes along (guilty)
% 		- A can support, therefore A is guilty (again)
% 		- A lot of goods were stolen (implies > 1 robber)
% 		- Robbers is plural, so we know there are > 1 robbers
% 5. Therefore, A is always guilty.  

%----------
%  Facts 
%----------

% Robber B cannot drive 
% Therefore A and C can drive
can_drive(a).
can_drive(c).

% All three are robbers
robber(a).
robber(b).
robber(c).

% C always commits a crime with A
commits_crime_with(c, a).

%----------
%  Rules 
%----------

% Whoever was left in the truck can obviously drive
left_in(X, truck) :- can_drive(X).

% X is left inside the truck if X commits the crime with Y 
% and Y can drive
left_in(X, truck) :- commits_crime_with(X, Y), can_drive(Y).

% X is guilty if X is a robber and X was left in the truck
% Since we defined that A, B and C are robbers, X is a robber
is_guilty(X) :- robber(X), left_in(X, truck). 