/*
--Whole numbers
integer int +/-2billion 4 bytes
smallint +/- 32,000 22 bytes
bigint 8 bytes

-- Decimals:
numeric(precision, scale)
decimal

numeric(12,4) +/- 99,999,999.999

real
float


select 1.9 = 1.9;
select 1.9 = cast(1.9 as real);

select cast(1.9 as real);

money
smallmoney

--IDENITY
serial
big serial

-- Text
character char
character varying (50)

char(5)
'VA'

boolean char(1)

--Dates and Times
timestamp 4 bytes

-- Geometric types (beyond lat long)
-- Ranges (numbers, dates, times)
-- XML
-- JSON
-- Arrays [1, 2, 3, 4, 5]
*/
