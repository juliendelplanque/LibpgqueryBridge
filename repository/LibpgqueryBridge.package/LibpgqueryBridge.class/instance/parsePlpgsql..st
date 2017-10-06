parsing
parsePlpgsql: aString
	| inputTempFile outputTempFile result |
	inputTempFile := self uuidTempFileReference.
	inputTempFile writeStreamDo: [ :s | s << aString ].
	outputTempFile := self uuidTempFileReference.
	
	self executeScript: self plpgsqlParserPath withInput: inputTempFile andStoreResultInFile: outputTempFile.
	
	"Get result and parse JSON."
	result := outputTempFile readStreamDo: [ :s | STONJSON fromString: s ].
	
	"Cleaning temporary files."
	inputTempFile
		ensureDelete.
	outputTempFile
		ensureDelete.
	
	^ result