--homework
SELECT  
		CONCAT (c.first_name,' ', c.last_name) AS "Name1",
        s.school_name AS "School",
		s.school_id AS "ID",
		st.state_name AS "State",
		COUNT(ct.id) AS "Contracts",
		SUM (ct.school_pay) AS "School pay",
		SUM (ct.other_pay) AS "Other pay", 
		SUM (ct.total_pay) AS "Total pay",
		AVG (ct.school_pay) AS "Avg school pay",
		AVG (ct.other_pay) AS "Avg other pay",
		AVG (ct.total_pay) AS "Avg total pay"
FROM sandbox.coach AS c
INNER JOIN sandbox.contract AS ct
		on c.id = ct.coach_id
INNER JOIN sandbox.school AS s
		on s.school_id = ct.school_id
INNER JOIN reference.state AS st
		on s.state = st.state_abbreviation
INNER JOIN sandbox.position AS pt
		on pt.id = ct.position_id AND pt.id = 1
WHERE c.sport_id = 3
GROUP BY c.first_name, c.last_name, s.school_name, s.school_id, st.state_name
HAVING COUNT (ct.id) >= 3
ORDER BY c.last_name, c.first_name;
