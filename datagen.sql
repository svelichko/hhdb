INSERT INTO users (email, registered, last_visited)
SELECT
  concat(left(md5(random()::text), 10), '@', left(md5(random()::text), 5), '.', left(md5(random()::text), 3)) email,
  TIMESTAMP '2008-01-01 00:00:00' + random() * (TIMESTAMP '2013-01-01 00:00:00' - TIMESTAMP '2008-01-01 00:00:00') registered,
  TIMESTAMP '2013-01-01 00:00:00' + random() * (TIMESTAMP '2018-01-01 00:00:00' - TIMESTAMP '2013-01-01 00:00:00') last_visited
  FROM generate_series(1, 2000);

INSERT INTO vacancies (company_name, position_name, description, min_salary, max_salary, experience, skills, published)
SELECT
  md5(random()::text) company_name,
  md5(random()::text) position_name,
  md5(random()::text) description,
  round(100000 - random() * 100000) min_salary,
  round(100000 + random() * 100000) max_salary,
  round(random() * 20) experience,
  md5(random()::text) skills,
  TIMESTAMP '2008-01-01 00:00:00' + random() * (TIMESTAMP '2018-01-01 00:00:00' - TIMESTAMP '2008-01-01 00:00:00') published
  FROM generate_series(1, 1000000);

INSERT INTO resumes (position_name, first_last_name, age, min_salary, max_salary, experience, skills, user_id)
SELECT
  md5(random()::text) position_name,
  concat(left(md5(random()::text), 5), ' ', left(md5(random()::text), 8)) first_last_name,
  10 + round(random() * 70) age,
  round(100000 - random() * 100000) min_salary,
  round(100000 + random() * 100000) max_salary,
  round(random() * 20) experience,
  md5(random()::text) skills,
  1 + round(random() * 1999) user_id
  FROM generate_series(1, 2000000);
  
INSERT INTO responses (resume_id, vacancy_id)
SELECT
  1 + round(random() * 1999999) resume_id,
  1 + round(random() * 999999) vacancy_id
  FROM generate_series(1, 3000000);
  
INSERT INTO messages (message, response_id)
SELECT
  md5(random()::text) message,
  1 + round(random() * 2999999) response_id
  FROM generate_series(1, 5000000);
