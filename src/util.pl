% -----------------------------------------------------------------------------
% BREXIT - A !serious adventure for the Ununited Kingdom
% -----------------------------------------------------------------------------
%
% Copyright (c) 2017 Mathias Schilling <m@matchilling>
%
% For the full copyright and license information, please view the LICENSE
% file that was distributed with this source code.
% -----------------------------------------------------------------------------
:- module(util, [write_italic/1]).

write_italic(Text) :-
        write('\e[3m'), write(Text), write('\e[0m').
