# Postgres syntax

Creation of PG Accounts:  
CREATE USER myuser WITH PASSWORD 'mypassword';
GRANT CONNECT ON DATABASE mydb TO myuser;
GRANT USAGE ON SCHEMA public TO myuser;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO myuser;

Creation of Tables
CREATE TABLE IF NOT EXISTS TableName (
    RecordID SERIAL PRIMARY KEY, # Set to serial means auto-sequencing
	FieldNameA INT NOT NULL,
	FieldNameB VARCHAR(15) NOT NULL,
	FieldNameC DATE NOT NULL
) #Note that Date format is YYYY-MM-DD

Describe Table Structure
SELECT column_name, data_type, is_nullable
FROM information_schema.columns
WHERE table_name='coh';

Select Data from Table
SELECT * FROM coh;
SELECT branch, cash FROM coh WHERE cash > 1000 ORDER BY cash DESC;

Insert data into a table
INSERT INTO coh (branch, days, cash)
VALUES ('NY', '2025-03-01', 1250.50);

Update Existing Rows
UPDATE coh
SET cash = cash + 100
WHERE branch = 'NY';

Delete rows
DELETE FROM coh
WHERE branch = 'LA';

Create a new table
CREATE TABLE dogs (
    dog_id SERIAL PRIMARY KEY,
    dog_name VARCHAR(30) NOT NULL,
    dog_age INT NOT NULL
);

Alter table / column
-- Change column type
ALTER TABLE coh
ALTER COLUMN cash TYPE NUMERIC(12,2)
USING cash::numeric;

-- Add a new column
ALTER TABLE coh
ADD COLUMN notes TEXT;

Count Rows
SELECT COUNT(*) FROM coh;

Aggregate Example
SELECT branch, SUM(cash) AS total_cash
FROM coh
GROUP BY branch
ORDER BY total_cash DESC;

Reset a Serial Sequence after manual inserts:
SELECT setval('coh_id_seq', (SELECT MAX(id) FROM coh));






