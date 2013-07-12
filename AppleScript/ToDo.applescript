(* Create a ToDo list note in Evernote.
Uses ISO format '%F' for the date used in the title of the note
Author: Nigel Houghton <nigel@sourcefire.com>
Date: 2013-04-19
*)

set dateToday to current date
set myDate to date_to_iso(dateToday)
on date_to_iso(dateToday)
  set {year:y, month:m, day:d} to dateToday
  set y to text 2 through -1 of ((y + 10000) as text)
  set m to text 2 through -1 of ((m + 100) as text)
  set d to text 2 through -1 of ((d + 100) as text)
  return y & "-" & m & "-" & d
end date_to_iso

set theNoteName to "ToDo List"
set theNoteContent to "<en-todo/>&nbsp;Item 1 in the list<br/>\n"

tell application "Evernote"
  activate
  set theNote to create note notebook "Inbox" title theNoteName & " - " & myDate tags "ToDo" with enml theNoteContent
  open note window with theNote
end tell
