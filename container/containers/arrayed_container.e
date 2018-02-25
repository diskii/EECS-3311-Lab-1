note
	description: "A linear container implemented via an array."
	author: "Jackie and You"
	date: "$Date$"
	revision: "$Revision$"

class
	ARRAYED_CONTAINER

create
	make

feature {NONE} -- Implementation of container via an array

	imp : ARRAY[STRING]

feature -- Constructors

	make
			-- Initialize an empty container.
		do
			-- This implementation is correct, just given to you.
			create {ARRAY[STRING]} imp.make_empty
			count := 0
		ensure
			empty_container: count = 0 -- Your task
		end


feature -- Commands

	assign_at (i: INTEGER; s: STRING)
			-- Change the value at position 'i' to 's'.
		require
			valid_index: valid_index(i) -- Your task
		do
			imp [i] := s
			-- Uncomment this to produce a wrong implementation
			if i > 1 then
				imp [1] := s
		end
		ensure
			size_unchanged: imp.count = (old imp.twin).count
			item_assigned: imp [i] ~ s
			others_unchanged:
				across
					1 |..| imp.count as j
				all
					j.item /= i implies imp [j.item] ~ (old imp.twin) [j.item]
				end
		end

	insert_at (i: INTEGER; s: STRING)
			-- Insert value 's' into index 'i'.
	require
		valid_index: valid_index(i)
	local
		n: INTEGER
		do
			-- Your task
			--First part of the array
			imp.force (s, count + 1)
			from
				n:= count
			until
				n <= i --count > i
			loop
				imp[n] := imp[n-1]
				n:= n-1
			end
				imp[i] := s
				count:= count +1

		ensure
			size_changed: imp.count /= (old imp.twin).count
			inserted_at_i: imp[i] ~ s -- Your task
			left_half_the_same:   -- Your task
				across
					1 |..| i as j
				all
					j.item < i implies imp [j.item] ~ (old imp.twin) [j.item]
				end
			right_half_the_same: -- Your task
				across
					i |..| imp.count as j
				all
					(j.item) < i implies imp [j.item+1] ~ (old imp.twin) [j.item]
				end
		end

	delete_at (i: INTEGER)
		require
			valid_index: valid_index(i) -- Your task
		local
			n: INTEGER
			-- Delete element stored at index 'i'.
		do
			from
				n:= i
			until
				n >= count
			loop
				imp[n] := imp[n+1]
				n := n+1
			end
			imp.remove_tail (1)
			count := count - 1

		ensure
			size_changed: imp.count /= (old imp.twin).count -- Your task
			left_half_the_same:   -- Your task
				across
					1 |..| i as j
				all
					j.item < i implies imp [j.item] ~ (old imp.twin) [j.item]
				end
			right_half_the_same: -- Your task
				across
					i |..| imp.count as j
				all
					(j.item) < i implies imp [j.item+1] ~ (old imp.twin) [j.item]
				end
		end

	insert_last (s: STRING)
			-- Insert 's' as the last element of the container.
		do

			--imp.put (s, imp.count)

			imp.force(s,(imp.upper+1))
			count := count + 1

		ensure
			size_changed: imp.count /= (old imp.twin).count -- Your task
			last_inserted: imp[count] = s -- Your task
			others_unchanged:
				across
					1 |..| imp.count as j
				all
					j.item /= imp.count implies imp [j.item] ~ (old imp.twin) [j.item]
				end -- Your task
		end

	remove_first
			-- Remove first element from the container.
		require
			not_empty: count >= 1 -- Your task
		local
			n: INTEGER
		do
			-- Your task
			from
				n:= 1
			until
				n >= count -- n < count
			loop
				imp[n] := imp[n+1]
				n:= n + 1
			end
			imp.remove_tail (1)
			count:= count -1
		ensure
			size_changed: imp.count /= (old imp.twin).count -- Your task
			others_unchanged:
				across
					1 |..| imp.count as j
				all
					j.item >= imp.lower implies imp [j.item] ~ (old imp.twin) [j.item+1]
				end
		end

feature -- Queries

	count: INTEGER -- Your task
	  -- Number of items currently stored in the container.
      -- It is up to you to either implement 'count' as an attribute,
      -- or to implement 'count' as a query (uniform access principle).

	valid_index (i: INTEGER): BOOLEAN
			-- Is 'i' a valid index of current container?
		do
			--imp.valid_index (i)
			Result:= count >= i and i >= 1
			--Result:= True
		ensure
			size_unchanged: imp.count = (old imp.twin).count -- Your task
			result_correct: (imp.lower <= i) and then (i<=imp.upper)  -- Your task
			no_elements_changed:
				across
					1 |..| imp.count as j
				all
					imp [j.item] ~ (old imp.twin) [j.item]
				end-- Your task
		end

	get_at (i: INTEGER): STRING
			-- Return the element stored at index 'i'.
			-- you need to make sure that the value is not larger than max size of array
		require
			valid_index: valid_index(i)  -- Your task
			--i <= 10 AND i >= 1
		do
			-- Your task
			Result := imp.entry (i)

		ensure
			size_unchanged: imp.count = (old imp.twin).count -- Your task
			result_correct: (imp.lower <= i) and then (i<=imp.upper)-- Your task
			no_elements_changed: 				across
					1 |..| imp.count as j
				all
					imp [j.item] ~ (old imp.twin) [j.item]
				end-- Your task
		end

invariant
	-- Size of container and size of implementation array always match.
	consistency: imp.count = count
end
