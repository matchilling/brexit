% -----------------------------------------------------------------------------
% BREXIT - A !serious adventure for the Ununited Kingdom
% -----------------------------------------------------------------------------
%
% Copyright (c) 2017 Mathias Schilling <m@matchilling>
%
% For the full copyright and license information, please view the LICENSE
% file that was distributed with this source code.
% -----------------------------------------------------------------------------
:-
    retractall(at(_, _)),
    retractall(person_at(_, _)),
    retractall(i_am_at(_)).

:-
    use_module('location'),
    use_module('util').

:-  initialization welcome_msg.

% Define current location
i_am_at(downing_street).

% Write game instructions
help :-
        nl,
        writeln('Enter commands using standard Prolog syntax.'),
        writeln('Available commands are:'),
        nl,
        writeln('start.      -- to start the game.'),
        writeln('n. s. e. w. -- to go in that direction.'),
        writeln('look.       -- to look around.'),
        writeln('help.       -- to show this message.'),
        writeln('version.    -- to show the version information.'),
        writeln('quit.       -- to end the game and quit.'),
        nl.

% Write welcome message
welcome_msg :-
        nl,
        nl,
        writeln('888~~\\  888~-_   888~~  Y88b    / 888 ~~~888~~~ '),
        writeln('888   | 888   \\  888___  Y88b  /  888    888    '),
        writeln('888 _/  888    | 888      Y88b/   888    888    '),
        writeln('888  \\  888   /  888      /Y88b   888    888    '),
        writeln('888   | 888_-~   888     /  Y88b  888    888    '),
        writeln('888__/  888 ~-_  888___ /    Y88b 888    888    '),
        nl,
        writeln('A !serious adventure for the Ununited Kingdom.'),
        writeln('Part I - Road to Brexit'),
        nl,
        writeln('Type "\e[1mstart.\e[0m" to begin the game.'),
        nl, nl.

% Define game actions
start :-
        writeln('Hey there, it\'s Nigel here! Congrats, you have'),
        writeln('just been named as Prime Minister of the Great'),
        writeln('Ununited Kingdom. Ohh boy, I don\'t wanna be in'),
        writeln('your shoes right now haha!'),
        nl,
        writeln('Your task is to do the heavy lifting and'),
        writeln('withdraw from the European Union.'),
        nl,
        writeln('PS: If you need any help, don\'t ask me! Type'),
        writeln('"\e[1mhelp.\e[0m" instead to get qualified support.'),
        nl,
        look.

look :-
        i_am_at(Place),
        describe(Place),
        notice_persons_at(Place),
        nl.

% Go to location
n :- go(n).
e :- go(e).
s :- go(s).
w :- go(w).

% This rule tells how to move in a given direction.
go(Direction) :-
        i_am_at(Here),
        path(Here, Direction, There),
        retract(i_am_at(Here)),
        assert(i_am_at(There)),
        look, !.

go(_) :-
        writeln('Ohh boy, stay focused! You cannot go into that direction.').

% Define persons
person_at('The Donald', golf_course).

% Rules set up a loop to mention all persons in your vicinity.
notice_persons_at(Place) :-
        person_at(X, Place),
        write('Apparently '),
        write(X),
        writeln(' is here, that is your'),
        writeln('chance for a quick chat. Type "\e[1mtalk.\e[0m" to start'),
        writeln('start the conversation').

notice_persons_at(_).

% Dialog utils
say(Person, Text) :-
        write('\e[1m'), write(Person), write(' :\e[0m  '),
        writeln(Text).

finish :-
        nl,
        at(confirmation_from_brussels, hand),
        writeln('You\'ve finished "Part I - Road to Brexit".'),
        writeln('successfully!'),
        nl,
        writeln('Stay tuned for the next part and subscribe'),
        writeln('to "https://github.com/matchilling/brexit" ...'),
        nl,
        writeln('Type "\e[1mquit.\e[0m" to end the game and quit.'),
        nl, !.

quit :-
        halt.

talk :-
        i_am_at(golf_course),
        person_at('The Donald', golf_course),
        say('You       ', 'Hey Donald, got a second?.'),
        nl,
        say('The Donald', 'Sure, for you always buddy!'),
        nl,
        say('You       ', 'You know, we are about to leave the EU and'),
        say('You       ', 'I am keen to know your position in the'),
        say('You       ', 'Brexit matter and if I can count on you.'),
        nl,
        say('The Donald', 'Ehhmm ... wait'),
        say('The Donald', 'Hey Siri, what\'s the fuss about Brexit?!?!?'),
        nl,
        say('Siri      ', 'Brexit is a term for the potential or hypothetical'),
        say('Siri      ', 'departure of the United Kingdom from the European Union.'),
        nl,
        write_italic('... The Donald thinks for a moment'),
        nl,
        say('The Donald', 'I love Brexit! I do very well with Brexit.'),
        say('The Donald', 'It is the most important meal of the day.'),
        nl,
        say('You       ', 'Great to hear that. Can we make a trade deal then?'),
        say('You       ', 'I only need your signature down here ...'),
        nl,
        write_italic('... The Donald signs the documents and continues'),
        assert(at(trade_agreement, hand)),
        nl,
        say('The Donald', 'But Obama, okay? Obama hates Brexit. Hates it!'),
        say('The Donald', 'In fact, people tell me that, as a Muslim, he'),
        say('The Donald', 'skips Brexit in observance of Ramada.'),
        say('The Donald', 'Boy, I have never built a Ramada, they are'),
        say('The Donald', 'absolute trash.'),
        nl,
        say('You       ', 'Ohh my gosh, I did not know that! Thanks for the chat'),
        say('You       ', 'I need to go now.'),
        nl,
        say('The Donald', 'You are welcome buddy. Say hello to Boris from me.'),
        nl,
        say('You       ', 'Bye!'),
        nl.

trigger :-
        i_am_at(brussels),
        at(permission_to_trigger_article_50, hand),
        writeln('Congrats, you have triggered article 50 successfully!'),
        writeln('Let the bloody negotiations begin ...'),
        assert(at(confirmation_from_brussels, hand)),
        !, finish.

trigger :-
        i_am_at(brussels),
        \+ at(permission_to_trigger_article_50, hand),
        writeln('Sorry, you cannot trigger article 50 without'),
        writeln('prior approval from your Parliament.'),
        nl, fail.

version :-
        nl,
        writeln('Brexit 1.0.0 - copyright Mathias Schilling <m@matchilling>'),
        nl.

vote :-
        i_am_at(parliament),
        at(trade_agreement, hand),
        writeln('Congrats, your bill passed the House of Commons'),
        writeln('and you have been given permission to trigger'),
        writeln('article 50 of the Lisbon treaty!'),
        assert(at(permission_to_trigger_article_50, hand)),
        !, nl.

vote :-
        i_am_at(parliament),
        \+ at(trade_agreement, hand),
        writeln('The vote failed as members of the House of'),
        writeln('Commons argued that Britain\'s economy would'),
        writeln('certainly struggle without access to the'),
        writeln('single market after withdrawing from the EU.'),
        nl, fail.
