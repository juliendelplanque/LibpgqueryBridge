parsing
parseQuery: aString
	^ self parse: aString usingScript: self postgreSQLParserPath