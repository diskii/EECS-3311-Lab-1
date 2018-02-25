note
	description: "container application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	TEST_CONTAINERS

inherit
	ES_SUITE

create
	make

feature -- Adding test classes.

	make
			-- Run application.
		local
			ac: ARRAYED_CONTAINER
		do
			add_test (create {TEST_ARRAY_COPIES}.make)
			add_test (create {TEST_ARRAYED_CONTAINER}.make)
			add_test (create {TEST_BAD_AC}.make)
			show_browser
			run_espec
		end

end
