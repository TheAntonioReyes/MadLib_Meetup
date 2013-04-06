<!-- #include virtual="/includes/asplib/init.2.asp" -->
<!-- #include virtual="/includes/asplib/serializer/serializer.3.asp" -->
<%

		var word = {
			adjective: [
				"dirty"
				,"cold"
				,"lazy"
				,"smelly"
			],
			noun: [
				"hammer"
				,"trash-man"
				,"jack-hammer"
				,"mouse"
			],
		
			noun_proper: [
				"Jack Nicholson"
				,"Robert DeNiro"
				,"Bruce Wayne"
			],
			noun_person: [
				"Paul"
				,"Steve"
				,"Mike"
				,"Bob"
			],
			noun_location: [
				"Califronia"
				,"Guantanamo Bay"
				,"Lodo"
				,"Boulder"
			],
			noun_thing: [
				"knife"
				,"fork"
				,"spoon"
				,"spork"
			],
			verb: [
				"bring"
				,"read"
				,"walk"
				,"learn"
			],
			verb_ing: [
				"testing"
				,"fishing"
				,"hunting"
			],
			adverb: [
				"steathily"
				,"slowly"
				,"suddenly"
			]			
		};
		
		var wordCollection = {};
		var rand1, rand2;
		for(var category in word) {
			rand1 = Math.floor(Math.random()*word[category].length);
			rand2 = Math.floor(Math.random()*word[category].length);
			
			if( rand1 == rand2 ) {
				rand2 = (word[category].length == rand2 + 1) ? (rand2 - 1) : (rand2 + 1);
			}
			
			wordCollection[category] = [];
			wordCollection[category].push( word[category][rand1] );
			wordCollection[category].push( word[category][rand2] );
		}
		
		
		
		Response.Write( new Serializer().serialize(wordCollection) );
%>