                            UNIX System Programming
                           Programming Assignment #3

Due: Monday, May 4  at  11:59 pm.

Submission method: You will post to the course website, just like the previous
                   assignment. 

Submission rules: I REQUIRE you to FOLLOW THESE RULES:

                  1. Submit one file named "<your student ID>.PA3"
                     This file will be a csh or tcsh script with the first
                     line of the file being #!/usr/bin/csh or #!/usr/bin/tcsh
                     or #!/bin/csh or #!/bin/tcsh or whatever path your system
                     uses for cshell.
                     Your script will use the tar file from the previous
                     homework, but it won't change it -- so that tar file is
                     not submitted for this assignment.
                     
                  2. Submissions made after the deadline will be ignored.
                     (That means: no late submissions on this assignment.)
                     (By the way, assignments are a significant part of your
                      grade. So start early and ask questions.)
                  
                  This is a large class. Unless each of you follows the above
                  rules, the TAs' work becomes so hard. So I INSIST that you 
                  FOLLOW the above rules. If you don't, we won't accept your 
                  homework.

                  If you have questions about these rules, you may post your 
                  questions to the course website.


Getting help:   - The Professor has office hours on Monday from 12:30-2:30, 
                  and on Friday from 10:00-12:00, in room 9037.  He can also 
                  be reached by email.
                - The TAs are also available to answer your questions.
                - Questions about the assignment can be posted to the 
                  Discussion Forum.
                - You may also discuss the ideas of the assignment with your
                  classmates. Such discussions can be quite helpful to your 
                  learning -- IF you ONLY talk about the general concepts of
                  the steps of the assignment.
                  - If, however, you tell other students the specific details
                    of your implementation, then you are not helping each other
                    to learn; you are just doing the work for them.
                    In other words, you are cheating. You CANNOT show another
                    student ANY part of the answer to the assignment.

Cheating policy:  We encourage students to form study groups. But this does not
                  mean sharing code. If students are found to be sharing work,
                  they can receive a 0 for the entire course, or worse.
                  It is cheating to let another student see your work, or to 
                  let them look over your shoulder when your code is on the
                  screen.
                  A good way to know you cheated: if you have code that is in
                  your solution just because another student told you to put
                  it there, but you don't actually understand it.
                  If you are still unsure, you can ask the TA for more
                  explanation.
                  We always look for evidence of cheating, so don't do it.
                  (In any event, even if you do not get caught, those who 
                  copy the homework will not learn the material, so they 
                  will fail the exam.)

Most Important    The programming assignments are a large part of the grade.
Things to Know:   This large point value means that, if you don't do them, you
                  may fail.
                  The large point value also explains why the policy against
                  cheating is strictly enforced.
                  

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 - - - - - - - - - - - - - - -  Project Overview - - - - - - - - - - - - - - -
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 
You will improve upon the previous homework, by implementing it as a C-shell
script. You will also add some new commands from the game.

Many of the commands use objects and give error messages when those objects are
missing or unknown. Although there are different commands, the error messages
overlap. So a good implementation of the game should handle the error messages
of the various commands before you get to the part of the code to implement
those commands. Thus, when you get to the implementation part, you will know
that the provided objects are legal.

Your program will be a infinite while loop. At the top you print the ">" and
read the player's input with "$<". You then look for errors in the input. If
the input is OK, you use a switch statement to perform the individual commands.

We will now discuss how individual commands will be changed from the previous
programming assignment...


- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 - - - - - - - - - - - - - -  Command Discussion - - - - - - - - - - - - - - -
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 
Commands that behave just like the previous homework (except se):
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

These are: l, n, e, s, w, ne, se, nw, sw, and dig.

Now when we say that they "behave the same", we mean that they print the same
messages and change directories in the same way.
We do not mean that they are implemented the same. For example, C-shell does
not have the "2>" feature. But it does have if and else statements that allow
us to not need to use command coordination.

We do not mean that these will still be implemented as aliases.
No, you C-shell script must us the "$<" variable to read input, then use a
switch statement to implement the cases.

Moreover, you must implement all 8 of the move commands (n,e,s,w,ne,se,nw,sw)
within just one case block. And you will need to use exactly 2 case-statements
to catch the 8 commands. And you will need to remember to put those 2 case-
statements on separate lines.


Actually, there is one change in the way one of these commands works, compared
to the previous homework:

If you type "se" when you are with the bear, then you get:
>se
Bear hangout
You are standing at the end of a road.  A passage leads back to the
northwest.
There is a ferocious bear here!
> se
The bear is very annoyed that you would be so presumptuous as to try
and walk right by it.  He tells you so by tearing your head off.

You are dead.
You have scored 0 out of a possible 90 points.
%

So you need to, in this case, print the above message and exit your script.


_______________________________________________________________________________

Commands that behave a little differently than the previous homework:
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


The new behavior of the x command:
- - - - - - - - - - - - - - - - - 

As we noted in the earlier homework, the actual dunnet game was better at using
objects than our implementation was:

% emacs -batch -l dunnet

Dead end
You are at a dead end of a dirt road.  The road goes to the east.
In the distance you can see that it will eventually fork off.  The
trees here are very tall royal palms, and they are spaced equidistant
from each other.
There is a shovel here.
>x shovel
It is a normal shovel with a price tag attached that says $19.99.
>x lamp
The lamp is hand-crafted by Geppetto.
>x tree
They are palm trees with a bountiful supply of coconuts in them.
>x boulder
I don't see that here.
>x xyz
I don't know what that is.
>

See that it has different error messages for:
  - non-objects: things that don't exist in the game (like "xyz").
  - missing objects: things that are in the game, but not in the current
    location (like the boulder was not seen in the first room).
See also that you can examine objects that are either in your location (like
the shovel) or are in your inventory (like the lamp).

In this new homework, your x command will need to work like the actual game:
 - Work with objects in . OR in ~/I
 - Give different messages for non-objects than for missing objects.
   Now, to identify non-objects, one could create an array of all of objects.
   But I will instead require you to look for the object in the ~/O directory.



The new behavior of the get command:
- - - - - - - - - - - - - - - - - - 

You need to generate all of the following messages:
$ emacs -batch -l dunnet

Dead end
You are at a dead end of a dirt road.  The road goes to the east.
In the distance you can see that it will eventually fork off.  The
trees here are very tall royal palms, and they are spaced equidistant
from each other.
There is a shovel here.
>get boulder
I do not see that here.
>get xyz
I don't know what that is.
>get lamp
I do not see that here.
>get shovel
Taken.
>get tree
You cannot take that.
>take tree
You cannot take that.
>

Notice that, unlike x, get does not look in ~/I
Notice also that, unlike x, some objects (such as the tree) are un-gettable.
Now, to identify un-gettable objects, one could create an array of all of
such objects. But I will instead require you to use a wildcard pattern that
only matches to one set of filenames in the ~/O directory. (Depending on your
preference, you can match to the gettable OR to the un-gettable).
Finally, notice that "take" is another way to say "get".



The new behavior of the drop command:
- - - - - - - - - - - - - - - - - - -

Consider:

% emacs -batch -l dunnet

Dead end
You are at a dead end of a dirt road.  The road goes to the east.
In the distance you can see that it will eventually fork off.  The
trees here are very tall royal palms, and they are spaced equidistant
from each other.
There is a shovel here.
>get shovel
Taken.
>drop lamp
Done.
>throw shovel
Done.
>l
Dead end
You are at a dead end of a dirt road.  The road goes to the east.
In the distance you can see that it will eventually fork off.  The
trees here are very tall royal palms, and they are spaced equidistant
from each other.
There is a shovel here.
There is a lamp nearby.
>

Notice that "throw" is another way to say "drop".

Other than that, the behavior is the same as the previous homework. But there
is an implementation difference: you won't use a drop.sh file -- everything
goes into your one C-shell script.



The new behavior of the quit command:
- - - - - - - - - - - - - - - - - - -

Consider:
% emacs -batch -l dunnet

Dead end
You are at a dead end of a dirt road.  The road goes to the east.
In the distance you can see that it will eventually fork off.  The
trees here are very tall royal palms, and they are spaced equidistant
from each other.
There is a shovel here.
>quit

You have scored 0 out of a possible 90 points.
%

So quit prints a message then exits your script. (In this homework, the
player's score is always 0, because points come later in the game.)


_______________________________________________________________________________

Commands that were not in the previous homework:
- - - - - - - - - - - - - - - - - - - - - - - -


The climb command:
- - - - - - - - - 

Consider:

% emacs -batch -l dunnet

Dead end
You are at a dead end of a dirt road.  The road goes to the east.
In the distance you can see that it will eventually fork off.  The
trees here are very tall royal palms, and they are spaced equidistant
from each other.
There is a shovel here.
>e
E/W Dirt road
You are on the continuation of a dirt road.  There are more trees on
both sides of you.  The road continues to the east and west.
There is a large boulder here.
>climb tree
You manage to get about two feet up the tree and fall back down.  You
notice that the tree is very unsteady.
>climb boulder
You can't climb that.
>

Actually, the tree is the only thing you can try to climb. And even climbing
the tree doesn't do anything. So this is easy to implement. You just need to
create the right messages, as shown above.



The shake command:
- - - - - - - - - 

Actually, we learned from climbing the tree that it is unsteady. Maybe we can
get one of those coconuts? Consider:

% emacs -batch -l dunnet

Dead end
You are at a dead end of a dirt road.  The road goes to the east.
In the distance you can see that it will eventually fork off.  The
trees here are very tall royal palms, and they are spaced equidistant
from each other.
There is a shovel here.
> shake palm
You begin to shake a tree, and notice a coconut begin to fall from the air.
As you try to get your hand up to block it, you feel the impact as it lands
on your head.
You are dead.
You have scored 0 out of a possible 90 points.

%

So shaking the tree gives a message and then does an exit. Can we shake other
things?

% emacs -batch -l dunnet

Dead end
You are at a dead end of a dirt road.  The road goes to the east.
In the distance you can see that it will eventually fork off.  The
trees here are very tall royal palms, and they are spaced equidistant
from each other.
There is a shovel here.
> shake hand
I don't know what that is.
>shake 
You must supply an object.
>shake boulder
I don't see that here.
>shake shovel
You don't have that.
>get shovel
Taken.  
>i
You currently have:
A lamp
A shovel
>shake lamp
Shaking a lamp seems to have no effect.
>shake shovel
Shaking a shovel seems to have no effect.
>

So you can only shake things in your inventory (or the tree/trees/palm).
And when you shake them you get a message that includes their inventory name
(but with the "A" becoming an "a").

Actually, there is one more use of shake:
% emacs -batch -l dunnet

Dead end
You are at a dead end of a dirt road.  The road goes to the east.
In the distance you can see that it will eventually fork off.  The
trees here are very tall royal palms, and they are spaced equidistant
from each other.
There is a shovel here.
e
E/W Dirt road
You are on the continuation of a dirt road.  There are more trees on
both sides of you.  The road continues to the east and west.
There is a large boulder here.
>e
Fork
You are at a fork of two passages, one to the northeast, and one to the
southeast.  The ground here seems very soft. You can also go back west.
>se
SE/NW road
You are on a southeast/northwest road.
There is some food here.
>se
Bear hangout
You are standing at the end of a road.  A passage leads back to the
northwest.
There is a ferocious bear here!
>climb bear
You can't climb that.
>shake bear
As you go up to the bear, it removes your head and places it on the ground.
You are dead.
You have scored 0 out of a possible 90 points.

%


Well, shaking the bear was not wise. But it does need to be part of your game.


The eat command:
- - - - - - - - 

Consider:
>e
E/W Dirt road
You are on the continuation of a dirt road.  There are more trees on
both sides of you.  The road continues to the east and west.
There is a large boulder here.
>e
Fork
You are at a fork of two passages, one to the northeast, and one to the
southeast.  The ground here seems very soft. You can also go back west.
>se
SE/NW road
You are on a southeast/northwest road.
There is some food here.
>x food
It looks like some kind of meat.  Smells pretty bad.
>eat food
You don't have that.
>get food
Taken.  
>eat food
That tasted horrible.
>eat lamp
You forcefully shove a lamp down your throat, and start choking.

You are dead.
You have scored 0 out of a possible 90 points.

%

Well, eating the food was not wise, because you'll never get the key. But it
does need to be part of your game.
And eating anything other than the food will kill you. 
Also, you can only eat things in your inventory.


The put command:
- - - - - - - - 

This command is only useful in the computer room. So let's go forward in the
game to that point:

>w
Computer room
You are in a computer room.  It seems like most of the equipment has
been removed.  There is a VAX 11/780 in front of you, however, with
one of the cabinets wide open.  A sign on the front of the machine
says: This VAX is named ‘pokey’.  To type on the console, use the
‘type’ command.  The exit is to the east.
The panel lights are steady and motionless.
>put lamp
You must supply an indirect object.
>put lamp on vax
I don't know how to combine those objects.  Perhaps you should
just try dropping it.
>put lamp in shovel
I don't know how to combine those objects.  Perhaps you should
just try dropping it.
>put lamp on tree
That indirect object is not here.
>put tree on lamp
You don't have that.
>put card
You must supply an indirect object.
>e
Old Building hallway
>put card in vax
That indirect object is not here.
>w
Computer room
The panel lights are steady and motionless.
>put card in vax
As you put the CPU board in the computer, it immediately springs to life.
The lights start flashing, and the fans seem to startup.
>e
Old Building hallway
>w
Computer room
The panel lights are flashing in a seemingly organized pattern.
>put card in vax
You don't have that.
>i
You currently have:
A lamp
A shovel
A brass key
>get card
I do not see that here.
>l
Computer room
You are in a computer room.  It seems like most of the equipment has
been removed.  There is a VAX 11/780 in front of you, however, with
one of the cabinets wide open.  A sign on the front of the machine
says: This VAX is named ‘pokey’.  To type on the console, use the
‘type’ command.  The exit is to the east.
The panel lights are flashing in a seemingly organized pattern.
>


You see what the various messages are, above.
The only useful command is "put card/board/cpu in vax/computer/cabinet"

When you do this and you have the card and you are in the computer room, then:
- A message displays.
- The panel lights change from steady to flashing (recall that there is a
  .flashing file in the computer room's directory).
- The card disappears from your inventory (and you can't get it back).

Whenever you reenter the room, the new message about flashing lights displays.


incorrect commands:
- - - - - - - - - -

Consider:

% emacs -batch -l dunnet

Dead end
You are at a dead end of a dirt road.  The road goes to the east.
In the distance you can see that it will eventually fork off.  The
trees here are very tall royal palms, and they are spaced equidistant
from each other.
There is a shovel here.
>xyz
I don't understand that.
>

The way to implement this is with the "default:" case of your switch statement.


_______________________________________________________________________________


To help summarize the error messages and to see their similarities, here are
all of them shown together (in your implementation, "x" with no object will
give the error message shown below, not what the real game does):

> x
You must supply an object.
>get
You must supply an object.
>drop
You must supply an object.
>eat
You must supply an object.
>climb
You must supply an object.
>shake
You must supply an object.
>put
You must supply an object
>x xyz
I don't know what that is.
>get xyz
I don't know what that is.
>drop xyz
I don't know what that is.
>eat xyz
I don't know what that is.
>shake xyz
I don't know what that is.
>climb xyz
I don't know what that object is.
>put xyz
I don't know what that object is.
>x key
I don't see that here.
>get key
I do not see that here.
>drop key
You don't have that.
>eat key
You don't have that.
>shake key
I don't see that here.
>climb key
I don't see that here.
>put key
You don't have that.
>put lamp
You must supply an indirect object.
>put lamp in
You must supply an indirect object.
>put lamp lamp
You must supply an indirect object.
>put lamp in lamp
I don't know how to combine those objects.  Perhaps you should
just try dropping it.
>put card xyz vax dfdsfsdf dfdsfsfs
As you put the CPU board in the computer, it immediately springs to life.
The lights start flashing, and the fans seem to startup.
>

(The last of the above examples isn't actually an error message, but it is a
situation where we would have expected an error. It shows that the put command
actually ignores all of its arguments except the first and the third. )


