private
uuidTempFileReference
	"Returns a file reference for a temporary file (i.e. stored in #tempDirectory) with a new UUID."
	^ (self tempDirectory / UUID new asString)
			ensureCreateFile;
			yourself