property dbPath : ""
property two32 : 2 ^ 32
property targetBaseFolder : ""

set dbPath to getLibraryPath() & "/iPhotoMain.db"
set allEvents to parseEvents(get every paragraph in queryDB("SELECT e.primaryKey, e.name FROM SqEvent e JOIN SqPhotoInfo i ON i.event = e.primaryKey GROUP BY e.primaryKey"))

-- create a base directory for exported album
set targetBaseFolder to getTargetExportFolder()
return targetBaseFolder
repeat with theEvent in allEvents
	-- create the event folder
	set targetSaveFolder to createTargetEventFolder(theEvent)
	
	set i to 0
	repeat with ph in getPhotosFromEvent(theEvent)
		-- calculate a new name for exported photo file
		set i to i + 1
		set targetPhotoFileName to i as text
		repeat 5 - (length of targetPhotoFileName) times
			set targetPhotoFileName to "0" & targetPhotoFileName
		end repeat
		tell application id "com.apple.iphoto"
			set sourceFile to POSIX file (image path of ph) as text
			set sourceFileInfo to info for file sourceFile
			set sourceFileName to name of sourceFileInfo as text
		end tell
		
		-- create a copy of the photo
		tell application "Finder"
			duplicate {file sourceFile} to targetSaveFolder
			set newFile to file sourceFileName of targetSaveFolder
			set name of newFile to targetPhotoFileName & "." & name extension of sourceFileInfo
		end tell
	end repeat
end repeat

--
-------------------------------------------------------------------
--

on createTargetEventFolder(theEvent)
	tell application "Finder"
		set eventName to name of theEvent
		if eventName = "" then
			set eventName to "unnamed event"
		end if
		set i to -1
		repeat
			set i to i + 1
			if i > 0 then
				set folderName to eventName & " " & i
			else
				set folderName to eventName
			end if
			if folder folderName of targetBaseFolder exists then
				exit repeat
			end if
		end repeat
		make new folder at targetBaseFolder with properties {name:folderName}
		return folder eventName of targetBaseFolder
	end tell
end createTargetEventFolder

on getPhotosFromEvent(theEvent)
	set idList to every paragraph in queryDB("SELECT primaryKey FROM SqPhotoInfo WHERE event = " & event_id of theEvent & " ORDER BY photoDate")
	set photoList to {}
	
	tell application id "com.apple.iphoto"
		repeat with currentID in idList
			set end of photoList to photo id (currentID + two32)
		end repeat
	end tell
	return photoList
end getPhotosFromEvent

on getTargetExportFolder()
	set base_name to "iPhoto export"
	set folder_name to base_name
	set i to 0
	repeat
		tell application "Finder"
			if not (folder folder_name in folder "Downloads" of home exists) then
				exit repeat
			end if
			set folder_name to base_name & " " & i
			set i to i + 1
		end tell
	end repeat
	tell application "Finder"
		make new folder at folder "Downloads" of home with properties {name:folder_name}
		return folder folder_name of folder "Downloads" of home
	end tell
end getTargetExportFolder

on queryDB(sqlQuery)
	return do shell script "sqlite3 '" & dbPath & "' '" & sqlQuery & "'"
end queryDB

on getLibraryPath()
	tell application "iPhoto"
		set allPhotos to photos of the photo library album
		if (count of allPhotos) > 0 then
			set photoPath to the original path of the first item of allPhotos
			set savedDelimiters to AppleScript's text item delimiters
			set AppleScript's text item delimiters to {"/"}
			set iPhotoPath to (items 1 through -5 of the text items of photoPath) as text
			set AppleScript's text item delimiters to savedDelimiters
		else
			set iPhotoPath to "~/Pictures/iPhoto Library"
		end if
	end tell
	return iPhotoPath
end getLibraryPath

on splitStringIntoLines(str)
	set savedDelimiters to AppleScript's text item delimiters
	set AppleScript's text item delimiters to {"\n"}
	set res to text items of str
	set AppleScript's text item delimiters to savedDelimiters
	return res
end splitStringIntoLines


on parseEvents(eventLines)
	set savedDelimiters to AppleScript's text item delimiters
	set AppleScript's text item delimiters to {"|"}
	set res to {}
	repeat with s in eventLines
		set parts to text items of s
		set event_id to item 1 of parts as number
		set event_name to (rest of items of parts) as text
		set rec to {event_id:event_id, name:event_name}
		copy rec to the end of res
	end repeat
	set AppleScript's text item delimiters to savedDelimiters
	return res
end parseEvents

