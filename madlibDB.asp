<!-- #include virtual="/includes/asplib/init.2.asp" -->
<%
	
	var numMadLibs = 2;

	var madLibGen_class = function(){};
	
	madLibGen_class.prototype.madLibs0 = function() {
	%>
			<div class="madLib">
				<div class="title">All a Dream</div>
				<span class="sentence">I fell asleep yesterday listening to an old album that my mom had.</sentence>
				<span class="sentence">I really enjoyed it, though I had a weird dream. It was kind of like one of the old songs.</sentence>
				<span class="sentence">I've been workin' in <span data-ML="noun_location"></span>, All the <span data-ML="adjective"></span> day.</span>
				<span class="sentence">I've been workin' in <span data-ML="noun_location"></span>, Just to pass the time away.</span>
				<span class="sentence">Don't you hear the whistle <span data-ML="verb_ing"></span>?</span>
				<span class="sentence">Rise up so early in the morn.</span>
				<span class="sentence">Don't you hear <span data-ML="noun_proper"></span> shouting "<span data-ML="noun_person"></span>, hit your horn? "</span>
	
				<span class="sentence">
					<span data-ML="noun_person"></span>, won't you hit,
					<span data-ML="noun_person"></span>, won't you hit,
					<span data-ML="noun_person"></span>, won't you hit your horn?
				</span>
				
				<span class="sentence">
					<span data-ML="noun_person"></span>, won't you hit,
					<span data-ML="noun_person"></span>, won't you hit,
					<span data-ML="noun_person"></span>, won't you hit your horn?
				</span>
	
				<span class="sentence">Someone's in the <span data-ML="noun_location"></span> with <span data-ML="noun_person"></span>.</span>
				<span class="sentence">Someone's in the <span data-ML="noun_location"></span>, I know. </span>
				<span class="sentence">Someone's in the <span data-ML="noun_location"></span> with <span data-ML="noun_person"></span></span>
				<span class="sentence">Strumming on the old <span data-ML="noun_thing"></span>.</span>
	
				<span class="sentence">It was the weirdest dream I've had in a long time!"</span>
			</div>
	<%
	};
		
	madLibGen_class.prototype.madLibs1 = function() {
	%>
			<div class="madlib">
				<div class="title">The New Computer Game</div>
				<span class="sentence">For my birthday, I got a new computer game.</span>
				<span class="sentence">It's really <span data-ML="adjective"></span>!</span>
				<span class="sentence">The main character wears <span data-ML="adjective"></span> glasses, called the Multiple Perspecticles, that allow him to see what other people think.</span>
				<span class="sentence">I have been <span data-ML="verb_ing"></span> it a lot since I got it.</span>
				<span class="sentence">I guess I've been playing the game a lot because I've started to be able to tell what people are thinking!</span>
				<span class="sentence">The other day, I forgot to take out the <span data-ML="noun"></span> and it was really <span data-ML="adverb"></span> in the <span data-ML="noun_location"></span>.</span>
				<span class="sentence">I could tell just by looking at my mom that she was mad!</span>
				<span class="sentence">Another day, I forgot to make my lunch and I left my homework at home, so I called Dad at work.</span>
				<span class="sentence">I could tell even without seeing him that he was <span data-ML="adjective"></span>.</span>
				<span class="sentence">I think I may have on my own invisible Multiple Perspecticles!</span>
			</div>	
	<%
	};
	
	var myMadLibs = new madLibGen_class();
	
	
	var randNum = Math.floor(Math.random()*numMadLibs);
	myMadLibs["madLibs" + randNum]();
%>