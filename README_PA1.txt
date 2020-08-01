                          UNIX System Programming
                         Programming Assignment #1


Due: Monday, March 16  at  11:59 pm.

Submission method: You will post to the course website. The TAs will post 
                   instructions on how to do this.

Submission rules: I REQUIRE you to FOLLOW THESE RULES:

                  1. You will submit one tarfile.

                  2. The name of the file will be "<your student ID>.tar"
                     You will, of course, replace "<your student ID>" with your
                     unique ID number (eg. B083040099.tar, M073020000.tar, etc)
                  3. Submissions made after the deadline will be ignored.
                     (That means, no late submissions on this assignment.)
                     (By the way, if you don't turn in your assignments, you
                      will probably Fail The Class. That's a Fact. So start
                      early and ask questions.)
                  
                  This is a large class. Unless each of you follows the above
                  rules, the TAs' work becomes so hard. So I INSIST that you 
                  FOLLOW the above rules. If you don't, we won't accept your 
                  homework.

                  If you have questions about these rules, you may post your 
                  questions to the course website.


Getting help:   - The Professor has office hours on Monday from 12:20-2:20, 
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
                  will fail.
                  The large point value also explains why the policy against
                  cheating is strictly enforced.


- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Assignment Details:

Part 1. The Concept of the Assignment
"""""""""""""""""""""""""""""""""""""
We learned in lecture 1 about creating directories, files, hidden files, and
links. We learned about navigating directory structures. We learned how to use 
tar to compress or expand a directory structure. We'll now use this knowledge 
to create the first part of text adventure game, called Dunnet. 

The interesting feature of Dunnet is that it comes as part of the UNIX's emacs
editor, which is the editor I recommend you to use for programming in the UNIX
environment. (I know it is weird for a text editor to come with games, but it 
does.) You don't actually need to play the original game in order for you to
do the assignment. But if you think it would help your understanding, then you
can play it by typing "emacs -batch -l dunnet" on the command line. 

The insight that led me to create such a homework assignment was when I noticed
how much similarity there is between the layout of a text game and the UNIX
directory structure. In a text adventure you can enter rooms wherein you may
find objects; in UNIX you can go into a directory and find files there. In a
text game you can examine or pick up the objects in the room; in UNIX you can
display or move the files. In a text adventure each room connects to others 
in a network; in UNIX each directory can have subdirectories (and a parent
directory) that it is connected to. In a text adventure, some objects may be
hidden and some doors may be locked; in UNIX, there can be hidden files and 
directories can be blocked by changing their permissions.

For this first homework, we will create the directory and file structure for
the first part of the Dunnet game. (In the next homework we will use aliases
to create some of the games commands.)

Once you have created the correct directory and file structure, then you will
create a tarfile to submit.


Part 2. A Walkthrough of the Game 
"""""""""""""""""""""""""""""""""

This walkthrough will show how the first part of the actual Dunnet game runs.
This will help us in implementing both this present homework and the next one.

So we want to see how the game runs. Let's see the start of the game output:
    % emacs -batch -l dunnet
    Dead end
    You are at a dead end of a dirt road.  The road goes to the east.
    In the distance you can see that it will eventually fork off.  The
    trees here are very tall royal palms, and they are spaced equidistant
    from each other.
    There is a shovel here.
    >

From the above, we see that we are at the end of a road. There is also a shovel
here. We have also been told that the road goes east. This means that we can
follow the road, by typing "e". Let's try that:

    >e
    E/W Dirt road
    You are on the continuation of a dirt road.  There are more trees on
    both sides of you.  The road continues to the east and west.
    There is a large boulder here.
    >

From the above, we see that we can keep going east, or we can go back west.
Let's go back west:

    > w
    Dead end
    There is a shovel here.
    > l
    Dead end
    You are at a dead end of a dirt road.  The road goes to the east.
    In the distance you can see that it will eventually fork off.  The
    trees here are very tall royal palms, and they are spaced equidistant
    from each other.
    There is a shovel here.
    >

Looking at the above text, we find that the description of the place is much
shorter if you have already visited it. But the above also shows that we can
see the full text by typing "l" (which is short for "look").

Now let's see how can interact with the objects in this location. There is a
message telling us about a shovel. Let's examine it, by typing "x":

    >x shovel
    It is a normal shovel with a price tag attached that says $19.99.
    >

But this is not the only object we can look at. The description said there were
palm trees. Let's see all the different ways that we can examine them:

    >x trees
    They are palm trees with a bountiful supply of coconuts in them.
    >x tree
    They are palm trees with a bountiful supply of coconuts in them.
    >x palms
    I don't know what that is.
    >x palm
    They are palm trees with a bountiful supply of coconuts in them.
    >x coconuts
    I see nothing special about that.
    >x coconut
    I see nothing special about that.

It seems to me a bug in the game for it to recognize palm but not palms, while
recognizing both tree and trees. Well, maybe it is a bug -- but that doesn't
matter. We will implement the same behavior as the game. What this means is
that we will put files into this directory, with the names "trees", "tree",
"palm" (but not "palms"), "coconut", "coconuts", and "shovel".

The next topic to discuss is our inventory of carried items. We can look at it
(using "i") and we can pick things up and put them in our inventory (using
"get"):

    >i
    You currently have:
    A lamp
    >get coconut
    You cannot take that.
    >get shovel
    Taken.
    >i
    You currently have:
    A lamp
    A shovel
    >

From the above, we see that we start the game carrying a lamp. We also see that
some items can be picked up (like the shovel), but other items cannot (like the
coconut).
If we picked up the shovel, then it should not be on the ground. Let's see:

    >l
    Dead end
    You are at a dead end of a dirt road.  The road goes to the east.
    In the distance you can see that it will eventually fork off.  The
    trees here are very tall royal palms, and they are spaced equidistant
    from each other.
    >

Correct. The shovel is no longer there.

Let's now look at that place to the east again: 

>e
    E/W Dirt road
    There is a large boulder here.
    >x boulder
    It is just a boulder.  It cannot be moved.
    >get boulder
    You cannot take that.
    >l
    E/W Dirt road
    You are on the continuation of a dirt road.  There are more trees on
    both sides of you.  The road continues to the east and west.
    There is a large boulder here.
    >x trees
    They are palm trees with a bountiful supply of coconuts in them.
    >

We see that this place has the same trees as the place we can from. It doesn't
have a shovel, but does have a boulder. This means that this directory will
hold files with the names "trees", "tree", "palm" (but not "palms"), "coconut",
"coconuts", and "boulder".

Let's move on:
    >e
    Fork
    You are at a fork of two passages, one to the northeast, and one to the
    southeast.  The ground here seems very soft. You can also go back west.
    >x ground
    I don't know what that is.
    >dig
    I think you found something.
    >

The message about the ground being soft was a hint to dig. We were only allowed
to dig because we had picked up the shovel. Once we dug, it said that we found
something. But we'll have to "look" to see what we found:

    >l
    Fork
    You are at a fork of two passages, one to the northeast, and one to the
    southeast.  The ground here seems very soft. You can also go back west.
    There is a CPU card here.
    >
    
It says that we found a CPU card. Let's look at it. But before we do that, we
must note that this object has three valid names:

    >x card
    The CPU board has a VAX chip on it.  It seems to have
    2 Megabytes of RAM onboard.
    >x cpu
    The CPU board has a VAX chip on it.  It seems to have
    2 Megabytes of RAM onboard.
    >x board
    The CPU board has a VAX chip on it.  It seems to have
    2 Megabytes of RAM onboard.
    >get cpu
    Taken.
    >

OK. So now we have the card where to go now? Let's look around:

    >l
    Fork
    You are at a fork of two passages, one to the northeast, and one to the
    southeast.  The ground here seems very soft. You can also go back west.
    >
    
So we can go northeast or southwest. Let's try northeast first:

    >ne
    NE/SW road
    You are on a northeast/southwest road.
    >ne
    Building front
    You are at the end of the road.  There is a building in front of you
    to the northeast, and the road leads back to the southwest.
    >

The path has led to a building. Let's go in:

    >ne
    You don't have a key that can open this door.
    >

Oh. We don't have the key. Where could it be? Well, there was that southeast
branch. Let's try that path:

    >sw
    NE/SW road
    >sw
    Fork
    >se
    SE/NW road
    You are on a southeast/northwest road.
    There is some food here.
    >x food
    It looks like some kind of meat.  Smells pretty bad.
    >get food
    Taken.
    >

We picked up some food. But not a key. The road does continue on however:

    >se
    Bear hangout
    You are standing at the end of a road.  A passage leads back to the
    northwest.
    There is a ferocious bear here!
    >x bear
    It looks like a grizzly to me.
    >

How are we going to get past the bear? Well we have a piece of meat...
But before we feed the bear, let's look for the key:

    >x key
    I don't see that here.
    >drop food
    Done.
    The bear takes the food and runs away with it. He left something behind.
    >l
    Bear hangout
    You are standing at the end of a road.  A passage leads back to the
    northwest.
    There is a shiny brass key here.
    >

From the above, we see that the key only appeared when the bear left. Let's
look around:

    >x bear
    I don't see that here.
    >x key
    I see nothing special about that.
    >get key
    Taken.
    >

From the above, we see that the ear really has left. We also now have the key.
We can now go and open the door. But first let's visit a secret area to the
southwest:

    >sw
    Hidden area
    There is an emerald bracelet here.
    >x emerald
    I see nothing special about that.
    >x bracelet
    I see nothing special about that.
    >get bracelet
    Taken.
    >i
    You currently have:
    A lamp
    A shovel
    A computer board
    A brass key
    >

From the above, we see that the bracelet has two possible names. We also have
checked our current inventory. Well, let's head for that locked door:

    >ne
    Bear hangout
    >nw
    SE/NW road
    >nw
    Fork
    >ne
    NE/SW road
    >ne
    Building front
    >ne
    Old Building hallway
    You are in the hallway of an old building.  There are rooms to the east
    and west, and doors leading out to the north and south.
    >

We were able to get through the door because we had the key in our inventory.
We now are in the house, with doors on all sides. Let's see what is behind
these doors:

    >n
    You don't have a key that can open this door.
    >e
    Mailroom
    You are in a mailroom.  There are many bins where the mail is usually
    kept.  The exit is to the west.
    >
    
The north door is locked (and the player will not get through it until much
later in the game -- and so we don't need to worry about what is behind this
door.)
We then tried the east door and found ourselves in a mailroom with bins. Let's
look at those bins:

    >x bins
    All of the bins are empty.  Looking closely you can see that there
    are names written at the bottom of each bin, but most of them are
    faded away so that you cannot read them.  You can only make out three
    names:
                       Jeffrey Collier
                       Robert Toukmond
                       Thomas Stock

    >x bin
    All of the bins are empty.  Looking closely you can see that there
    are names written at the bottom of each bin, but most of them are
    faded away so that you cannot read them.  You can only make out three
    names:
                       Jeffrey Collier
                       Robert Toukmond
                       Thomas Stock

    >get bin
    You cannot take that.
    >

From the above, we see that there are two names for the bins.
Well, time to look at the west room:

    >w
    Old Building hallway
    >w
    Computer room
    You are in a computer room.  It seems like most of the equipment has
    been removed.  There is a VAX 11/780 in front of you, however, with
    one of the cabinets wide open.  A sign on the front of the machine
    says: This VAX is named ‘pokey’.  To type on the console, use the
    ‘type’ command.  The exit is to the east.
    The panel lights are steady and motionless.
    >e
    Old Building hallway
    >w
    Computer room
    The panel lights are steady and motionless.
    >

We see that the lights message displays every time you enter the room. This
is also what objects like the boulder and the shovel did. The lights are not
an object, however, as we'll see when we look around the room:

    >x computer
    I see nothing special about that.
    >x vax
    I see nothing special about that.
    >x cabinet
    I see nothing special about that.
    >x lights
    I don't know what that is.
    >x panel
    I don't know what that is.
    >x steady
    I don't know what that is.
    >

As we see, there are three names for the computer. Vax is the brand name
(it is a very, very old brand), and cabinet refers to computer's frame
(which is so large as to be called a cabinet, because the computer is so
old). 
One thing we notice is that the panel lights are motionless. So the computer
is not working. Maybe it needs a cpu:

    >put card in computer
    As you put the CPU board in the computer, it immediately springs to life.
    The lights start flashing, and the fans seem to startup.
    >e
    Old Building hallway
    >w
    Computer room
    The panel lights are flashing in a seemingly organized pattern.
    >l
    Computer room
    You are in a computer room.  It seems like most of the equipment has
    been removed.  There is a VAX 11/780 in front of you, however, with
    one of the cabinets wide open.  A sign on the front of the machine
    says: This VAX is named ‘pokey’.  To type on the console, use the
    ‘type’ command.  The exit is to the east.
    The panel lights are flashing in a seemingly organized pattern.
    >

So the light message has changed.

That is the end of the walkthrough. You will be implementing this over the
next two homeworks. This first homework will involve creating the rooms.
The files that you will be told to put into these rooms will makes some sense,
now that you've seen the walkthrough. The way the files are to be used will
not always be clear, however, because that will be the job of the second
assignment.


For your reference, shown here are those links. (Note, if you print without a
fixed-width font, then the figure below will not look right):
 
                                         EMPTY
                                           A
                                           |n         
                                 w         |            e
                  computer-room <- old-building-hallway -> mailroom
                                          /
                                         /ne(s in reverse)
                                        /
                                 building-front
                                      /
                                     /ne
                                    /
                               ne-sw-road
                                  /
                                 /ne
         e                e     /
dead-end -> e-w-dirt-road -> fork
                                \
                                 \se
                                  \
                               se-nw-road
                                   \
                                    \se
                                     \
                                 bear-hangout
                                     /
                                    /sw
                                   /
                              hidden-area

Above are the connections. Note, the reverse links also exist. For example, if
A has a sw connection to B, then B has a ne connection to A. The exception to
this is the "hallway": it goes south to the building-front, but you had to go
northeast from the building-front to get to the hallway.


Part 3. Assignment Details
""""""""""""""""""""""""""
This assignment is not very hard. In the text below, I will, essentially,
give you the answer. You just have to redo what I show you below. I have
created a solution directory structure named PA1. We will now walk through
the subdirectories of PA1 and see what is in them. Your job is simply to
create your own version of PA1 that matches to what you see below.

Although it is not a hard assignment, it is good experience in using the
commands that we learned in lecture 1. It also requires you to use an editor
to create some the contents for certain files. You can cut and paste those
file contents from what is shown below. Even so, it is good practice in using
an editor.

A few hints may make your work easier:
1 If two files have the same contents, you can copy one to the other; you don't
  need to open the editor again.
2 Don't change the permissions to the directory of the hallway until you finish
  the house, since you won't be able to use cd in the house otherwise.
3 If you create a wrong link, you have to remove it before you can make a
  different one with the same name.
4 The mv command works on directories as well as files.
  This can be helpful if you make a mistake in your directories.
  For example:
   - Suppose you forgot the directory with the boulder.
   - In that case, the path from the start to the bear would be e/se/se instead
     of e/e/se/se.
   - Similarly the path to the hallway would be /e/ne/ne/ne.
   - In other words, all of the paths are missing that one e at the beginning,
     because you forgot it.
   - The fix is easy:
     1. Go to the start directory.
     2. Here we would like to create the directory e that holds the boulder,
        but we can't because the directory already has a subdirectory e (but
        it is the wrong e, the one with the cpu card).
        So we instead create a subdirectory x (at this point, x is a sibling
        of the directory e that contains the cpu card).
     3. Move e into x.
        This turns the e with the cpu card into a subdirectory of x.
     4. Rename x to e.
     5. Put the boulder and other files into e.
     


So now let's look at the directories you need to make for this homework.
To begin, we'll go to the base directory of this assignment. I have placed mine
as a subdirectory of my home:
    % cd ~/PA1
    % ls -lA
    total 8
    drwxr-xr-x+ 1 Me None 0 Feb 15 07:30 inventory
    drwxr-xr-x+ 1 Me None 0 Feb 13 02:28 obj
    drwxr-xr-x+ 1 Me None 0 Feb 15 07:30 objects
    drwxr-xr-x+ 1 Me None 0 Feb 23 23:12 start
    %

From the above we see that you will have to make 4 subdirectories. Let's look
at each one, in turn:
    % ls -lA PA1/inventory
    total 1
    -rw-r--r-- 1 Me None 5 Feb 13 02:28 lamp
    % cat PA1/inventory/lamp
    lamp
    %

We recall that in the walkthrough, you start the game with the lamp in your
inventory. So the above makes sense.
But why does the file lamp contain the word "lamp" (and a \n) as its contents?
Well this is typical of this assignment. Many of the files will contain their
own names -- the reason why we do so will be clear in the next homework.

Anyway, let's look at another of those 4 subdirectories:

    % ls -lA PA1/obj
    total 0


OK, so that subdirectory is empty. We know how to create that. So, moving on to
another subdirectory:

    % ls -lA PA1/objects
    total 23
    -rw-r--r-- 1 Me None 323 Feb 15 07:30 .alerts
    -rw-r--r-- 1 Me None  31 Feb 13 01:54 bear
    -rw-r--r-- 1 Me None 313 Feb 13 01:56 bin
    -rw-r--r-- 1 Me None 313 Feb 13 01:56 bins
    -rw-r--r-- 1 Me None  82 Feb 13 01:53 board
    -rw-r--r-- 1 Me None  43 Feb 13 01:53 boulder
    -rw-r--r-- 1 Me None  34 Feb 13 01:54 bracelet
    -rw-r--r-- 1 Me None  34 Feb 13 01:56 cabinet
    -rw-r--r-- 1 Me None  82 Feb 13 01:53 card
    -rw-r--r-- 1 Me None  34 Feb 13 01:52 coconut
    -rw-r--r-- 1 Me None  34 Feb 13 01:52 coconuts
    -rw-r--r-- 1 Me None  34 Feb 13 01:56 computer
    -rw-r--r-- 1 Me None  82 Feb 13 01:53 cpu
    -rw-r--r-- 1 Me None  34 Feb 13 01:54 emerald
    -rw-r--r-- 1 Me None  27 Feb 15 06:52 flashing
    -rw-r--r-- 1 Me None  53 Feb 13 01:54 food
    -rw-r--r-- 1 Me None  34 Feb 13 01:54 key
    -rw-r--r-- 1 Me None  38 Feb 13 02:30 lamp
    -rw-r--r-- 1 Me None  65 Feb 13 01:52 palm
    -rw-r--r-- 1 Me None  66 Feb 13 01:52 shovel
    -rw-r--r-- 1 Me None  27 Feb 15 06:52 steady
    -rw-r--r-- 1 Me None  65 Feb 13 01:52 tree
    -rw-r--r-- 1 Me None  65 Feb 13 01:52 trees
    -rw-r--r-- 1 Me None  34 Feb 13 01:56 vax
    %

From the above, we see that the list is all files (ie, no directories or
links). Let's look at them again, in a shorter form:

    % cd PA1/objects
    % ls -A
    .alerts  bins     bracelet  coconut   cpu       food  palm    tree
    bear     board    cabinet   coconuts  emerald   key   shovel  trees
    bin      boulder  card      computer  flashing  lamp  steady  vax
    %

Now we want to look at the individual files. The first one is a hidden file
(because it is isn't an object in the game):

    % cat .alerts
    The panel lights are steady and motionless.
    The panel lights are flashing in a seemingly organized pattern.
    There is a CPU card here.
    There is a ferocious bear here!
    There is a large boulder here.
    There is a shiny brass key here.
    There is a shovel here.
    There is an emerald bracelet here.
    There is some food here.
    %

The file's contents turns out to be some of the messages that we had seen in
the walkthrough.

Let's look at another of the files:

    % ls -A
    .alerts  bins     bracelet  coconut   cpu       food  palm    tree
    bear     board    cabinet   coconuts  emerald   key   shovel  trees
    bin      boulder  card      computer  flashing  lamp  steady  vax
    % cat bear
    It looks like a grizzly to me.
    %

Now this makes sense. The bear is one of the objects in the game, and this is
the description we see when we examine it.  Let's look at the next two files:

    % cat PA1/objects/bin
    All of the bins are empty.  Looking closely you can see that there
    are names written at the bottom of each bin, but most of them are
    faded away so that you cannot read them.  You can only make out three
    names:
                       Jeffrey Collier
                       Robert Toukmond
                       Thomas Stock

    % cat PA1/objects/bins
    All of the bins are empty.  Looking closely you can see that there
    are names written at the bottom of each bin, but most of them are
    faded away so that you cannot read them.  You can only make out three
    names:
                       Jeffrey Collier
                       Robert Toukmond
                       Thomas Stock

    %

Indeed, bin and bins are two names for the same object. Next, we'll look at the
board, but it turns out that the card and the cpu have the same contents:

    % cat board card cpu
    The CPU board has a VAX chip on it.  It seems to have
    2 Megabytes of RAM onboard.
    The CPU board has a VAX chip on it.  It seems to have
    2 Megabytes of RAM onboard.
    The CPU board has a VAX chip on it.  It seems to have
    2 Megabytes of RAM onboard.
    %

After the board comes the boulder:

    % ls -A
    .alerts  bins     bracelet  coconut   cpu       food  palm    tree
    bear     board    cabinet   coconuts  emerald   key   shovel  trees
    bin      boulder  card      computer  flashing  lamp  steady  vax
    % cat boulder
    It is just a boulder.  It cannot be moved.
    %

Next is the bracelet. But this file is actually the same as many other files:

    % cat bracelet cabinet coconut coconuts computer emerald key vax
    I see nothing special about that.
    I see nothing special about that.
    I see nothing special about that.
    I see nothing special about that.
    I see nothing special about that.
    I see nothing special about that.
    I see nothing special about that.
    I see nothing special about that.
    %

Well that moved us farther along. The next on the list is "flashing", but that
is the same as "steady":

    % ls -A
    .alerts  bins     bracelet  coconut   cpu       food  palm    tree
    bear     board    cabinet   coconuts  emerald   key   shovel  trees
    bin      boulder  card      computer  flashing  lamp  steady  vax
    % cat flashing steady
    I don't know what that is.
    I don't know what that is.
    %

Here are the next two:
    % cat food
    It looks like some kind of meat.  Smells pretty bad.
    % cat lamp
    The lamp is hand-crafted by Geppetto.
    %

What is left? The palm (which is the same as tree and trees) and the shovel:

    % ls -A
    .alerts  bins     bracelet  coconut   cpu       food  palm    tree
    bear     board    cabinet   coconuts  emerald   key   shovel  trees
    bin      boulder  card      computer  flashing  lamp  steady  vax
    % cat palm  tree trees
    They are palm trees with a bountiful supply of coconuts in them.
    They are palm trees with a bountiful supply of coconuts in them.
    They are palm trees with a bountiful supply of coconuts in them.
    % cat shovel
    It is a normal shovel with a price tag attached that says $19.99.
    %

OK. We finished this directory. So what is next?

    % cd ..
    % ls
    inventory  obj  objects  start
    %

OK, there is just one directory left to look at. What's in it? Let's see:

    % cd start
    % ls -lA
    total 10
    -rw-r--r--  1 Me None 229 Feb  8 00:29 .d
    -rw-r--r--  1 Me None   0 Feb 14 02:46 9
    -rw-r--r--  1 Me None   8 Feb 13 02:11 coconut
    -rw-r--r--  1 Me None   9 Feb 13 02:11 coconuts
    drwxr-xr-x+ 1 Me None   0 Feb 14 02:46 e
    -rw-r--r--  1 Me None   5 Feb 13 02:12 palm
    -rw-r--r--  1 Me None   7 Feb 13 02:11 shovel
    -rw-r--r--  1 Me None   5 Feb 13 02:11 tree
    -rw-r--r--  1 Me None   6 Feb 13 02:11 trees
    %

We see that there is one directory, e. The rest are all files. One of the files
is named "9", and it is shown above to have a size of 0. It does not matter
whether your file is empty or has something in it, because the game will never
end up reading this file. The game will only need to file to exist. As we will
see as we look at the subdirectories below start, each one must have a similar
file, always named "9". (In the next homework, you will find out what it is
used for.)

Another file that every subdirectory below this one will have is ".d", but for
these ".d" files, their contents DO matter and are different. So what is in
this specific ".d" file? Let's see:

    % cat .d
    Dead end
    You are at a dead end of a dirt road.  The road goes to the east.
    In the distance you can see that it will eventually fork off.  The
    trees here are very tall royal palms, and they are spaced equidistant
    from each other.
    %

We recognize the above text from the walkthrough; it is the message that
displays the start of the game, describing the place where we start (which,
of course, is why this directory is named "start").

Please note that the above text has no "\r" characters. You cannot see those
characters, even if you have them (ie, if you made you file with Windows
software and saved it incorrectly). Even though you cannot see the "\r"s, it
is a part of this assignment to require that NONE of your files have "\r"
characters.

Let's move on and see what the other files are:

    % ls
    9  coconut  e  palm  shovel  tree  trees
    % ls -A ???*
    coconut  coconuts  palm  shovel  tree  trees
    % cat ???*
    coconut
    coconuts
    palm
    shovel
    tree
    trees
    %

In the above, we use ???* to display only files with at least three letters.
Thus it displays everything but the 9, the .d, and the subdirectory e.
Studying the output, we see that the file "coconut" has the contents "coconut",
"coconuts" has "coconuts", etc. So now you know what to put in those files.
We are done here and ready to look at that subdirectory:

    % cd e
    % ls -lA
    total 11
    -rw-r--r--  1 Me None 144 Feb 14 01:59 .d
    -rw-r--r--  1 Me None   0 Feb 14 02:46 9
    -rw-r--r--  1 Me None   8 Feb 13 02:13 boulder
    -rw-r--r--  1 Me None   8 Feb 13 02:12 coconut
    -rw-r--r--  1 Me None   9 Feb 13 02:12 coconuts
    drwxr-xr-x+ 1 Me None   0 Feb 14 02:46 e
    -rw-r--r--  1 Me None   5 Feb 13 02:12 palm
    -rw-r--r--  1 Me None   5 Feb 13 02:12 tree
    -rw-r--r--  1 Me None   6 Feb 13 02:12 trees
    lrwxrwxrwx  1 Me None   2 Feb  8 00:16 w -> ..
    % cat .d
    E/W Dirt road
    You are on the continuation of a dirt road.  There are more trees on
    both sides of you.  The road continues to the east and west.
    %

OK, so this is the second location which is very similar to the first, except
that: the .d file is different, it has a "boulder" file, and it doesn't have a
"shovel" file.

But there is one more important difference: there is a link "w" that takes us
back to the starting location. From this point onward, every subdirectory will
have such a link back to its parent directory.

Although you probably can guess the contents of the files, let's see them
anyway:

    % ls -A ???*
    boulder coconut  coconuts  palm  tree  trees
    % cat ???*
    boulder
    coconut
    coconuts
    palm
    tree
    trees
    %

(Hint: since the above files are the same as the previous directory, you can
use cp ???* to put them here.)

Let's move on:

    % cd e
    % ls -lA
    total 5
    -rw-r--r--  1 Me None   6 Feb 13 02:14 .board
    -rw-r--r--  1 Me None   6 Feb 13 02:15 .card
    -rw-r--r--  1 Me None   6 Feb 13 02:14 .cpu
    -rw-r--r--  1 Me None 149 Feb  8 00:30 .d
    -rw-r--r--  1 Me None   0 Feb 14 02:46 9
    drwxr-xr-x+ 1 Me None   0 Feb 14 02:47 ne
    drwxr-xr-x+ 1 Me None   0 Feb 14 02:46 se
    lrwxrwxrwx  1 Me None   2 Feb  8 00:16 w -> ..
    % cat .d
    Fork
    You are at a fork of two passages, one to the northeast, and one to the
    southeast.  The ground here seems very soft. You can also go back west.
    %

In the above, we see three new hidden files. They are hidden files to represent
how you, in the game, have to dig with the shovel to find them. Let's see them:

    % cat .[bc]*
    board
    board
    board
    %

So this is a surprise. The .board, .card, and .cpu all say "board". Well,
board is one of the names for the cpu board, so I guess it's not too strange.
When it comes time to implement homework 2, we will find that the objects that
can be picked up all need to have unique names. These objects are the shovel,
board, food, key, and bracelet. Among these objects, the board can also be
called a "card" or a "cpu", and the bracelet can also be called an "emerald".
(So, when we get to the place with the bracelet, we will see that the emerald
file will say "bracelet", similar to what we see for the board.) As for other
objects that have multiple names, they cannot be picked up (such as the trees,
tree, and palm files that we've already seen). Those objects are not like the
bracelet or board: each file's contents will be that file's name (in fact,
we've already seen this: the palm file holds "palm" but the tree file holds
"tree" and the trees file holds "trees").

It is not really necessary to understand the reasons why the above hidden files
all contain "board", because that reason involves the next homework, not this
one. As for this homework, you just need to make your files look like what is
described here, even if you don't know why you are told to do it this way.

Looking again at the ls listing for this current directory, we see that, in
addition to the hidden files, there are also two subdirectories, se and ne.
Let's try "se" first:

    % ls -lA se
    total 7
    -rw-r--r--  1 Me None 50 Feb  8 00:31 .d
    -rw-r--r--  1 Me None  0 Feb 14 02:46 9
    -rw-r--r--  1 Me None  5 Feb 13 02:15 food
    lrwxrwxrwx  1 Me None  2 Feb  8 00:16 nw -> ..
    drwxr-xr-x+ 1 Me None  0 Feb 14 02:47 se
    % cat se/food
    food
    % cat se/.d
    SE/NW road
    You are on a southeast/northwest road.
    % cat se/food
    food
    %

This all makes sense. Notice that the link is named "nw", which is the opposite
of "se". Let's look further down this southeastern path:

    % ls -lA se/se
    total 4
    -rw-r--r--  1 Me None 92 Feb  8 00:32 .d
    -rw-r--r--  1 Me None  4 Feb 13 02:15 .key
    -rw-r--r--  1 Me None  0 Feb 14 02:47 9
    -rw-r--r--  1 Me None  5 Feb 13 02:15 bear
    lrwxrwxrwx  1 Me None  2 Feb  8 00:16 nw -> ..
    drwxr-xr-x+ 1 Me None  0 Feb 14 02:47 sw
    % cat se/se/.d
    Bear hangout
    You are standing at the end of a road.  A passage leads back to the
    northwest.
    % cat se/se/bear
    bear
    % cat se/se/.key
    key
    %

This also makes sense. The bear file holds "bear", and the .key file holds
"key". Also, the key is a hidden file because you cannot see it until the bear
leaves (which won't happen until homework 2).

OK. Let's now look at the hidden area to the southwest:

    % ls -lA se/se/sw
    total 4
    -rw-r--r-- 1 Me None 12 Feb  8 00:33 .d
    -rw-r--r-- 1 Me None  0 Feb 14 02:47 9
    -rw-r--r-- 1 Me None  9 Feb 13 02:16 bracelet
    -rw-r--r-- 1 Me None  9 Feb 13 02:16 emerald
    lrwxrwxrwx 1 Me None  2 Feb  8 00:16 ne -> ..
    % cat se/se/sw/.d
    Hidden area
    % cat se/se/sw/???*
    bracelet
    bracelet
    %

This also makes sense. It turns out that both the bracelet and emerald files
contain "bracelet".

So that is as far as the southern path goes. Let's look to the northeast:

    % ls
    9  ne  se  w
    % ls -lA ne
    total 2
    -rw-r--r--  1 Me None 50 Feb  8 00:33 .d
    -rw-r--r--  1 Me None  0 Feb 14 02:47 9
    drwxr-xr-x+ 1 Me None  0 Feb 15 05:37 ne
    lrwxrwxrwx  1 Me None  2 Feb  8 00:15 sw -> ..
    % cat ne/.d
    NE/SW road
    You are on a northeast/southwest road.
    % ls -lA ne/ne
    total 2
    -rw-r--r--  1 Me None 144 Feb  8 00:34 .d
    -rw-r--r--  1 Me None   0 Feb 14 02:47 9
    drw-------+ 1 Me None   0 Feb 15 05:43 ne
    lrwxrwxrwx  1 Me None   2 Feb  8 00:35 sw -> ..
    % cat ne/ne/.d
    Building front
    You are at the end of the road.  There is a building in front of you
    to the northeast, and the road leads back to the southwest.
    %

This all makes sense. You walk northeast twice to get to the house. Let's
go there:
    % cd ne/ne

And try walking into the house:
    % cd ne
    bash: cd: ne: Permission denied
    %

What happened? Well let's look at our directory more closely:
    % ls -lA
    total 2
    -rw-r--r--  1 Me None 144 Feb  8 00:34 .d
    -rw-r--r--  1 Me None   0 Feb 14 02:47 9
    drw-------+ 1 Me None   0 Feb 15 05:43 ne
    lrwxrwxrwx  1 Me None   2 Feb  8 00:35 sw -> ..
    %

Notice the permissions on ne. You cannot execute it, which (for a directory)
means that you cannot enter it. That makes sense, because the game requires a
key to open this door.

But if it is locked, how can we see inside (other than by using chmod)?
Well, notice the listing again. We do have READ permissions. So we can see
inside, we just cannot go there:

    % ls -lA ne
    total 6
    -rw-r--r--  1 Me None 149 Feb 15 05:43 .d
    -rw-r--r--  1 Me None   0 Feb 15 05:43 9
    drwxr-xr-x+ 1 Me None   0 Feb 15 05:43 e
    drw-------+ 1 Me None   0 Feb 15 05:42 n
    lrwxrwxrwx  1 Me None   2 Feb 15 05:37 s -> ..
    drwxr-xr-x+ 1 Me None   0 Feb 15 06:55 w
    % cat ne/.d
    Old Building hallway
    You are in the hallway of an old building.  There are rooms to the east
    and west, and doors leading out to the north and south.
    %

Yep, we can see inside. The hallway has three subdirectories. Let's look at
each of them:

    % ls -lA ne/e
    total 4
    -rw-r--r-- 1 Me None 102 Feb 15 05:39 .d
    -rw-r--r-- 1 Me None   0 Feb 15 05:43 9
    -rw-r--r-- 1 Me None   5 Feb 15 05:38 bin
    -rw-r--r-- 1 Me None   5 Feb 15 05:38 bins
    lrwxrwxrwx 1 Me None   2 Feb 15 05:39 w -> ..
    % cat ne/e/.d
    Mailroom
    You are in a mailroom.  There are many bins where the mail is usually
    kept.  The exit is to the west.
    % cat ne/e/???*
    bin
    bins
    %

The mailroom makes sense. What about the computer room:

    % ls -lA ne/w
    total 7
    -rw-r--r-- 1 Me None 334 Feb 15 06:54 .d
    -rw-r--r-- 1 Me None   9 Feb 15 06:55 .flashing
    -rw-r--r-- 1 Me None   0 Feb 15 05:43 9
    -rw-r--r-- 1 Me None   9 Feb 15 05:42 cabinet
    -rw-r--r-- 1 Me None   9 Feb 15 05:42 computer
    lrwxrwxrwx 1 Me None   2 Feb 15 05:40 e -> ..
    -rw-r--r-- 1 Me None   7 Feb 15 06:54 steady
    -rw-r--r-- 1 Me None   9 Feb 15 05:41 vax
    % cat ne/w/.d
    Computer room
    You are in a computer room.  It seems like most of the equipment has
    been removed.  There is a VAX 11/780 in front of you, however, with
    one of the cabinets wide open.  A sign on the front of the machine
    says: This VAX is named ‘pokey’.  To type on the console, use the
    ‘type’ command.  The exit is to the east.
    %

Makes sense so far. Let's look at the files:

    % cat ne/w/computer w/cabinet w/vax
    computer
    cabinet
    vax
    %

These objects make sense. But what are steady and .flashing? These aren't
objects in the game. Well let's look at them:

    % cat ne/w/steady
    steady
    % cat ne/w/.flashing
    flashing
    %

We may not understand what they will be used for, but we can certainly put
these contents into them.

That leaves just one subdirectory from the hallway. Let's look at it:

    % ls -lA ne/n
    total 0
    %

It is empty. Well, if you will recall, the north door is locked and I told
you that we will never get the key for it. So we leave it empty, and we mark
the directory as read-only. See the line for n, below:

    % ls -lA ne
    total 6
    -rw-r--r--  1 Me None 149 Feb 15 05:43 .d
    -rw-r--r--  1 Me None   0 Feb 15 05:43 1
    drwxr-xr-x+ 1 Me None   0 Feb 15 05:43 e
    drw-------+ 1 Me None   0 Feb 15 05:42 n
    lrwxrwxrwx  1 Me None   2 Feb 15 05:37 s -> ..
    drwxr-xr-x+ 1 Me None   0 Feb 15 06:55 w
    %

There is just one more observation to make from the above: the link-back name
from the hallway is "s" (not "sw") even though you go northeast to enter the
building (hence the directory's name is "ne"). Well this is how the actually
game does it, so we are just following along.


Part 4. Tarring, Testing, and Submitting
""""""""""""""""""""""""""""""""""""""""
Once you have implemented all of the above directories, go to the parent
directory of PA1, and create a tarfile of the directory. Name your tarfile
with you student ID. For example: "B123456789.tar"

Next, test your tarfile. Every year, some student sends an empty or garbled
tarfile. Test it. Create a new directory "temptest"; copy the tarfile into
temptest; change your directory to temptest; expand the tarfile; test if it
expanded correctly.

Next, remember not to submit cheating answers. Don't cheat; we have ways of
checking for cheating, and the penalties are too severe.

Next, submit the assignment.


