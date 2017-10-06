private
executeScript: aFileReference withInput: inputFileReference andStoreResultInFile: outputFileReference
	"Execute the script #aFileReference with #inputFileReference as parameter in the shell.
	 Stores its results in the #outputFileReference."
	LibC system: ('{1} {2} > {3}' format: { aFileReference fullName . inputFileReference fullName . outputFileReference fullName })