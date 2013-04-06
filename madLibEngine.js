var madLib_class = function() {
	
};

madLib_class.prototype.TEMPLATE_PATH = "madlibDB.asp";  //Where you will request the template from
madLib_class.prototype.WORD_PATH = "madlibWordDB.asp";  //Path to the random word database

madLib_class.prototype.init = function() {
	
}

/****************************************************/
/*	setupWordCollection
		this function sets up the words that will be used in the madLib
		you can either pass your own collection oArgs.data or it will
		request a random list from the server, if you take the second
		approach it is recomend to supply an onload function that will
		be called upon completion of the ajax request
		
		word collection format
		{
			wordCategory: [val1, val2,..]
		}

		current word categories:
		adjective, noun, noun_proper, noun_person, noun_location, noun_thing, 
		verb, verb_ing, adverb
*/
/****************************************************/
madLib_class.prototype.setupWordCollection = function(oArgs) {
	var self = this;	
	var oArgs = oArgs || {};

	function setupPointer() {
		self.wordCollectionPointer = {};
		
		for(var category in self.wordCollection) {
			self.wordCollectionPointer[category] = {index: 0, length: self.wordCollection[category].length};
		}
		
		if(oArgs.onload) { oArgs.onload(); }
	}

	if(oArgs.data) {
		this.wordCollection = oArgs.data;
		setupPointer();
	} else {
		
		jQuery.ajax({
		 	 url: madLibEngine.WORD_PATH
			,success: function(data) {
				self.wordCollection = jQuery.parseJSON(data);
				setupPointer();
			}
		});
		
	}
	
}


/****************************************************/
/*	fillNextWord
		used to fill the next word in the queue using the next word
		in the word collection, for each category it will iterate through
		the array and start at the begining after it reaches the last item
*/
/****************************************************/
madLib_class.prototype.fillNextWord = function() {
	
	if(!this.rElements.length) { return false; }
	
	var $currentElement = jQuery(this.rElements.shift());
	var wordCategory = $currentElement.attr("data-ML");		
	var currentWord = "----";
		
	if( this.wordCollection[wordCategory] ) {
		currentPointer = this.wordCollectionPointer[wordCategory];
		currentWord = this.wordCollection[wordCategory][currentPointer.index];
		
		if((currentPointer.index + 1) >= currentPointer.length) { currentPointer.index = 0; }
		else currentPointer.index++;
			
	}
	
	//the prefillhandler should return true to use the current word in the 
	//current element
	if(  this.preFillHandler($currentElement[0], currentWord, wordCategory)  )  { 
		$currentElement.html(currentWord);
	}
	
	this.postFillHandler($currentElement[0]);
};


/****************************************************/
/*	preFillHandler
		this method will be called before the current word is added into
		the element
		
			-Element  - a DOM element of the span about to be modified
			-currentWord  - the currenlty selected word from the collection
			-wordCategory  - the category as found on the span tag
			
		return true to have the current word added to the element, o/w no
		modification of the element will take place
*/
/****************************************************/
madLib_class.prototype.preFillHandler = function(element, currentWord, wordCategory) {
	
	
	return true; 
}

/****************************************************/
/*	postFillHandler
		this method will be called after the current word has been added
		to the span tag
		
			-Element  - a DOM element of the span that was just modified
		
		generally this function should call fix next word to continue the
		process of parsing the madlib
*/
/****************************************************/
madLib_class.prototype.postFillHandler = function(element) {
	
	this.fillNextWord();
}


/****************************************************/
/*	parseHTML
		this method will take the madlib html string convert it to a dom 
		fragment and return it. It will also create a queue (rElements)
		which fillNextWord uses to iterate over the html
		
			-data  - a string of HTML returned from the retrieve madlib call
		
		returns a dom fragment of the madlib
*/
/****************************************************/
madLib_class.prototype.parseHTML = function(data) {
	var self = this;
	this.rElements = [];
	
	var $frag = jQuery(data);
	
	var $wordElements = $frag.find('span[data-ML]').each(function() {
		self.rElements.push( jQuery(this)[0] );
	});

	return $frag[0];
}

var madLibEngine = new madLib_class();