parsing
parse: aString usingScript: aFileReference
	| inputTempFile outputTempFile result |
	inputTempFile := self uuidTempFileReference.
	inputTempFile writeStreamDo: [ :s | s << aString ].
	outputTempFile := self uuidTempFileReference.
	[
		self executeScript: aFileReference withInput: inputTempFile andStoreResultInFile: outputTempFile.
	
		"Get result and parse JSON."
		[
			result := outputTempFile readStreamDo: [ :s | STONJSON fromString: s ].
		] on: Error do: [ self error: outputTempFile contents ].
	] ensure: [ 
	"Cleaning temporary files."
		inputTempFile
			ensureDelete.
		outputTempFile
			ensureDelete.
	].
	^ result