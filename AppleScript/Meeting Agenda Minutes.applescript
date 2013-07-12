(* Create a note in Evernote to record Meeting Notes
Date is in ISO format '%F'
Author: Nigel Houghton <nhoughton@sourcefire.com>
Date: 2013-07-10
*)

set theDate to current date
set leaderDate to date_to_iso(theDate)

on date_to_iso(dateToday)
  set {year:y, month:m, day:d} to dateToday
  set y to text 2 through -1 of ((y + 10000) as text)
  set m to text 2 through -1 of ((m + 100) as text)
  set d to text 2 through -1 of ((d + 100) as text)
  return y & "-" & m & "-" & d
end date_to_iso

set theNoteName to "Meeting Notes:"
set theNoteContent to "<div><b>Date:</b>&nbsp;" & leaderDate & "</div><br/>\n" & "<div><b>Location Details:</b><br/><br/></div>\n" & "<div><b>Attendees:</b><br/><ul><li><br/></li></ul></div>\n<div><b>Meeting Purpose:</b><br/><br/></div>\n<div><b>Agenda:</b><br/></div>\n<div><ol><li><b><br/></b></li></ol></div>\n<div><b>Minutes:</b><br/><br/></div>\n<div><b>Action Items:</b><br/><br/><en-todo/>Item 1 - Responsible Party<br/></div>\n"
tell application "Evernote"
  activate
  set theNote to create note notebook "Work Meetings" title theNoteName & " - " & leaderDate tags "Meeting" with enml theNoteContent
  open note window with theNote
end tell
