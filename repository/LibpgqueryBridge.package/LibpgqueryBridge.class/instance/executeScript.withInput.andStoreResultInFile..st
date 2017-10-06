private
executeScript: aFileReference withInput: inputFileReference andStoreResultInFile: outputFileReference
	"Execute the script #aFileReference with #inputFileReference as parameter in the shell.
	 Stores its results in the #outputFileReference."
	| process |
	process := OSProcess command: ('{1} {2} > {3}' format: { aFileReference fullName . inputFileReference fullName . outputFileReference fullName }).
	
	[ process isComplete and: [ process succeeded ] ]
		whileFalse: [ 50 milliSeconds wait ].