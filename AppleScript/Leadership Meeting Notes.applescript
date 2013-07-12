(* Create a note in Evernote to record Leadership Meeting Notes
happens bi-weekly on a Friday so it figures out if the day is a Friday or not.
If not, counts up to the next Friday and uses that date in the title.
Date is in ISO format '%F'
Author: Nigel Houghton <nhoughton@sourcefire.com>
Date: 2013-04-19
*)

set theDate to current date
set theDay to weekday of theDate

if theDay = Friday then
  set dateToday to theDate
else
  repeat until theDay = Friday
    set theDate to theDate + 1 * days
    set theDay to weekday of theDate
  end repeat
  set dateToday to theDate
end if

set leaderDate to date_to_iso(dateToday)

on date_to_iso(dateToday)
  set {year:y, month:m, day:d} to dateToday
  set y to text 2 through -1 of ((y + 10000) as text)
  set m to text 2 through -1 of ((m + 100) as text)
  set d to text 2 through -1 of ((d + 100) as text)
  return y & "-" & m & "-" & d
end date_to_iso

set theNoteName to "Leadership Meeting Notes:"
set theNoteContent to "<div>Priorities:</div>\n<div>\n<ul>\n<li><br/></li>\n</ul>\n</div>\n<div><br/></div>\n<div>Issues and Challenges:</div>\n<div>\n<ul>\n<li><br/></li>\n</ul>\n</div>"
tell application "Evernote"
  activate
  set theNote to create note notebook "Work Leadership" title theNoteName & " - " & leaderDate tags "Leadership Meeting" with enml theNoteContent
  open note window with theNote
end tell

