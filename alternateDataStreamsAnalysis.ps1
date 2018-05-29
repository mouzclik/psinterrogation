# The following lines deal with finding and reading alternate data streams as well as some file analysis

gci -recurse | % { gi $_.FullName -stream * } | where stream -ne ':$Data' -ea SilentlyContinue # Dragons ahead, this line reads the drive recursively..

# Files could be hashed by Get-FileHash -Path c:\somefile -Algorithm MD5

# The stream needs to be extracted..
get-item "path" -stream *
# Then the content of the stream needs to be extracted
get-content "path" -stream "stream extracted in line above"

#The next line determines the magic byte so that the file type can be determined
#Handy-dandy list: https://en.wikipedia.org/wiki/List_of_file_signatures
Get-Content "path" -encoding byte -readcount 16 -totalcount 16 | foreach-object { $output ="" foreach ($byte in $_ ) { $output += "{0:X2}" -f $byte } $output } 