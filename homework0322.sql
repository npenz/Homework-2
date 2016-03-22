--homework

SELECT CONCAT (c.first_name,' ', c.last_name) AS "Name",
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
		on ct.coach_id = c.id
INNER JOIN sandbox.school AS s
		on s.school_id = ct.school_id
INNER JOIN reference.state AS st
		on s.state = st.state_abbreviation
INNER JOIN sandbox.position AS pt
		on pt.id = ct.position_id AND pt.id = 1
LEFT OUTER JOIN sandbox.coach_record AS rd
		on c.id = rd.coach_id 
WHERE c.sport_id = 3
GROUP BY c.last_name, c.first_name, s.school_name, s.school_id, st.state_name, ct.id, ct.school_pay, ct.other_pay, ct.total_pay
HAVING COUNT (ct.id) >= 3
ORDER BY c.last_name, c.first_name;
