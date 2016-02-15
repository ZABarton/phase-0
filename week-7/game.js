 // Design Basic Game Solo Challenge

// This is a solo challenge

// Your mission description:
// Overall mission: Your mission is to win the presidential debate and claim your party's nomination
// Goals: Gain over 50% of the popular vote
// Characters: You (presidential candidate #1) and your enemy (presidential candidate #2)
// Objects: Your character, the other candidate, and the audience
// Functions: Each turn, pick an action to perform in the debate. Each action is a separate function that
//            modifies the properties of you (popularity, political leaning), your opponent (offensive vs
//            defensive behavior), and the audience (support for your candidacy)

// Pseudocode
// Define a 'player' object with several properties (popularity, political leaning)
// Define an 'opponent' object with several properties (popularity, political leaning, behavior)
// Define an 'audience' object with several properties - each property represents a different demographic
// The goal is to pick functions based on what you think the demographics of the audience are
// Successful picks will raise your popularity and decrease your opponents popularity
// Unsuccessful picks will do the opposite
// After you and your opponent each pick an action, the demographics will shift based on your actions

// player object and opponent object
// 	define initial properties
//	define an action property that is a function, takes an argument 'choice'
//		depending on what 'choice' is, calculates the magnitude of the reaction and
//		applies the changes to both you and the opponent's properties

// define an audience object
// audience has several properties to represent their mood
// the effectiveness of your action is based on these numbers
// but they are secret so you need to try to read the crowd first

// after you pick, the opponent will randomly call one of these functions
// their magnitude will be multiplied by -1 to counteract your changes

// finally, based on which actions were taken, the audience numbers will change

// repeat this sequence 5 times
// after 5 times, the object (player or opponent) with highest popularity property wins
// 
// // Initial Code
// var change = 0;
// var questions = ["Our nation faces a grave threat from beyond the northern wall - thoughts?", "What are your thoughts on cilantro?", "Would you ever consider eating horse meat?", "Do I look fat in this suit?", "How much wood could a woodchuck chuck if a woodchuck could chuck wood?"]

// var player = {
// 	popularity: 50, // on a scale of 0 to 100 - need more than your opponent to win
// 	credibility: 5, // on a scale of 1 to 10
// 	nerves: 1,	// 1 to 10
// 	action: function(choice) {
// 		if (choice === "defend") {
// 			change = 15;
// 			popularity_check();
// 		}
// 		if (choice === "attack") {
// 			change = 10;
// 			popularity_check();
// 		}
// 		if (choice === "pander") {
// 			change = 5;
// 			popularity_check();
// 		}
// 		if (choice === "statement") {
// 			get_statement();
// 			popularity_check();
// 		}
// 		if (choice === "read") {
// 			audience_read();
// 		}
// 		if (choice === "poll") {
// 			polling();
// 		}
// 	}
// }

// var opponent = {
// 	popularity: 50,
// 	credibility: 5,
// 	nerves: 1, // on a scale of 0-10 - lower numbers are offensive, higher numbers are defensive
// }

// var audience = {
// 	liberal: 0.5,
// 	conservative: 0.5,
// 	peaceful: 0.3,
// 	bloodthirsty: 0.7,
// 	good: 0.4,
// 	evil: 0.6,
// }

// // console.log(player);
// // console.log(opponent);
// // console.log(audience);

// function menu() {
// console.log("What would you like to do?");
// console.log("1. Defend your qualifications for leadership");
// console.log("2. Attack your opponent");
// console.log("3. Shamelessly pander");
// console.log("4. Make an incredulous claim and/or statement");
// console.log("5. Read the crowd");
// console.log("6. Check your polling numbers")
// }

// function popularity_check() {
// 	if (change >= 10) {
// 		console.log("The crowd has a visceral reaction");
// 	}
// 	player.popularity += change;
// 	opponent.popularity -= change;
// }

// var statements = ["Terrorists want to plant a dirty bomb inside our internets", "Global warming is a crypto-fascist conspiracy headed by the Stonemasons", "I have collected all the Pokemon"]
// function get_statement() {
// 	var speak = Math.floor((Math.random() * 3));
// 	player.credibility -= 1;
// 	change = 5*speak;
// 	console.log(statements[speak]);
// }

// function audience_read() {

// }

// function polling() {

// }

// player.action("statement");
// 	console.log(player);
// 	console.log(opponent);
// 	console.log(audience);
// // Refactored Code

// I..uh..may have gone overboard with this.
<script>

var you;
var opponent;
var audience;
var num_turns = 0;
var max_turns = 5;

var polls = "";
var mood = "";
var strength = "";

var boredom = "";
var anger = "";
var trust = "";
var respect = "";

var pop_change = 0;
var change = 0;

var action = ""

var leads = ["quickly now, what are your thoughts about ", "can you tell us about your recent involvement with ", "it's a controversial topic, but I have to bring it up: how do you feel about ", "and now, the topic on everybody's mind. Can you tell us a little bit about ", "can you confirm or deny the existence of ", "I'm known for asking the hard-hitting questions, so here we go: what do you have to say about ", "just what are you going to do about ", "it's a threat to our very fabric of our nation. Tell us about your plan to combat ", "and now for something completely different. Your thoughts on ", "can you elaborate on comments you made this campaign cycle about "]
var topics = ["Pokemon", "cilantro", "global warming", "gasoline prices", "delicious after-school snacks", "the meaning of life", "the constant threat of attack from beyond the northern wall", "dogs with bees in their mouth and when they bark they shoot bees at you", "independent folk music", "Elvis Presley and his untimely return from the grave"]

//start the game

//generate player attributes, generate initial audience behavior
function start_game() {
	you = new player("Senator", 50, 1.00, 5, 1.00)
	opponent = new player("Councilman", 50, 1.00, 5, 1.00);

	moderator = {
		topic: ""
	}


	generate_audience();	
	turn_structure();
}

function player(name, popularity, conviction, credibility, nerves) {
	this.name = name;
	this.popularity = popularity; // starts at 50, can range from 0-100
	this.credibility = credibility; // additive bonus, 0-10
	this.conviction = conviction; // 0.70 - 1.30 - lower is better
	this.nerves = nerves; // 0.5 to 1.00 - worse nerves reduces total result
}

function generate_audience() {
	audience = {
		bored: Math.floor(Math.random()*10),
		peaceful: Math.floor(Math.random()*10),
		trusting: Math.floor(Math.random()*10),
		weak: Math.floor(Math.random()*10)
	}
	audience.interest = (10 - audience.bored);
	audience.bloodthirsty = (10 - audience.peaceful);
	audience.skeptical = (10 - audience.trusting);
	audience.strong = (10 - audience.weak);
}

function turn_structure() {
	num_turns ++;
		if (num_turns > max_turns) {
			victory_check();
		}
		else {
		document.getElementById("action").innerHTML = "You are answering question number " + num_turns + "."
			read_audience();
			read_self();
			question();
		}
}

//updates the alert box with your condition
function read_self() {
	check_strength();
	check_cred();
	check_nerves();
	check_popular();
	document.getElementById("status").innerHTML = 'The InstaPoll Instantaneous Poll Tracker display ' + polls + '<br><br>' + strength + '<br><br>' + cred +'<br><br>' + mood
}

//updates the alert box with your opponent's condition

//updates the alert box with general audience specs
function read_audience() {
	check_bored();
	check_peace();
	check_trusted();
	check_respected();
	document.getElementById("msg").innerHTML = boredom + '<br>' + anger + '<br>' + trust + '<br>' + respect;
}

function question() {
	introductions = ["The moderator looks at you with steely eyes and reads the next question.", "The moderator, with ice in their veins and a cold indifference, reads the next question.", "The moderator throws the cue cards over their shoulder and asks the next question off-the-cuff.", "The moderator reads the next cue card, shrugs and rolls their eyes, and proceeds to ask the next question.", "The moderator impatiently checks their watch and then hurriedly asks the next question."]
	var intro = introductions[Math.floor(Math.random()*5)];
	var lead_in = leads[Math.floor(Math.random()*10)];
	moderator.topic = topics[Math.floor(Math.random()*10)];
	document.getElementById("round").innerHTML = intro + '<br><br>' + "'Senator, " + lead_in + moderator.topic + "?'<br><br><span class='bold'>How would you like to respond?</span>";
	document.getElementById("choices").innerHTML = "<button type='button' onclick='attack()'>Attack your opponent</button> <button type='button' onclick='defend()'>Defend your qualifications</button> <button type='button' onclick='pander()'>Blatantly pander to the audience</button> <button type='button' onclick='statement()'>Say something ridiculous</button>";
}

function attack() {
	var attacks = ["You jerk your thumb at your opponent. 'This guy couldn't tell you about " + moderator.topic + " if it hit him on the head!'", "You declare, 'My opponent has long suppressed information about " + moderator.topic +"!'", "You pound your chest and bellow, 'Let the record show that my opponent is weak on " + moderator.topic + " and always will be!'"]
	var att = [Math.floor(Math.random()*3)]
	document.getElementById("action").innerHTML = attacks[att];
	var difference = (audience.bloodthirsty - audience.peaceful);
	if (difference > 0) {
		pop_change = ((difference)+(you.credibility/you.conviction))*you.nerves;
		console.log("Your pop_change value from attacking is " + pop_change);
		you.conviction -= 0.10
		opponent.credibility -= 2
	}
	if (difference <= 0) {
		pop_change = difference;
	}
	opponent_turn()
}

function defend() {
	var defense = ["You puff your chest out and say, 'I've always been a strong supporter of " + moderator.topic + ". You can check the transcripts if you want.'", "You raise your fist to the sky and cry out, 'I unabashedly support " + moderator.topic + " and I won't be suppressed by the lamestream media!'", "You stare down the moderator and exclaim, 'I alone have the qualities needed to make " + moderator.topic + " great again!'"]
	var def = [Math.floor(Math.random()*3)]
	document.getElementById("action").innerHTML = defense[def];
	var difference = (audience.trusting - audience.skeptical);
	if (difference > 0) {
		pop_change = ((difference)+(you.credibility/you.conviction))*you.nerves;
		you.credibility += 2;
		opponent.nerves -= 0.20;
	}
	if (difference <= 0) {
		pop_change = difference;
	}
	opponent_turn()
}

function pander() {
	var pandering = ["You warmly smile at the crowd and say, 'I know the great people of [INSERT STATE HERE] love " + moderator.topic + " and as your next President, I'll respect that.'", "You open your arms to the crowd and declare, 'This land is [POSITIVE ADJECTIVE] and are not afraid to [VERB], which is why I will protect your right to " + moderator.topic + "!'", "You point to a baby in the crowd and say, 'Can you imagine a child growing up in [INSERT COUNTRY HERE] without " + moderator.topic + "? As your next president, I sure can't.'"]
	var pander = [Math.floor(Math.random()*3)]
	document.getElementById("action").innerHTML = pandering[pander];
	var difference = (audience.strong - audience.weak);
	if (difference > 0) {
		pop_change = ((difference)+(you.credibility/you.conviction))*you.nerves;
		you.nerves += 0.2;
		if (you.nerves > 1) {
			you.nerves = 1.00;
		} 
		opponent.conviction +0.10;
	}
	if (difference <= 0) {
		pop_change = difference;
	}
	opponent_turn()
}

function statement() {
	var crazy = ["'I've always maintained that " + moderator.topic + " is a crypto-fascist conspiracy run from the shadows by the Pod People!'", "'I will build a forty-foot wall around our borders to keep out " + moderator.topic +"!'", "'For it is said that using naught but blood and sinew, the demons have created " + moderator.topic + ", and I will cast out this abomination with my Presidental hands of justice!'"]
	var big = [Math.floor(Math.random()*3)]
	document.getElementById("action").innerHTML = "You decide to go for broke: " + crazy[big];
	var difference = (audience.bored - audience.interest);
	var own = ((difference)+(you.credibility/you.conviction))*you.nerves;
	var theirs = ((difference)+(opponent.credibility/opponent.conviction))*opponent.nerves;
	if (own > theirs) {
		pop_change = (difference*2);
	}
	if (own < theirs) {
		pop_change = (difference*(-2));
	}
	if (own = theirs) {
		pop_change = 0;
	}
	opponent_turn()
}

function opponent_turn() {
	generate_audience()
  change = (Math.floor(Math.random()*5))+1;
	console.log("Random " + change);
	var possible_responses = ["Your opponent blathers on endlessly, you're not even sure what about.", "Your opponent unleashes a stream of curse words unfit for this debate and/or modern society.", "Your opponent stares at you, incredulously, before delivering his response.", "Your opponent pulls out a top hat and cane from under the podium and does a little jig during his counter-response.", "Your opponent, as if to show off, delivers his response in a foreign language. You catch none of it.", "Your opponent decides to attempt to filibuster the debate and launches into a reading of Moby Dick.", "Your opponent laughs at you mockingly, then proceeds to respond.", "Your opponent cries foul, for some reason or another, and complains to the moderator for ten minutes.", "Your opponent declares that he's 'about to go bald all up in this' and angrily sweeps the wig off his head.", "Your opponent signals to the booth for a little mood lighting, then proceeds to slow jam his response."];
	var response; 
	response = Math.floor(Math.random()*10);
	if (response % 3 == 1) {
		you.nerves -= 0.20;
		if (you.nerves < 0) {
			you.nerves = 0;
		}
		opponent.conviction -=0.10;
		var reaction = "You get nervous as your opponent looks like he regains his conviction."
	}

	if (response % 3 == 2) {
		you.credibility -= 2;
		opponent.nerves += 0.2;
		if (opponent.nerves > 1) {
			opponent.nerves = 1.00;
		}
		var reaction = "As your opponent regains his nerves, you feel like you lost some credibility."
	}

	if (response % 3 == 0) {
		you.conviction += 0.10;
		opponent.credibility += 2;
		var reaction = "You feel less conviction flowing through you as your opponent looks more credible."
	}

	you.popularity -= change;
	opponent.popularity += change;
	document.getElementById("status").innerHTML = possible_responses[response] + '<br><br>' + reaction
	update()
}

function update() {
	
	if (pop_change > 0) {
		var react = "It worked! The audience likes it!";
	} else if (pop_change < 0) {
		var react = "It didn't work! The audience hated it!";
	} else {
		var react = "The audience had no reaction to this whatsoever.";
	}

	if (you.conviction < opponent.conviction) {
		var convict = "You appear stronger in your convictions than your opponent.";
	} else if (you.conviction > opponent.conviction) {
		var convict = "Your opponent appears stronger in their convictions.";
	} else {
		var convict = "You both appear equal in your conviction.";
	}

	if (you.credibility > opponent.credibility) {
		var credit = "You seem to have more credibility than your opponent.";
	} else if (you.credibility < opponent.credibility) {
		var credit = "Your opponent appears to be more credible than you.";
	} else {
		var credit = "You both appear equally credible.";
	} 

	document.getElementById("msg").innerHTML = react;

	you.popularity += pop_change;
	opponent.popularity -= pop_change;
	if ((pop_change - change) > 0) {
		var pop = "You came out ahead with more popularity after this exchange."
	} else if ((pop_change - change) < 0 ) {
		var pop = "You ended up losing popularity in this exchange."
	} else {
		var pop = "There was no net change in popularity after this exchange."
	}

	if (you.popularity > 100) {
		you.popularity = 100;
	}
	if (opponent.popularity > 100) {
	opponent.popularity = 100;
	}
	if (you.popularity < 0) {
	you.popularity = 0;
	}
	if (opponent.popularity < 0) {
	opponent.popularity = 0;
	}
	document.getElementById("round").innerHTML = pop + '<br>' + convict + '<br>' + credit + '<br><br>The mood of the audience shifts!';
	document.getElementById("choices").innerHTML = "<button type='button' onclick=turn_structure()>Next Question, Please</button>"
}

function victory_check() {
	opponent.popularity = Math.round(opponent.popularity)
	you.popularity = Math.round(you.popularity)
	var alert = ""
	var result = ""
	if (you.popularity > opponent.popularity) {
	var round = "The moderator stands up and announces to all, 'THE RITUAL IS COMPLETE, IT HAS BEEN DECIDED.' A single spotlight turns on and slowly swivels to your podium. The room bursts into cheers as the moderator continues his intonations. 'BEHOLD, YOUR NEXT PRESIDENT!' As per the customary tradition, the moderator slams their hand on a large red button on their desk. A trap door opens up under your opponent, swallowing both him and his podium. He is never seen again.<br><br><span class='bold'>YOU WIN! " + you.popularity + " to " + opponent.popularity +"</span>";
	}	else if (you.popularity < opponent.popularity) {
	var round = "The moderator sadly looks at you as the room falls silent. Never in your wildest dreams could you have imagined such a moment of horror. A single gong resounds throughout the hall as you realize that this is truly the end. The moderator raises their hand, then drops it on an imposingly large red button on their desk. You hear a mechanical click as the floor gives way beneath you, and then you are falling. Down, down, forever falling.<br><br><span class='bold'>YOU LOSE! " + you.popularity + " to " + opponent.popularity + "</span>";
	} else {
	var round = "The entire room falls silent as the moderator can barely squeak the words out of their throat. 'It's a tie.' This has never before happened in all of political history, and nobody knows what to do. With no leader elected, the country falls into disarray. Future generations will look back upon this moment as the beginning of the end of human civilization.<br><br>Maybe you should have tried lying more often.<br><br><span class='bold'>TIE GAME - EVERYONE LOSES.</span>";
	}
	document.getElementById("alert").innerHTML = alert;
	document.getElementById("result").innerHTML = result;
	document.getElementById("round").innerHTML = round;
	document.getElementById("choices").innerHTML = "<button type='button' onclick=location.reload()>Play Again</button>"
}

//get audience specs
function check_bored() {
	if (audience.bored <= 1) {
		 boredom = "The audience is fired up and ready to go!.";
	}
	if (audience.bored >= 2 && audience.bored < 4) {
		 boredom = "The audience is visibly engaged in the debate.";
	}
	if (audience.bored >= 4 && audience.bored < 7) {
		 boredom = "The audience seems indifferent to the events on stage.";
	}
	if (audience.bored >= 7 && audience.bored < 9) {
		 boredom = "The audience appears to be somewhat bored.";
	}
	if (audience.bored >= 9) {
		 boredom = "The audience could not look more bored.";
	}
}

function check_peace() {
	if (audience.peaceful <= 1) {
		 anger = "People in the crowd are crying for blood!";
	}
	if (audience.peaceful >= 2 && audience.peaceful < 4) {
		 anger = "An angry murmur ripples through the crowd.";
	}
	if (audience.peaceful >= 4 && audience.peaceful < 7) {
		 anger = "The crowd appears calm...for now.";
	}
	if (audience.peaceful >= 7 && audience.peaceful < 9) {
		 anger = "The crowd looks visibly relaxed.";
	}
	if (audience.peaceful >= 9) {
		 anger = "The crowd is incredibly peaceful.";
	}
}

function check_trusted() {
	if (audience.trusting <= 1) {
		 trust = "The crowd looks incredibly skeptical.";
	}
	if (audience.trusting >= 2 && audience.trusting < 4) {
		 trust = "The crowd looks slightly skeptical.";
	}
	if (audience.trusting >= 4 && audience.trusting < 7) {
		 trust = "The crowd is wavering between trust and skepticism.";
	}
	if (audience.trusting >= 7 && audience.trusting < 9) {
		 trust = "The crowd finds this debate somewhat trustworthy.";
	}
	if (audience.trusting >= 9) {
		 trust = "The crowd trusts every word they hear.";
	}
}

function check_respected() {
	if (audience.weak <= 1) {
		 respect = "The audience demands to hear what they want!";
	}
	if (audience.weak >= 2 && audience.weak < 4) {
		 respect = "The audience would appreciate it if you catered to them.";
	}
	if (audience.weak >= 4 && audience.weak < 7) {
		 respect = "The audience will give your statements a fair chance.";
	}
	if (audience.weak >= 7 && audience.weak < 9) {
		 respect = "The audience looks tired of hearing the same ol' stump speeches.";
	}
	if (audience.weak >= 9) {
		 respect = "The audience has complete contempt for tired talking points.";
	}
}

function check_popular() {
	var difference 
	if (you.popularity - opponent.popularity >= -10 && you.popularity - opponent.popularity <= 10 ) {
		 polls = "currently indicates that the debate is too close to call.";
	}
	if (you.popularity - opponent.popularity < -10 && you.popularity - opponent.popularity >= -20 ) {
		 polls = "suggests your opponent holds a slight lead";
	}
	if (you.popularity - opponent.popularity < -20) {
		 polls = "has been replaced with the poop emoji, with a caption reading 'Your chances at winning.'";
	}
	if (you.popularity - opponent.popularity > 10 && you.popularity - opponent.popularity <= 20 ) {
		 polls = "indicates that the race is currently in your favor.";
	}
	if (you.popularity - opponent.popularity > 20) {
		 polls = "boldy claims that you are, in fact, 'nailing it.'";
	}
}

function check_strength() {
	if (you.conviction >= 0.70 && you.conviction < 0.90) {
		strength = "Your conviction is unshakeable. Your words echo with power."
	}
	if (you.conviction >= .90 && you.conviction < 1.10) {
		strength = "Your conviction is firm.";
	}
	if (you.conviction >= 1.10 && you.conviction <= 1.30) {
		strength = "Your conviction is weakened. Your words ring hollow.";
	}
}

function check_cred() {
	if (you.credibility >= 1 && you.credibility < 3) {
		mood = "Your credibility is terrible!"
	}
	if (you.credibility >= 3 && you.credibility < 5) {
		mood = "Your credibility is lacking."
	}
	if (you.credibility === 5) {
		mood = "Your credibility seems okay."
	}
	if (you.credibility >= 6 && you.credibility < 8) {
		mood = "Your credibility is good."
	}
	if (you.credibility >= 8 && you.credibility <= 10) {
		mood = "Your credibility is unassailable!"
	}
}

function check_nerves() {
	if (you.nerves = 1.00) {
		cred = "You feel pretty calm!"
	}
	if (you.nerves =  0.80) {
		cred = "You have a few butterflies in your stomach."
	}
	if (you.nerves = 0.60) {
		cred = "You're very, very nervous about what to do next."
	}
	if (you.nerves = 0.40) {
		cred = "You try to suppress constant waves of anxiety."
	}
	if (you.nerves = 0.00) {
		cred = "You are in a state of panic. Sweat drips off your face. How did you get here? Somebody, please help."
	}
}

function quit() {
	var alert = ""
	var result = ""
	var round = "The room falls so silent that you could hear a pin drop all the way from the cheap seats. After a very long, awkward pause, the moderator finally speaks.<br><br>'Well, this is certainly unexpected. But rules are rules. By the power vested in me by the National Debate Moderation Society, I hereby bestow the party nomination to the Councilman. Better luck in the next four years, I guess.'";
	document.getElementById("alert").innerHTML = alert;
	document.getElementById("result").innerHTML = result;
	document.getElementById("round").innerHTML = round;
	document.getElementById("choices").innerHTML = "<button type='button' onclick=location.reload()>Play Again</button>"
}

</script>

// Reflection

// What was the most difficult part of this challenge?

// I had a few issues with this. First, I wanted to create my own game but that quickly became more complicated than I imagined. I tried to
// work on just an MVP but after realizing I needed to take input in an HTML form, the design of the game spiraled out of control. I feel like
// there is a lot of refactoring to be done, but because I took so long to get the code working in a browser, I didn't have time to dig deeper
// into making this more efficient. I am glad that I got a functioning program, though, because I can continue to improve upon this as I learn more.

// What did you learn about creating objects and functions that interact with one another?

// I thought that interacting to get properties out of objects using functions was pretty straightforward. I think I should have definitely tried
// putting functions INTO my objects as methods so that I could make the user's actions more efficient in the program.

// Did you learn about any new built-in methods you could use in your refactored solution? If so, what were they and how do they work?

// Not yet, but I'm really looking forward to researching. There's GOT to be a more efficient way to do these giant case switches for all
// of the status checks. I'm also looking forward to seeing what other people have done and figuring out how to condense the mathematical part
// of the game into methods than separate functions.

// How can you access and manipulate properties of objects?

// I can access properties of objects pretty similar to how I would access values in a Ruby hash by using bracket notation, or I could
// write it out using the dot method using syntax such as object.property. This will let me call a function if it defined as an object
// property.

