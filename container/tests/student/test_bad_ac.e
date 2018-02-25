note
	description: "Summary description for {TEST_BAD_AC}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TEST_BAD_AC
inherit
	ES_TEST
create
	make
feature
	make
		do
			add_violation_case_with_tag ("others_unchanged", agent test_bad_ac_assign_at)
			--add_violation_case_with_tag ("size_unchanged",agent test_bad_ac_assign_at_another)
		end

feature -- Test postcondition failures
	test_bad_ac_assign_at
		local
			ac: BAD_AC_ASSIGN_AT
		do
			comment ("test: should trigger a postcondtion violation")
			create {BAD_AC_ASSIGN_AT} ac.make
			ac.insert_last ("A")
			ac.insert_last ("B")
			ac.assign_at (2, "C")
		end
	test_bad_ac_assign_at_another
		local
			ac: BAD_AC_ASSIGN_AT
		do
			comment ("test: should trigger a postconditon violation")
			create {BAD_AC_ASSIGN_AT} ac.make
			ac.insert_last ("A")
			ac.insert_last ("B")
		    ac.assign_at (2, "C")


		end
end
