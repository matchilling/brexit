% -----------------------------------------------------------------------------
% BREXIT - A !serious adventure for the Ununited Kingdom
% -----------------------------------------------------------------------------
%
% Copyright (c) 2017 Mathias Schilling <m@matchilling>
%
% For the full copyright and license information, please view the LICENSE
% file that was distributed with this source code.
% -----------------------------------------------------------------------------
:- module(location, [describe/1, path/3]).

% Define paths
path(brussels, w, downing_street).

path(downing_street, e, brussels).
path(downing_street, s, parliament).
path(downing_street, w, washington).

path(golf_course, n, washington).

path(parliament, n, downing_street).

path(washington, e, downing_street).
path(washington, s, golf_course).

% Define locations
describe(brussels) :-
        writeln('You are in Brussels:'),
        writeln('  trigger. - Trigger article 50 of the Lisbon treaty.'),
        writeln('  w.       - Go to London.'),
        nl.

describe(downing_street) :-
        writeln('You are in Downing Street:'),
        writeln('  e. - There is kind of a Gallic village in the,'),
        writeln('       east ~ they call it Brussels.'),
        writeln('  s. - Go to the Parliament.'),
        writeln('  w. - Go west and you will get to Washington.'),
        nl.

describe(golf_course) :-
        writeln('You are at a golf course in the south of Washington.'),
        writeln('  n. - Go to Washington.'),
        nl.

describe(parliament) :-
        writeln('You are at the Parliament.'),
        writeln('  vote. - Start vote on approval of triggering'),
        writeln('          article 50.'),
        writeln('  n.    - Go to Downing Street.'),
        nl.

describe(washington) :-
        writeln('You are in Washington. It seems that nobody'),
        writeln('is here at the moment:'),
        writeln('  s. - There is a golf course in the South.'),
        writeln('  e. - Go to Downing Street in London.'),
        nl.
