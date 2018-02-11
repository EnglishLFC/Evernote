(* Create a note in Evernote to record a Farley file
Author: Nigel Houghton <wutang@warpten.net>
Date: 2013-04-19
*)

set theDate to current date

on date_to_iso(dateToday)
	set {year:y, month:m, day:d} to dateToday
	set y to text 2 through -1 of ((y + 10000) as text)
	set m to text 2 through -1 of ((m + 100) as text)
	set d to text 2 through -1 of ((d + 100) as text)
	return y & "-" & m & "-" & d
end date_to_iso

set theNoteName to "File Notes: "
set theNoteContent to "<div>Name: </div>
<div><br/>Position: </div>
<div><br/>Company: </div>
<div><br/>Phone: </div>
<div><br/>Email: </div>
<div><br/>Date: " & theDate & "</div>
<div><br/>Notes: </div>
<div><br/>Next Action: </div>
"
tell application "Evernote"
	activate
	set theNote to create note notebook "People" title theNoteName tags "People" with enml theNoteContent
	open note window with theNote
end tell
