note
	description: "Summary description for {TEST_ARRAYED_CONTAINER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TEST_ARRAYED_CONTAINER

inherit
	ES_TEST

create
	make

feature -- Adding tests
	make
		do
			add_boolean_case(agent test_arrayed_container_insert_last)
			add_boolean_case(agent test_arrayed_container_remove_first)
			add_boolean_case(agent test_arrayed_container_remove_at)
			add_boolean_case(agent test_arrayed_container_insert_at)
			add_boolean_case(agent test_arrayed_container_size)
			add_boolean_case(agent test_arrayed_container_assign_at)
			add_boolean_case(agent test_arrayed_container_delete_at_feature)
			--
			--
			--

		end

feature

	test_arrayed_container_insert_last: BOOLEAN
	local
		imp: ARRAYED_CONTAINER
	do
		comment("Testing for insert last")
		create {ARRAYED_CONTAINER} imp.make
		imp.insert_last ("Hello")
		imp.insert_last ("Alan")
		imp.insert_last ("Bob")
		Result:=
			imp.get_at (3) ~ "Bob"
		check Result end
	end

	test_arrayed_container_remove_first: BOOLEAN
	local
		imp: ARRAYED_CONTAINER
	do
		comment("Testing for remove_first features")
		create {ARRAYED_CONTAINER} imp.make
		imp.insert_last ("a")
		imp.insert_last ("b")
		imp.insert_last ("c")
		imp.remove_first
		Result:=
			imp.get_at (1) ~ "b"
		check Result end
	end

	test_arrayed_container_remove_at:BOOLEAN
	local
		imp: ARRAYED_CONTAINER
	do
		comment("Testing for remove_at features")
		create {ARRAYED_CONTAINER} imp.make
		imp.insert_last ("a")
		imp.insert_last ("b")
		imp.insert_last ("c")
		imp.delete_at (2)
		Result:=
			imp.get_at (2) ~ "c"
		check Result end
	end

	test_arrayed_container_insert_at: BOOLEAN
	local
		imp: ARRAYED_CONTAINER
		do
			comment("testing ARRAYED_CONTAINER insert_at and get_at features")
			create {ARRAYED_CONTAINER} imp.make
			imp.insert_last ("a")
			imp.insert_last ("b")
			imp.insert_last ("c")
			imp.insert_last ("d")
			imp.insert_last ("e")
			imp.insert_at (2, "hi")
		--	print(imp.get_at (1))
			--imp.insert_at(1,"a")
			--imp.insert_at(2,"b")
			print(imp.count)
			Result:=
				imp.get_at (2) ~ "hi" and
				imp.get_at (3) ~ "b"
			check Result end
		end
	test_arrayed_container_size: BOOLEAN
	local
		imp: ARRAYED_CONTAINER
		counter: INTEGER
	do
		comment("Testing for the size of the array")
		create {ARRAYED_CONTAINER} imp.make
		imp.insert_last ("hi")
		counter:= counter + 1
		imp.insert_at (1,"Alan")
		counter:= counter + 1
		imp.insert_at (2,"Bob")
		counter:= counter + 1
		Result:= imp.count = 3
		check Result end
	end
	test_arrayed_container_assign_at: BOOLEAN
	local
		imp: ARRAYED_CONTAINER
	do
		comment("Testing for assign_at feature")
		create {ARRAYED_CONTAINER} imp.make
		imp.insert_last ("what")
		imp.insert_at (1,"Alan")
		imp.insert_at (2,"Bob")
		imp.assign_at (1,"Hello")
		Result:=
			imp.get_at (1) ~ "Hello"
		check Result end
	end

	test_arrayed_container_delete_at_feature: BOOLEAN
	local
		imp: ARRAYED_CONTAINER
	do
		comment("Testing for delete at")
		create{ARRAYED_CONTAINER} imp.make
		imp.insert_last ("hi")
		imp.insert_at (1,"Alan")
		imp.insert_at (2,"Bob")
		imp.insert_at (3,"Cat")
		imp.delete_at (1)
		Result:=
			imp.get_at (1) ~ "Bob"
		check Result end
	end

end
