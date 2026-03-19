CREATE TABLE IF NOT EXISTS Department (
	department_id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Employee (
	employee_id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	department_id INT NOT NULL REFERENCES Department(department_id)
);

CREATE TABLE IF NOT EXISTS Head (
	employee_id INTEGER REFERENCES Employee(employee_id),
	department_id INTEGER REFERENCES Department(department_id),
	CONSTRAINT head_id PRIMARY KEY (employee_id, department_id)
);