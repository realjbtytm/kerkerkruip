Kerkerkruip Start and Finish by Victor Gijsbers begins here.

Use authorial modesty.

[ Start and finish takes care of:
	showing the title screen and help menu
	handling difficultly levels
	winning and losing
]


To say Kerkerkruip:
	say "[italic type]Kerkerkruip[roman type]".


Chapter - The title screen activity

Showing the title screen is an activity.

[ Show the title screen in the place of the when play begins rules ]

The show the title screen rule is listed instead of the when play begins stage rule in the startup rules.
This is the show the title screen rule:
	carry out the showing the title screen activity;

Last after showing the title screen:
	consider the when play begins rules;



Section - The difficulty level

The difficulty is a number that varies.

Before showing the title screen:
	now difficulty is data value 2;

To set difficulty to (x - number):
	now difficulty is x;
	set data value 2 to difficulty;


Section - Player stats

[ Must be done before showing the title screen as some difficulty labels are gendered! ]
Before showing the title screen (this is the set gender rule):
	if a random chance of 1 in 2 succeeds:
		now the player is male;
	otherwise:
		now the player is female;

First after showing the title screen (this is the set up initial scores for the player rule):
	now permanent health of the player is 13;
	now melee of the player is 1;
	now defence of the player is 7;
	now body score of the player is 5;
	now mind score of the player is 5;
	now spirit score of the player is 5;
	give the player a stat bonus;
	give the player a stat bonus;
	give the player a stat penalty;
	restore the health of the player;

To give the player a stat bonus:
	let i be a random number between 1 and 4;
	if i is 1:
		increase permanent health of the player by 1;
	if i is 2:
		increase body score of the player by 1;
	if i is 3:
		increase mind score of the player by 1;
	if i is 4:
		increase spirit score of the player by 1.

To give the player a stat penalty:
	let i be a random number between 1 and 4;
	if i is 1:
		decrease permanent health of the player by 1;
	if i is 2:
		decrease body score of the player by 1;
	if i is 3:
		decrease mind score of the player by 1;
	if i is 4:
		decrease spirit score of the player by 1.



Section - Applying the difficulty

After showing the title screen (this is the apply the difficulty rule):
	if difficulty is 0:
		increase health of the player by 5;
		increase permanent health of the player by 5;
		increase melee of the player by 1;
		increase defence of the player by 2;
	if difficulty is 1:
		increase health of the player by 3;
		increase permanent health of the player by 3;
		increase melee of the player by 1;		
		increase defence of the player by 1;
	if difficulty is 2:
		increase health of the player by 1;
		increase permanent health of the player by 1;
		increase defence of the player by 1;
	let k be 6 + difficulty;
	repeat with guy running through monsters:
		now health of guy is (k times health of guy) / 10;
	if difficulty is greater than 2:
		let n be difficulty - 2;
		repeat with guy running through monsters:
			repeat with i running from 1 to n:
				buff guy.
			
To buff (guy - a person):
	let m be a random number between 1 and 5;
	if m is 1:
		increase melee of guy by 1;
	if m is 2:
		increase defence of guy by 1;
	if m is 3:
		increase body score of guy by 1;
	if m is 4:	
		increase mind score of guy by 1;
	if m is 5:	
		increase spirit score of guy by 1.





Chapter - Introduction Menu

[Much of this code has been stolen from Jon Ingold's Title Page.]

Figure opening figure is the file "smallercover.jpg".

Rule for showing the title screen (this is the text title screen rule):
	close the status window;[in case we've come to the menu with it open]
	display the text menu;
	while 1 is 1:
		let key be the chosen letter;
		let action be the rule produced by the menu command rules for key;
		if the outcome of the rulebook is the start the game outcome:
			close the text menu;
			make no decision;
		otherwise if the outcome of the rulebook is the quit outcome:
			stop the game abruptly;
		otherwise if rule succeeded:
			close the text menu;
			consider action;
			display the text menu;

To display the text menu:
	clear the screen;
	[redraw status line;
	say paragraph break;]	
	if glulx text-buffer graphics is supported:
		display figure opening figure[ centered];
	otherwise:
		say "[bold type]Kerkerkruip[roman type] -- by Victor Gijsbers";
	say paragraph break;			
	say fixed letter spacing;		
	[say "'[story title]' by [story author]";
	say paragraph break;]
	say " SCORES:[line break]";
	say "   Current level                :  [difficulty level difficulty] ([difficulty])[paragraph break]";
	let best-level be data value 3;
	say "   Highest level achieved       :  [difficulty level best-level] ([best-level])[line break][paragraph break]";
	say "   Your total victories         :  [ data value 1][line break]";		
[		say "   Your current winning streak  :    [unless winning-streak is greater than 9] [end if][unless winning-streak is greater than 99] [end if] [winning-streak][line break]";
	say "   Your best winning streak     :  [unless best-winning-streak is greater than 9] [end if][unless best-winning-streak is greater than 99] [end if]   [best-winning-streak][paragraph break]";]
	say paragraph break;
	say " ACTIONS:[line break]";
	say "   [if the file of save data exists]Continue the game[otherwise]New game         [end if]            :    (SPACE)[line break]";
	if the file of save data exists:
		say "   New game                     :       N[line break]";
	if difficulty is 0:
		say "   Skip to Apprentice level     :       S[line break]";	
	say "   Display menu                 :       M[line break]";
	say "   Options                      :       O[line break]";
	say "   Quit                         :       Q[line break]";  
	say variable letter spacing;

To close the text menu:
	clear the screen; 

To say difficulty level (m - a number):
	if m is 0:
		say "NOVICE[run paragraph on]";
	if m is 1:
		say "APPRENTICE[run paragraph on]";
	if m is 2:
		say "ADEPT[run paragraph on]";
	if m is 3:
		say "EXPERT[run paragraph on]";
	if m is 4:
		say "MASTER[run paragraph on]";		
	if m is 5:
		say "GRANDMASTER[run paragraph on]";
	if m is 6:
		say "[if player is not female]PRINCE[otherwise]PRINCESS[end if][run paragraph on]";
	if m is 7:
		say "[if player is not female]KING[otherwise]QUEEN[end if][run paragraph on]";
	if m is 8:
		say "[if player is not female]EMPEROR[otherwise]EMPRESS[end if][run paragraph on]";
	if m is 9:
		say "DEMON[run paragraph on]";
	if m is 10:
		say "ANGEL[run paragraph on]";
	if m is greater than 10:
		say "[if player is not female]GOD[otherwise]GODDESS[end if][run paragraph on]".

Section - Menu commands

The menu command rules are a number based rulebook producing a rule. The menu command rules have outcomes quit and start the game.

[ N: new ]
Definition: a number is new:
	if it is 110, yes;
	if it is 78, yes;
	no.
Menu command new:
	if file of save data exists:
		delete file of save data;
		unless difficulty is less than 2:
			set difficulty to (difficulty - 1);
	start the game;

[ Space/Enter/C: continue ]
Definition: a number is continue:
	if it is 32, yes;
	if it is -6, yes;
	if it is 67, yes;
	if it is 99, yes;
	no.
Menu command continue:
	start the game;
	
[ S: skip to apprentice level ]
Definition: a number is skip:
	if it is 115, yes;
	if it is 83, yes;
	no.
Menu command skip:
	if difficulty is 0:
		set difficulty to 1;
		delete file of save data;
		start the game;

[ Q: quit ]
Definition: a number is quit:
	if it is 113, yes;
	if it is 81, yes;
	no.
Menu command quit:
	quit;

[ O: options menu / can't call it options as it conflicts with the table name ]
Definition: a number is settings:
	if it is 111, yes;
	if it is 79, yes;
	no.
Menu command settings:
	rule succeeds with result the show the options menu rule;

This is the show the options menu rule:
	display the (Table of Options Menu) menu with title "Options";

[ H/M: menu ]
Definition: a number is menu:
	if it is 104, yes;
	if it is 72, yes;
	if it is 109, yes;
	if it is 77, yes;
	no.
Menu command menu:
	rule succeeds with result the show the menu rule;

This is the show the menu rule:
	display the Table of Kerkerkruip Help menu with title "Kerkerkruip";



Section - Options Menu

Table of Options Menu
title	order	rule
"[bold type]Interface options"	1	--
"Information panels: [bold type][if data value 7 is 1]Off[otherwise]On[end if]"	2	the toggle info panels rule
""	20	--
"[bold type]Reset"	21	--
"[if difficulty is 0 and data value 1 is 0 and data value 3 is 0 or data value 4 is 0][italic type](Reset the number of victories)[otherwise]Reset the number of victories"	22	the resetting rule
"[if the Table of Held Achievements is empty][italic type](Reset achievements)[otherwise]Reset achievements"	23	the achievement resetting rule
"[if data value 4 > 99][italic type](Unlock everything)[otherwise]Unlock everything"	24	the unlock everything rule

Before showing the title screen:
	sort the Table of Options Menu in (order) order;

This is the resetting rule:
	set difficulty to 0;
	set data value 1 to 0, table only;
	set data value 3 to 0, table only;
	set data value 4 to 0;

This is the achievement resetting rule:
	blank out the whole of the Table of Held Achievements;
	write File of Achievements from Table of Held Achievements;

This is the unlock everything rule:
	set data value 4 to 100;

This is the toggle info panels rule:
	if data value 7 is 0:
		set data value 7 to 1;
	otherwise:
		set data value 7 to 0;



Section - Adding menu screen graphics to the Options menu (for use with Kerkerkruip Glimmr Additions by Erik Temple)

Table of Options Menu (continued)
title	order	rule
"Menu graphics: [bold type][if data value 5 is 1]Off[otherwise]On[end if][roman type]"	11	the toggle menu graphics rule

This is the toggle menu graphics rule:
	if data value 5 is 1:
		set data value 5 to -1, table only;
	otherwise:
		set data value 5 to 1, table only;
	set data value 6 to 0;
	restart immediately.

To restart immediately: 
	(- @restart; -).


Section - Help Menu
	
Table of Kerkerkruip Help
title	submenu	text	rule
"[bold type]Playing Kerkerkruip"	--	--	--
"Players new to Interactive Fiction"	Table of Newest Player Help	--	--
"Players new to [Kerkerkruip]"	Table of New Player Help	--	--
"Advanced concepts"	Table of Advanced Help	--	--
""	--	--	--
"[bold type]Dungeon almanac"	--	--	--
"Enemies and powers"	Table of Power Help	--	[the show the table of enemies and powers rule]
"Achievements"	Table of Achievement Menu	--	--
""	--	--	--
"Options"	Table of Options Menu	--	--
""	--	--	--
"Credits, Copyright & Afterword"	--	"[total credits]"	--
"Contact"	--	"[contact text]"	--

Table of Newest Player Help
title	text 
"Interactive Fiction basics"	"In [italic type]Kerkerkruip[roman type], you play the protagonist of a story which the computer tells to you in English prose (with some numbers added in the combat sequences). You make the protagonist do what you want by giving short English commands. For instance, the computer might say:[paragraph break][italic type]You can see a sword here.[roman type][paragraph break]A command prompt '>' will then appear, at which you might type the command:[paragraph break][italic type]> take sword[roman type][paragraph break]To which the computer will reply:[paragraph break][italic type]Taken.[roman type][paragraph break]The protagonist now possesses the sword. In this way, you will be able to move around the dungeon, examine, take, and drop things, attack monsters, and do many other things. The rest of this section of the help menu will introduce you to the standard interactive fiction commands. These will allows you to move around the game world, though if you want to have any success in combat, you will also need to read the part of the help menu that is about the specific [italic type]Kerkerkruip[roman type] commands."
"Looking and examining"	"Two of the most basic commands are 'look' and 'examine'. By typing 'look', you will get a description of the room you are currently in. By typing 'examine' and then the name of an object, you will get a description of that specific object. So typing 'examine sword' will give you a description of the sword, while typing 'examine me' will give you a description of yourself, the player character.[paragraph break]These commands can also be abbreviated: 'l' will work instead of 'look', while 'x sword' means that same as 'examine sword'."
"Moving around"	"The world is divided into rooms, and you will want to move from one room to the other. You can do this using the command 'go', followed by a direction. The six directions are north, south, west, east, up and down, so you might type 'go south' to move south.[paragraph break]The directions can be abbreviated to their first letter (n, s, w, e, u, d), and you can also drop the word 'go'. So the commands 'go south', 'go s', and 's' are all equivalent."
"Picking up stuff"	"You will want to interact with things in the dungeon. The most basic actions are taking and dropping stuff. Type 'take sword' to pick up the sword, and type 'drop sword' to drop it to the ground again. You can also take or drop multiple items, for instance with 'drop all' or 'take all scrolls'.[paragraph break]If at any time you want to see a list of what you are carrying, type 'inventory'. This last command, which is very useful, can also be abbreviated to 'i'."
"More advanced interactions"	"You'll be able to interact with some items in more specific ways. Here are a couple of commands that you will want to be aware of:[paragraph break]'wear', as in 'wear boots'[line break]'remove', as in 'remove boots'[line break]'open', as in 'open chest'[line break]'close', as in 'close chest'[line break]'lock', as in 'lock chest'[line break]'unlock', as in 'unlock chest'[line break]'eat', as in 'eat apple'[line break]'drink', as in 'drink wine'[line break]'read', as in 'read book'[line break]'put in', as in 'put sword in forge'[line break]'turn on', as in 'turn on machine'[line break]'turn off', as in 'turn off machine'[paragraph break]In general, if something seems the most obvious way to use an item, that command will probably work. If you can't figure out how to use an item, examining it may sometimes give a hint. ([italic type]Kerkerkruip[roman type] has been designed to rely on obvious or clearly clued commands only.)[paragraph break]All the commands previously listed are common interactive fiction commands. There is also a set of special commands used in [italic type]Kerkerkruip[roman type] that you will find described in a different section of the help menu."
"Is this information available out-of-game?"	"Of course. You might be interested in the reference card that can be found here: http://eblong.com/zarf/if.html"

Table of New Player Help
title	text
"Instruction video and Beginner's Guide"	"You are of course free to read this manual, but if you're just looking to dive into [italic type]Kerkerkruip[roman type], you might prefer watching the series of short instruction videos or reading the 3-page Beginner's Guide. You can find everything you need at http://www.ifarchive.org/if-archive/games/competition2011/glulx/kerkerkruip/ ."
"What is Kerkerkruip?"	"[italic type]Kerkerkruip[roman type] is an interactive fiction roguelike. (You can find more information about both interactive fiction and roguelikes in the previous menu.) You will be guiding a nameless adventurer through a randomly generated dungeon, which is different every time you play. There are treasures to be found, monsters to be fought, and powers to be gained, as you attempt to defeat your ultimate opponent: Malygris, the Wizard of Kerkerkruip. Combat is handled by a powerful combat system that is explained in other parts of this manual."
"What is a roguelike?"	"Roguelikes are games that feature turn-based tactical combat in a randomly generated environment. In addition, death is final: if your character dies, there is no way to play on, not even by loading an earlier save. Permanent death makes for very tense games, where the stakes are high, while the random generation ensures that replaying the earlier parts of the game remains interesting. Famous roguelikes are [italic type]Nethack[roman type], [italic type]Angband[roman type], [italic type]Ancient Domains of Mystery[roman type] and [italic type]Dungeon Crawl Stone Soup[roman type]. Among mainstream games, [italic type]Diablo 2[roman type] played on hardcore mode (which is the only mode that features permanent death) comes quite close to being a roguelike, although it is not turn-based."
"Introduction to the combat system"	"Combat is a large part of [italic type]Kerkerkruip[roman type], so it is important to understand the basic concepts and commands. Every person in the game has a certain amount of health; you can see yours in the status bar above the normal game window. If someone's health drops to 0, that person is dead. Killing your enemies is your main goal, while the enemies want to kill you. (In some special circumstances, persons in the dungeon might team up with you, or may attack each other.)[paragraph break]The most important combat command is 'attack', which can be abbreviated to 'a'. If you attack, you attempt to hit the enemy. Whether the blow hits or not is partly determined by a random number, but the circumstances play a very important role as well. The entire calculation will be shown on the screen, so if you are curious, you can always see why you hit or missed.[paragraph break]The second most important combat command is 'concentrate', which can be abbreviated to 'c'. By concentrating, you can attain three stages of concentration, which give you progressively greater bonuses on your attacks and the damage you deal. Most fights cannot be won by just attacking over and over: you need to get at least one or two levels of concentration to make your attacks effective. However, if you get damaged, you lose your concentration -- so you'll have to weigh the advantages of higher concentration against the risk of losing it.[paragraph break]There are also two defensive moves: 'dodge' and 'parry', which can be abbreviated to 'do' and 'p' respectively. These two moves are useful when you must react to an attack of your opponent - they will make you harder to hit. Common sense will generally tell you which of the two is the best. (For instance, don't try to parry a huge warhammer if you are carrying a dagger.)[paragraph break]There are many other actions you can take: you can 'retreat', try to 'sacrifice' in a temple, use your possessions, and so on. Some of these possibilities will be explained in further sections of this help menu. But 'attack', 'concentrate', 'dodge' and 'parry' are the four essential moves."
"Retreat!"	"Sometimes, you will find yourself in a fight you cannot handle. To check whether this is so, you can examine the monsters -- examining is always a free action, which does not cost you a turn. When you examine a monster, you will be told its level. In general, you don't want to attack a level 2 monster until you have killed a level 1 monster; you don't want to attack a level 3 monster until you have killed a level 2 monster; and so on.[paragraph break]If you decide the fight is too difficult for you, your best option is to 'retreat'. This lets you run back to the previous room, but the monster may attack you as you run. [italic type]You get a free retreat upon entering a room for the first time:[roman type] if you don't take any actions (except actions that take no time, like examining and looking), you can retreat without fear of being attacked. Use this to scout out the dungeon around you."
"Time and initiative"	"Kerkerkruip is a turn-based game, but that doesn't mean everyone gets their turn in an orderly fashion. It is possible for you, or for a monster, to get two (or even more) turns in a row. This is partly decided by the random generator, but also partly by actions and events that lower or raise your initiative. For instance, if you have high concentration, you will often be able to act sooner. If you attack and miss, or if you are hit by an attack, you will often be forced to act later. Some items in the dungeon may allow you to manipulate your initiative.[paragraph break]Another thing you should realise is that not every action costs time. Examining, looking and taking inventory all take no time, and neither do the special Kerkerkruip actions 'remember' and 'status'. Most actions that end in failure (like going in a direction you cannot go) don't take time either."
"Knowing the dungeon"	"As in other interactive fiction, you should examine everything. This will show you the levels of monsters, which is very useful, and it may allow you to find out what items in the dungeon -- either those you pick up or those that are situated in specific rooms -- do. Again as in other interactive fiction, you should experiment: try things out, and see what happens.[paragraph break]Kerkerkruip has several important information-related actions. First, there is 'status', which gives you an overview of your health, your attributes, any special effects that are active, and all the skills you have gained during the game. Use it often![paragraph break]In the graphical version of the game, the 'map' command will show you an overview of the dungeon and the monsters you have seen. In both the graphical and the non-graphical version, there is the 'remember' command, which can be abbreviated to 'r'. This action tells you a lot of things: which exits you haven't explored yet; which rooms you have visited; which monsters you have seen, and where; and it also gives you a random tip about Kerkerkruip.[paragraph break]Then, there is the command 'sense', which only becomes available when you have defeated some powerful monsters. First, it gives you an indication of the location of Malygris, the final enemy. (You'll find out why that is useful.) Later, it gives you a sense for the location of any very powerful items. Be warned, however, that you may not always be able to find those; and be warned also that sensing does take a turn.[paragraph break]Finally, and less importantly, the 'trophies' command shows you a list of defeated enemies.[paragraph break]Do not forget: 'status', 'map' and 'remember' ('r') are your friends."
"Moving around"	"You can just 'go' into a direction, of course, but Kerkerkruip also allows you to 'go to' a specific location you have already visited or a monster you have already seen. This will move you one room nearer to that location. If you want to continue your journey, just press enter: an empty command will be read as continuing the previous go to command."
"Using items"	"Generally, it should be obvious how you can use an item; if not, examining the item will often teach you the right verb. A special case are weapons, which you must 'ready' or (equivalently) 'wield' in order to use them. It is also possible to 'unready' a weapon, though it is usually smarter to just 'ready' another weapon instead. You can 'wear' clothing, 'read' scrolls, 'throw' grenades, and so on. The fact that you have found an item does not mean that it is useful to you, so think carefully and observe the effects of the item on the game."
"List of special verbs"	"You may find the 3-page Beginner's Guide more convenient, but here is a list of some of the special verbs of Kerkerkruip. (Verbs having to do with specific objects or skills will not be given: you can look these up through examining the object, or the 'status' command.)[paragraph break]Actions that [italic type]give information[roman type]: 'status', 'map', 'remember' ('r'), 'sense', 'trophies'.[paragraph break]Actions [italic type]used in combat[roman type]: 'attack <person>' ('a'), 'concentrate' ('c'), 'parry' ('p'), 'dodge' ('do').[paragraph break]Actions that [italic type]move the player[roman type]: 'retreat', 'go to <room>'.[paragraph break]Actions that [italic type]work in specific locations[roman type]: 'sacrifice'.[paragraph break]Actions that [italic type]allow you to use objects[roman type]: 'ready <weapon>', 'throw <grenade>', 'read <scroll>', 'wear <clothing>', 'take off <clothing>'.[paragraph break]Actions that [italic type]bring you to this or another menu[roman type]: 'help', 'achievements'.[paragraph break]Actions that [italic type]change the cosmetics of the game[roman type]: 'panels'."

Table of Advanced Help
title	text
"Tension"	"One important circumstance influencing combat is the tension, which goes up as the fight takes longer, but decreases when a hit is scored. The current tension is always visible in the status line. Every 2 points of tension give the attacker a +1 bonus, while every 3 points of tension add +1 to the damage dealt. Thus, if the tension is 10, an attack would happen with a +5 attack bonus and a +3 damage bonus."
"Ment"	"You start the game with three packages of ment, a powerful but highly addictive drug. When you snort ment for the first time, you will receive a +1 attack bonus, a +1 damage bonus, a +1 defence bonus, +1 damage reduction, and a +1 bonus on any attribute checks. The second time you snort ment, your body has become more attuned to the drug, and these bonuses increase to +2; and the third time, they increase to +3. This is a huge bonus. However, your body also becomes dependent on ment, and once its effects wear off you are left with a permanent penalty equal to the bonus you just got. You can get a temporary reprieve by snorting more ment -- but you only have three packages, and can never get more. On the one hand, you should make sure that you are not left with a -3 penalty, no more ment, and a Malygris who is still in good shape. On the other hand, ment can allow you to win fights you could not otherwise win. Using this dangerous resource carefully is one of the keys to success in [italic type]Kerkerkruip[roman type]."
"Advanced combat actions"	"Kerkerkruip currently supports two advanced reactive combat actions: rolling and blocking.[paragraph break]A [italic type]roll[roman type] counts as a dodge (including all bonuses and penalties that might accrue to dodging), but with the following differences. If the attack hits, it deals +3 damage to you. If the attack does not hit, then, on your next turn, you will get a +1 attack and +1 damage bonus against the person who attacked you.[paragraph break]A [italic type]block[roman type] counts as a parry (including all bonuses and penalties that might accrue to parrying), but with a defence bonus equal to your concentration. However, all your concentration will be lost by taking this action."
"Powers and levels"	"Every monster in the game has a level, which you can see by examining the monster. Any monster with a non-zero level will trigger a special sequence of events when it is killed: you will absorb its soul, which fully heals you, increases your statistics (maximum health, attack bonus, and so on), and grants you a special power. You can review the powers you have been granted by using the 'status' command.[paragraph break]Level 0 monsters never grant you health or powers. Some monsters form groups, and you will have to kill the entire group before the power transferal happens.[paragraph break]When you absorb the soul of a monster of a certain level, all souls of the same or a lower level are immediately driven out of your body. This means that you lose the statistics bonuses and the special powers granted by those souls. For example, suppose you kill Miranda, a level 1 monster. You absorb Miranda's soul, receive some bonuses, and get the stun ability. Next, you kill the level 2 chain golem. Absorbing the chain golem's soul will immediately repel Miranda's soul; so you lose the stun ability, and the bonuses given by Miranda's soul; but you gain the lash ability and the bonuses given by the chain golem. (These bonuses are bigger, because he is a higher level monster.) Next, you kill the blood ape, a level 1 monster. Because the soul of the chain golem is of a higher level than that of the blood ape, it does not get repelled, and you receive all the blood ape bonuses and the associated power while retaining those granted by the chain golem.[paragraph break]Every dungeon contains seven monsters with a positive level: two level 1 monsters, two level 2 monsters, and one each of levels 3, 4 and 5. The level 5 monster is Malygris, and you win by killing him.[paragraph break]As you can see, it would be advantageous to kill a level 4 monster first, and then a level 3, a level 2 and a level 1 monster: that way, you can face Malygris while you have the powers of four absorbed souls at you disposal. Unfortunately, killing a level 4 monster is hard, and should not be attempted lightly. You may also be thwarted by the lay-out of the dungeon.[paragraph break]Maximising the amount of souls you have at your disposal by choosing the right order in which to kill the monsters is one of the keys of success in [italic type]Kerkerkruip[roman type]."
"Religion"	"The dungeon may contain several temples, in which you can sacrifice your powers to the gods. Just type 'sacrifice' to do so; you will see a list of the powers you can sacrifice. Each level of the power you sacrifice gives you a point of piety with that god. The benefits given by a god will increase with rising piety, with special gifts given at 1, 3, 6, and 9 piety. But beware: while these gifts can be quite powerful, they are generally not as good as the powers you have sacrificed. So it is often a good idea to sacrifice only those powers that you are bound to lose anyway."
"What is happening to my health?"	"You may have seen that killing a monster will not always increase your maximum health, and you may have also encountered situations in which it actually lowers your maximum health. How is this possible?[paragraph break]Health bonuses belong to powers. If you lose a power, you will also lose the health bonus that comes with it. So if you have killed a level 1 creature which grants you a +5 health bonus, and you then kill another level 1 creature, you will lose the original power, including the health bonus. If the newly killed creature also grants +5 health, your maximum health will stay the same.[paragraph break]More dramatically, assume you have killed a level 3, a level 2 and a level 1 creature, in that order, for a total health bonus of 15 + 10 + 5 = 30. (Creatures generally grant 5 times their level in health, though there is some variation.) If you now kill another level 3 creature, you will lose all the previously granted powers. Your maximum health may drop by as many as 15 points![paragraph break]As you can see, the order in which you kill your enemies is exceedingly important."
"Difficulty and victory"	"[italic type]Kerkerkruip[roman type] has infinitely many difficulty settings (well, as many as can be fitted into a single integer variable), one of which is automatically chosen at the start of the game based on your previous performance. If you have never won a game before, [italic type]Kerkerkruip[roman type] will be in 'easy' mode, which gives you substantial bonuses. In addition, some of the more confusing monsters, items and locations will not appear in the dungeon.[paragraph break]Once you have won at least one game, the difficulty is determined by your current winning streak: the number of games you have won in a row. Every time you win the game, your winning streak will increase by 1; but it will be reset to 0 when you lose. As your winning streak goes up, the monsters in the game get progressively bigger bonuses, and winning becomes harder and harder. Getting a high winning streak is a challenge for experts!"
"Save, restore, quit, undo"	"[italic type]Kerkerkruip[roman type] features a system of permanent death, and as such some of the meta-game commands do not have the same effects they have in other interactive fiction. Undoing is simply disallowed: it would take all tension out of the game. Saving happens automatically every turn, and when you start the game again, you must continue the previous game. You can always restart, but this will reset your winning streak to 0.[paragraph break]Of course [italic type]Kerkerkruip[roman type] is not cheat-proof: if you really wish to backup your saved positions or gain incredible winning streaks, you can. The restrictions are just there to protect honourable people from their worser selves."

Table of Power Help
title	text
"Body, mind, and spirit"	"Your character has three basic faculties: body, mind, and spirit. They influence your performance in two ways. First, each of the faculties has its own individual effect. Second, all powers in the game depend upon one or more of the faculties for their effect.[paragraph break][bold type]Body[roman type] is a measure of your physical strength and agility. Whenever you are attacked, you have a body * 2% chance of receiving a +3 defence bonus.[paragraph break][bold type]Mind[roman type] is a measure of your intelligence and willpower. Whenever damage is dealt to you, each point of mind increases your chance of remaining concentrated by 2%.[paragraph break][bold type]Spirit[roman type] measures how attuned you are to magic and the souls of others. Every point of spirit gives you a 2.5% chance of receiving an intiative bonus on any combat turn.[paragraph break]Truly exceptional feats are only possible for those who [bold type]balance[roman type] body, mind and spirit. Whenever a random number is rolled for an attack or a faculty check, your chance of rolling 20 is a percentage equal to the [italic type]lowest[roman type] of your three faculties."
""	--
"[bold type]Level 1"	--
"Swarm of daggers (body & spirit)"	"Level: 1[paragraph break]Type: active combat ability.[paragraph break]Command: pierce [italic type]someone[roman type].[paragraph break]Effect: You attack the target. A successful hit deals 2 + body/5 extra damage. This ability has a cooldown of 12 - spirit/3 turns."
"Blood ape (body)"	"Level: 1[paragraph break]Type: passive ability.[paragraph break]Command: none.[paragraph break]Effect: Whenever one of your attacks deals damage, you grow. This growth lasts until the end of combat, and you can never grow bigger than the blood ape was when you killed it. In addition to the usual benefits and penalties of growing, you regain 1 + body/3 points of health whenever you grow."
"Ravenous armadillo (body & spirit)"	"Level: 1[paragraph break]Type: reactive combat ability.[paragraph break]Command: scales.[paragraph break]Effect: As a reaction, you can use the scales skill to cover yourself in damage absorbing scales. The damage of the current attack will be reduced by 5 + body/3 points. This ability has a cooldown of 10 - spirit/4 turns."
"Miranda (mind)"	"Level: 1[paragraph break]Type: active combat ability.[paragraph break]Command: stun [italic type]someone[roman type].[paragraph break]Effect: You attack the target. A successful hit deals 1 less damage, but it stuns the target for a number of turns equal to your mind score. A stunned person has a -1 attack penalty, and a penalty on body, mind and spirit equal to your mind/2. Extra effective when used in combination with a stunning weapon."
"Wisps of pain (spirit)"	"Level: 1[paragraph break]Type: active ability.[paragraph break]Command: torment.[paragraph break]Effect: A wave of torment will pass through the room, breaking everyone's concentration. (A person has a 2% chance of resisting this effect per point of mind.) This ability has a cooldown of 12 - spirit/3 turns."
""	--
"[bold type]Level 2"	--
"Chain golem (spirit)"	"Level: 2[paragraph break]Type: reactive combat ability.[paragraph break]Command: lash.[paragraph break]Effect: As a reaction, you attack your attacker. Whether you get to strike first is determined randomly, but the probability increases with your spirit score. (It is 50% at a spirit score of 8.) This ability has a cooldown of 10 - spirit/5 turns."
"Jumping bomb (body)"	"Level: 2[paragraph break]Type: passive ability.[paragraph break]Command: none.[paragraph break]Effect: If you are killed by someone's attack, your body will explode and deal damage to the lowest health enemy in the room who might give you a soul upon death. The amount of damage dealt is a random number between 5 and your body score. (But it is never less than 5, even if your body is less than 5.) If the amount of damage you deal is enough to kill your victim, you will absorb the soul and survive."
"Reaper (spirit)"	"Level: 2[paragraph break]Type: active ability.[paragraph break]Command: reap [italic type]someone[roman type].[paragraph break]Effect: You can reap anyone you have seen, and this ability will instantly teleport you to their location. It can even be used as a reaction in combat. Reaping will reduce your health and maximum health by an amount equal to the level of the highest power you have absorbed; but you have a spirit * 3% probability of avoiding that penalty."
"Demon of rage (mind)"	"Level: 2[paragraph break]Type: active ability.[paragraph break]Command: howl.[paragraph break]Effect: You make your next attack with a +4 attack bonus and a damage bonus equal to 2 + mind/3. Your defence is permanently decreased by 1 point."
"Hound (mind)"	"Level: 2[paragraph break]Type: passive ability.[paragraph break]Command: none.[paragraph break]After you are attacked, with a probability of (mind - 2) / mind, you get a chance to immediately retaliate. If this happens, you will automatically win the initiative for that turn. You can perform any action you wish, just as normal, but if you do choose to retaliate against your attacker, you get a +2 attack and +2 damage bonus. Any action that leads to an attack will count as a retaliation (including the special pierce and stun powers)."
""	--
"[bold type]Level 3"	--
"Mindslug (mind & spirit)"	"Level: 3[paragraph break]Type: active ability.[paragraph break]Command: enslave [italic type]someone[roman type].[paragraph break]Effect: You attempt to enslave an enemy, turning him or her into your thrall. Your attempt is successful if you succeed at a mind check against 5 + mind of your enemy + health of your enemy + (2 * concentration of your enemy) - (2 * your concentration). In general, it will be necessary to decrease your enemy's health before trying to enslave him or her. This ability has a cooldown of 9 - (spirit / 3) turns."
"Giant tentacle (mind)"	"Level: 3[paragraph break]Type: active ability.[paragraph break]Command: sprout [italic type]a number[roman type].[paragraph break]Effect: You sprout between 1 and 4 horrifying tentacles, which may turn anyone else in the room insane. You yourself will permanently lose as many points of mind as you sprout tentacles. Everyone else has to make a mind check against 4 + (4 * number of tentacles) - (that person's health / 3) + your concentration. If they fail the mind check, they go insane, and will start attacking random people including themselves. As additional effects, if you sprout at least 2 tentacles, everyone will lose their concentration; if you sprout at least 3 tentacles, all current attacks against you will be interrupted; and if you sprout 4 tentacles, everyone except for yourself will be stunned for 6 turns."
"Minotaur (body)"	"Level: 3[paragraph break]Type: passive ability.[paragraph break]Command: none.[paragraph break]Effect: You can use the minotaur's axe to maze people. In the maze, you will get a +3 bonus to body, mind and spirit. Furthermore and independent of your location, you get special proficiency with axes, granting you a (your body)% probability of dealing 10 bonus damage when you hit someone with an axe."
""	--
"[bold type]Level 4"	--
"Fanatics of Aite (spirit)"	"Level: 4[paragraph break]Type: active and passive ability.[paragraph break]Command: sacrifice (while not in another god's temple).[paragraph break]Effect: You can sacrifice to Aite even when you are not in her temple, though the effect will not work in the temples of other gods. Once you worship Aite, the probability that her combat interventions will occur increases, the probability that they will benefit you increases, and they start dealing more damage. All these effects scale with your spirit score."
"Bodmall (body)"	"Level: 4[paragraph break]Type: active combat ability.[paragraph break]Command: brambles; launch.[paragraph break]The 'brambles' command will summon bushes of thorns that impede the movement of your enemies, giving them a -2 attack penalty. After a few turns, these branches will start growing thorns. If you wait longer, they will also grow different types of fruit.[paragraph break]The 'launch' command launches these thorns and fruit at your enemies (or, for some fruits, yourself). The thorns will deal between 1 and [italic type]n[roman type] damage, where [italic type]n[roman type] is the number of times the thorns have grown (tiny = 1, terrible = 5). In addition, the thorns have an [italic type]n[roman type] * 20% chance of breaking concentration. Different types of fruits have different effects; experiment with them! Both the brambles and the launch command can be used as an action or a reaction.[paragraph break]Your body score has several effects on how fast the thorns and the fruit will grow; a higher body score means that both will appear sooner and have less chance of disappearing again.[paragraph break]In addition, as a druid you are immune to smoke, and get a +1 attack bonus with wooden weapons."
"Overmind (mind)"	"Level: 4[paragraph break]Type: active and passive ability.[paragraph break]Command: call [italic type]someone[roman type].[paragraph break]You can call any person in the game, except Malygris. Calling someone will make that person move one room towards you, if possible.[paragraph break]In addition, the power of the overmind makes your allies more powerful. They get an attack and defence bonus equal to mind/5."

[To say system requirements text:
	say "[italic type]Kerkerkruip[roman type] is a much more computation intensive game than the average piece of interactive fiction. Both the random dungeon generation at the beginning of the game and the different systems that run every turn take some computing power. While [italic type]Kerkerkruip[roman type] runs well on all reasonably recent computers, including netbooks and even tablets and some phones, older hardware and smaller devices may not be able to run it.[paragraph break]If [italic type]Kerkerkruip[roman type] turns out to be too slow for your computer, there are a few things you can try. First, closing some other programs may help. Second, using another interpreter can make a difference: for instance, currently [italic type]Gargoyle[roman type] runs the game faster than [italic type]Spatterlight[roman type] and [italic type]Filfre[roman type] (but that may have changed when you read this). Using a mobile interpreter like [italic type]Glulxe[roman type] is not recommended! If neither of these strategies work, your device is not powerful enough to run [italic type]Kerkerkruip[roman type]. My apologies.".]

To say total credits:
	say "[banner text]https://github.com/i7/kerkerkruip
	[paragraph break][bold type]The Kerkerkruip team[roman type]
	[line break][italic type]created by[roman type] Victor Gijsbers
	[line break][italic type]with[roman type] Dannii Willis, 
	[line break]Erik Temple, 
	[line break]Remko van der Pluijm [italic type]and[roman type]
	[line break]Mike Ciul
	[paragraph break][bold type]Testers[roman type]
	[line break]Thank you to our alpha- and beta-testers: Bora Bosna, Lance Camelot, Matt Weiner, Michael Fransioli, Michiel Hermes, Vyacheslav Dobranov, and Wasse Asmlash. (If we've forgotten you, let us know!) Any work of interactive fiction needs testers, but one as complicated as [Kerkerkruip] doubly so.
	[paragraph break][bold type]Free software[roman type]
	[line break][Kerkerkruip] is free and open source software. It is copyright 2013 and released under the GNU GPL version 3 licence, or any later version.
	[paragraph break]At the core of [Kerkerkruip] is Inform ATTACK, a combat library for Inform 7, by Victor Gijsbers. It too is released under the GNU GPL 3.
	[paragraph break][Kerkerkruip] includes many other extensions, which are used under the Creative Commons Attribution licence:
	[line break][the hand written list of extensions]
	[paragraph break]You can get the source code for [Kerkerkruip] at https://github.com/i7/kerkerkruip
	[paragraph break][bold type]Art credits[roman type]
	[line break]The cover image is a photo by Captain Orange, modified by Victor Gijsbers. It is used with permission for this game, but should not be used for other games. (Unless you get permission yourself.)
	[paragraph break][the monster portrait credits]
	[paragraph break][bold type]Afterword by Victor Gijsbers[roman type]
	[line break]I would like to thank the makers of Inform 7, everyone whose extensions I have used or misused, and everyone who has helped me on the forums and the newsgroups -- there are a lot of you, and you may know who you are. Andrew Plotkin has answered perhaps more of my technical questions than anyone else, so a special thanks to him.[paragraph break]This game has been inspired by many works of interactive fiction, computer roleplaying games and roguelikes. I want to single out [italic type]Desktop Dungeons[roman type] for special mention, since it was that game that gave me the idea of making a 'coffee break' roguelike -- finally a project I could finish! Apart from the fact that a roguelike is never finished, of course --";

To say the hand written list of extensions:
	say "the Inform 7 Standard Rules by Graham Nelson
	[line break]Numbered Disambiguation Choices by Aaron Reed
	[line break]Glulx Text Effects by Emily Short
	[line break]the Glimmr suite by Erik Temple
	[line break]Glulx Status Window Control by Erik Temple
	[line break]Undo Output Control by Erik Temple
	[line break]Dynamic Objects by Jesse McGrew
	[line break]Dynamic Tables by Jesse McGrew
	[line break]Flexible Windows by Jon Ingold
	[line break]Fixed Point Maths by Michael Callaghan
	[line break]Questions by Michael Callaghan";

To say the monster portrait credits:
	say "All other illustrations by Erik Temple. The rogue portraits incorporate the following resources:
	[paragraph break]Armadillo: Background texture courtesy of Shadowhouse Creations (shadowhousecreations.blogspot.com);
	[line break]Chain Golem: Background texture courtesy of Got3d - 3d Models and Textures (http://www.got3d.com/index.html);
	[line break]Mindslug: Background texture courtesy of Flickr user rubyblossom (CC BY-NC-SA 2.0);
	[line break]Minotaur: Background texture in the public domain, courtesy photos-public-domain.com;
	[line break]Miranda: Background texture courtesy of deviantART user Esther-Sanz;
	[line break]Reaper: Background texture courtesy of wildtextures (wildtextures.com);
	[line break]Swarm of Daggers: Background texture courtesy of Dalibor Levíček, Flickr user daliborlev (CC BY-NC-SA 2.0);
	[line break]Tentacle of Tooloo: Background texture courtesy of deviantART user Insan-Stock;
	[line break]Wisps of Pain: Background image of microalgae courtesy Flickr user Learn 2 Teach, Teach 2 Learn (CC BY-NC 2.0);
	[line break]Placeholder cards: Background texture courtesy of deviantART user Esther-Sanz.";

To say contact text:
	say "This is where stuff is going on:[paragraph break]* Updates to the game are announced on the current website, which is also where you can find the latest version of the game: http://lilith.cc/~victor/?q=content/kerkerkruip[line break]* Updates are also announced on the IFDB, which is the ideal venue for reviewing interactive fiction: http://ifdb.tads.org[line break]* The source code and current design discussions can be found on github: https://github.com/i7/kerkerkruip[line break]* Design discussions, programming tutorials and help from other gamers are at the IF Forum: http://www.intfiction.org/forum/index.php[paragraph break]Github and the forum are the preferred places for interaction, but you can also contact Victor with comments, bug reports, and anything else at victor@lilith.cc."




Section - Enemies and powers

[Table of Enemy Descriptions
title	toggle	enemy
--	--	(a person)
with 30 blank rows

This is the show the table of enemies and powers rule:
	let temp be indexed text;
	blank out the whole of Table of Enemy Descriptions;
	repeat with X running through npc people:
		if X is encountered:
			choose a blank row in Table of Enemy Descriptions;
			now temp is "Level [level of X] -- [The printed name of X]";
			now the title entry is temp;
			now the toggle entry is the describe an enemy and power rule;
			now the enemy entry is X;
	now the current menu is the Table of Enemy Descriptions;
	carry out the displaying activity;

This is the describe an enemy and power rule:
	choose row current menu selection in the current menu;
	[ Title - copied from Menus ]
	let the temporary title be the current menu title;
	now the current menu title is title entry;
	now the endnode flag is 1;
	redraw status line;
	now the endnode flag is 0;
	clear only the main screen;
	let X be the enemy entry;
	say description of X;
	if died count of X > 0 and X grants a power:
		repeat with P running through powers:
			if X grants P:
				say "[paragraph break][The printed name of X] awards [the P]:[paragraph break][description of P]";
				break;
	say paragraph break;
	pause the game;]



Section - Achievements menu

Table of Achievement Menu
title	text
"[run paragraph on][setup achievement menu][fixed letter spacing]Assistant Dungeoneer    [achievement assistant dungeoneer]"	"Kill a level 1 creature."
"[fixed letter spacing]Adventurer              [achievement adventurer]"	"Kill a level 2 creature."
"[fixed letter spacing]Hunter                  [achievement hunter]"	"Kill a level 3 creature."
"[fixed letter spacing]Destroyer               [achievement destroyer]"	"Kill a level 4 creature."
"[fixed letter spacing]Mageslayer              [achievement mageslayer]"	"Kill Malygris, the wizard of Kerkerkruip."
"[fixed letter spacing]Deathblow               [achievement deathblow]"	"Deal at least 20 damage with a single blow."
"[fixed letter spacing]I return to serve       [achievement I return to serve]"	"Have an undead creature that is allied to you kill someone."
"[fixed letter spacing]From the shadows I come [achievement From the shadows I come]"	"Kill an enemy at full health with one hit, while striking from the shadows."
["Stunning performance    [achievement Stunning performance]"	"Stun three different creatures in a single game."]
"[fixed letter spacing]Detox                   [achievement detox]"	"Win the game without using ment."
"[fixed letter spacing]Injury to insult        [achievement injury to insult]"	"Kill Malygris with your bare hands."
["Unmoved                 [achievement unmoved]"	"Win the game without using 'dodge' and 'parry'."]
"[fixed letter spacing]Nature's fragile vessel [achievement nature's fragile vessel]"	"Win the game with less than 15 maximum health."
"[fixed letter spacing]Make love not war       [achievement make love not war]"	"Achieve the romantic ending."
"[fixed letter spacing]Twice fallen            [achievement twice fallen]"	"Achieve victory in the Arena of the Fallen."
"[fixed letter spacing]Give them blood         [achievement give them blood]"	"Feed 50 blood to blood magic items in a single game."
"[fixed letter spacing]Royal fruit             [achievement royal fruit]"	"Receive the fabled Fruit of Kings."
"[fixed letter spacing]Sixth heaven            [achievement sixth heaven]"	"Get a +6 ment bonus."
"[fixed letter spacing]Durin's bane            [achievement durin's bane][variable letter spacing]"	"Wake up an unbeatable foe."

To say setup achievement menu:
	if Table of Held Achievements is empty:
		follow the load achievements rule.

To say achievement (current achievement - an achievement):
	if there is a held achievement of current achievement in the Table of Held Achievements:
		choose row with a held achievement of current achievement in the Table of Held Achievements;
		let m be held difficulty entry;
		if m is -1:
			say " -- not yet achieved";
		otherwise:
			say " -- achieved on [difficulty level m] ([m])";
	otherwise:
		say " -- not yet achieved".



Chapter - Start

Started boolean is a truth state that varies. Started boolean is false.

Last when play begins (this is the introduction rule):
	say "[paragraph break]When you claimed that you were tough enough to take on Malygris single-handedly, everyone knew you had been drinking much more than was good for you. And the prince is not one to let an opportunity pass. Before you could so much as protest, his court mage opened a portal and you were shoved through. Predictably, the portal immediately disappeared. You doubt they're going to open it up again -- but at least you can try to make good on your boast and kill Malygris, the Wizard of Kerkerkruip!";
	now started boolean is true. [See section Victory message below.]

Section - Starting kits

Option-2-chest is a container. Option-2-chest contains a scroll of shadows.
Option-3-chest is a container. Option-3-chest contains a scroll of protection and a scroll of the blade.
Option-4-chest is a container. Option-4-chest contains a scroll of death.
Option-5-chest is a container. Option-5-chest contains two fragmentation grenades and a Morphean grenade.
Option-6-chest is a container. Option-6-chest contains a scroll of mapping.
Option-7-chest is a container. Option-7-chest contains a scroll of teleportation.

Last when play begins:
	let n be a random number between 1 and 7;
	if n is 1:
		move gilded rapier to the player;
		now gilded rapier is readied;
		unready fists;
		now the player wears the buckler;
	if n is 2:
		move gorgeous dagger to the player;
		now gorgeous dagger is readied;
		unready fists;		
		equip player from option-2-chest;
	if n is 3:
		equip player from option-3-chest;
	if n is 4:
		move evil dagger to the player;
		now evil dagger is readied;
		unready fists;		
		equip player from option-4-chest;
	if n is 5:
		equip player from option-5-chest;
		now the player wears Metastasio's hat;
	if n is 6:
		move pickaxe to player;
		now pickaxe is readied;
		unready fists;		
		equip player from option-6-chest;
	if n is 7:
		move gilded rapier to player;
		now gilded rapier is readied;
		unready fists;		
		equip player from option-7-chest; 
	repeat with item running through things enclosed by the player:
		if item is a weapon or item is clothing:
			now item is not cursed.

To equip player from (box - a container):
	repeat with item running through things enclosed by box:
		move item to player;
		if item is a scroll:
			identify item.

To unready fists:
	let X be a random natural weapon enclosed by the player;
	now X is not readied.

Last report looking for the first time:
	say "Your meager possessions consist of [a list of things had by the player]."


Chapter - The end

Section - Death message

Every turn (this is the player death rule):
	if the player is dead:
		unless the global attacker is the player:
			end the story saying "You were killed by [the name of the global attacker]";
		otherwise:
			end the story saying "You committed suicide. How unseemly!".


Section - Victory message

The victory message rules are a rulebook.

To decide whether the player is victorious:
	if started boolean is false:
		decide no;
	let counter be 0;
	repeat with guy running through denizen monsters:
		if the level of guy is 5:
			unless guy is player-enslaved:
				now counter is 1;
	if counter is 0:
		decide yes;
	if Malygris-lover is true:
		decide yes;
	if Drakul-victory is true:
		decide yes;
	decide no.

Every turn (this is the victory rule):
	if the player is victorious:
		consider the victory message rules.
		
Last victory message rule (this is the normal victory message rule):		
	end the story saying "You have defeated Malygris! With his immense magical powers now at your disposal, it is time to teleport back to Montenoir and pay a little visit to the prince.";
	rule succeeds.

Victory message rule (this is the Nameless Horror message rule):
	if the Nameless Horror is follower:		
		end the story saying "You have won... technically. The Nameless Horror will find you soon, and your end will not be pretty.";
		rule succeeds.

Victory message rule (this is the enslaved Malygris message rule):
	if Malygris is player-enslaved:		
		end the story saying "You have turned Malygris into your slave!";
		rule succeeds.

To do the level 10 victory with (guy - a person):
	say "In slaying [the guy], you have done the impossible. You absorb its soul, and though this process leaves little of your own personality intact, your powers increase a thousandfold. Even the gods bow to you.";
	end the story saying "You reign eternally!".


Section - What happens after the obituary

After printing the player's obituary (this is the update the difficulty rule):
	if the player is victorious:
		set data value 1 to (data value 1) + 1, table only; [ number of victories ]
		set data value 4 to (data value 4) + 1, table only; [ number of victories for the purpose of unlocking ]
		increase difficulty by 1; [We want to go from easy to normal difficulty.]
		if difficulty is 1:
			say "[paragraph break][bold type]You have defeated Malygris on easy mode, proving that you understand the basics of the game! Next time, Kerkerkruip will start in normal mode. From now on, new items, monsters and locations will be available. Have fun![roman type][paragraph break]";
		if difficulty is greater than data value 3: [ best level ]
			set data value 3 to difficulty, table only;
	otherwise:
		unless difficulty is less than 2:
			decrease difficulty by 1;
	set data value 2 to difficulty;

Last after printing the player's obituary (this is the list unlocked stuff rule):
	if the player is victorious:
		let number-of-victories be data value 4;
		if number-of-victories > 99 or number-of-victories < 2:
			stop;
		let X be a list of objects; [We cannot repeat through objects, so:]
		repeat with Y running through rooms:
			if unlock level of Y is number-of-victories:
				if unlock hidden switch of Y is not true:
					add Y to X;
		repeat with Y running through persons:
			if unlock level of Y is number-of-victories:
				if unlock hidden switch of Y is not true:		
					add Y to X;
		repeat with Y running through things:
			if Y is not a person:
				if unlock level of Y is number-of-victories:
					if unlock hidden switch of Y is not true:			
						add Y to X;
		if X is not empty:
			say "[line break]You have [bold type]unlocked[roman type] new content:[line break][run paragraph on]";
			repeat with item running through X:
				say "* [the item] ([unlock text of item])[line break]";
			say "[line break]";


Section - The final question

[First stuff to get around an Inform 7 bug.]
Table of Literal Topics
text	topic
"new"	"new"

When play begins: 
	choose row with a final response rule of immediately restore saved game rule in the Table of Final Question Options; 
	blank out the whole row;
	choose row with a final response rule of immediately undo rule in the Table of Final Question Options; 
	blank out the whole row;
	choose a row with a text of "new" in the Table of Literal Topics;
	let new be the topic entry;	
	choose row with a final response rule of immediately restart the VM rule in the Table of Final Question Options;
	now topic entry is new;
	now final question wording entry is "start a NEW game";


Section - Lower the difficulty when restarting

First carry out restarting the game (this is the lower difficulty on restart rule):
	unless player is victorious:
		unless difficulty is less than 2:
			set difficulty to (difficulty - 1);

Kerkerkruip Start and Finish ends here.
