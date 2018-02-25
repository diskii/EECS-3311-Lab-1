note
	description: "Summary description for {BAD_AC_INSERT_AT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BAD_AC_INSERT_AT

inherit
	ARRAYED_CONTAINER
		redefine
			insert_at
		end
create
	make
feature
	insert_at (i: INTEGER; s: STRING)
	do
		Precursor(i,s)
		--Wrong implementation
		--It should trigger a post condition violation
		if i>1 then

		end
	end
end
