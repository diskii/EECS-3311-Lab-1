note
	description: "Summary description for {BAD_AC_INSERT_LAST}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BAD_AC_INSERT_LAST
inherit
	ARRAYED_CONTAINER
		redefine
			insert_last
		end
create
	make
feature -- Create a bad version of insert_at
	insert_last (s:STRING)
		do
			Precursor(s)
			--WRONG IMPLEMENTATION
			--SHOULD TRIGGER A POST CONDITION
			imp.force(s,(imp.upper))
			count := count + 1
		end


end
