(* Create a Packing List in Evernote
Date in '%F'
Author: Nigel Houghton <wutang@warpten.net>
Date: 2014-08-02
*)

set theDate to current date
set isoDate to date_to_iso(theDate)

on date_to_iso(dateToday)
	set {year:y, month:m, day:d} to dateToday
	set y to text 2 through -1 of ((y + 10000) as text)
	set m to text 2 through -1 of ((m + 100) as text)
	set d to text 2 through -1 of ((d + 100) as text)
	return y & "-" & m & "-" & d
end date_to_iso

set returnedItems to (display dialog "Enter Trip Destination" default answer "Example" buttons {"Quit", "OK"} default button 2)
set theAnswer to the text returned of returnedItems
set buttonName to the button returned of returnedItems

set theNoteName to theAnswer & " Packing list: "
set theNoteContent to "<div><strong>Laptop Bag:</strong></div>
 <div><en-todo/>Laptop</div>
 <div><en-todo/>Headphones<br/></div>
 <div><en-todo/>Pen<br/></div>
 <div><en-todo/>Business cards<br/></div>
 <div><en-todo/>Reading glasses</div>
 <div><en-todo/>Mini DisplayPort to VGA</div>
 <div><en-todo/>Mini DisplayPort to HDMI</div>
 <div><en-todo/>Mini DisplayPort to DVI</div>
 <div><en-todo/>USB flash drives</div>
 <div><en-todo/>iPad/iPhone Lightning to USB cables</div>
 <div><en-todo/>USB to AC power adaptor</div>
 <div><en-todo/>Car adaptor</div>
 <div>
 <hr/>
 <strong>Suitcase:</strong><br/></div>
 <div><en-todo/>Underwear</div>
 <div><en-todo/>T-shirts</div>
 <div><en-todo/>Socks</div>
 <div><en-todo/>Belt</div>
 <div><en-todo/>Sports Jacket<br/></div>
 <div><en-todo/>Slacks</div>
 <div><en-todo/>Jeans</div>
 <div><en-todo/>Power Adapter<br/></div>
 <div>
 <hr/>
 <em><strong>Shaving Kit</strong></em><br/></div>
 <div>
 <div><en-todo/>Ear plugs</div>
 <div><en-todo/>Eye Mask</div>
 <div><en-todo/>Alka-seltzer</div>
 <div><en-todo/>Aleve</div>
 <div><en-todo/>Listerine<br/></div>
 <div><en-todo/>Cotton buds</div>
 <div><en-todo/>Baby powder</div>
 </div>
 <div><en-todo/>Cologne</div>
 <div><en-todo/>Shaving cream</div>
 <div><en-todo/>Razor</div>
 <div><en-todo/>Tooth brush<br/></div>
 <div><en-todo/>Tooth paste</div>
 <div><en-todo/>Fingernail clips<br/></div>
 <div><en-todo/>Deodorant</div>
 <div><en-todo/>Q-tips<br/></div>
 <div><en-todo/>Collar stays</div>
 <div><p><strong>Transportation Information:</strong></p></div>
 <div><p>Flight Details</p></div>
 <div>
  <table border=\"1\" cellpadding=\"5\" cellspacing=\"5\" style=\"border-collapse:collapse;border-style:solid;border-color:#A3A3A3;border-width:1pt\">
   <tr>
     <td colspan=\"2\"><strong>Outbound</strong></td>
   </tr>
     <tr bgcolor=\"F0F0F0\">
	   <td>Airline:</td>
	   <td>&nbsp;</td>
	 </tr>
	 <tr>
	   <td>Flight Number:</td>
	   <td>&nbsp;</td>
	 </tr>
	 <tr bgcolor=\"F0F0F0\">
	   <td>Confirmation Number:</td>
	   <td>&nbsp;</td>
	 </tr>
   <tr>
     <td colspan=\"2\"><strong>Inbound</strong></td>
   </tr>
     <tr bgcolor=\"F0F0F0\">
	   <td>Airline:</td>
	   <td>&nbsp;</td>
	 </tr>
	 <tr>
	   <td>Flight Number:</td>
	   <td>&nbsp;</td>
	 </tr>
	 <tr bgcolor=\"F0F0F0\">
	   <td>Confirmation Number:</td>
	   <td>&nbsp;</td>
	 </tr>
   </table>
 </div>
 <div><p>Car Rental</p></div>
 <div>
  <table border=\"1\" cellpadding=\"5\" cellspacing=\"5\" style=\"border-collapse:collapse;border-style:solid;border-color:#A3A3A3;border-width:1pt\">
     <tr bgcolor=\"F0F0F0\">
	   <td>Company:</td>
	   <td>&nbsp;</td>
	 </tr>
	 <tr>
	   <td>Vehicle Type:</td>
	   <td>&nbsp;</td>
	 </tr>
	 <tr bgcolor=\"F0F0F0\">
	   <td>Confirmation Number:</td>
	   <td>&nbsp;</td>
	 </tr>
   </table>
 </div>
 <div><p>Hotel Information</p></div>
 <div>
  <table border=\"1\" cellpadding=\"5\" cellspacing=\"5\" style=\"border-collapse:collapse;border-style:solid;border-color:#A3A3A3;border-width:1pt\">
     <tr bgcolor=\"F0F0F0\">
	   <td>Hotel:</td>
	   <td>&nbsp;</td>
	 </tr>
	 <tr>
	   <td>Address:</td>
	   <td>&nbsp;</td>
	 </tr>
	 <tr bgcolor=\"F0F0F0\">
	   <td>Confirmation Number:</td>
	   <td>&nbsp;</td>
	 </tr>
   </table>
 </div>
"

tell application "Evernote"
	activate
	set theNote to create note notebook "Travel" title theNoteName & " - " & isoDate tags "Travel" with enml theNoteContent
	open note window with theNote
end tell
