INSERT INTO users (id, email) VALUES (1, 'johndoe@gmail.com');
INSERT INTO users (id, email) VALUES (2, 'foobar@gmail.com');

INSERT INTO resumes (id, position_name, first_last_name, age, min_salary, max_salary, experience, skills, user_id) VALUES
  (1, 'CEO', 'John Doe', 24, 80000, 120000, 5, '* Leadership\n* Win hearts and minds', 1);
INSERT INTO resumes (id, position_name, first_last_name, age, min_salary, max_salary, experience, skills, user_id) VALUES
  (2, 'Junior Frontend Developer', 'John Doe', 24, 50000, 100000, 1, '* JavaScript\n* HTML 5\n* CSS 3', 1);
INSERT INTO resumes (id, position_name, first_last_name, age, min_salary, max_salary, experience, skills, user_id) VALUES
  (3, 'Mobile Developer', 'Foo Bar', 30, 100000, 150000, 7, '* Android\n* iOS\n* Windows Phone', 2);

INSERT INTO vacancies (id, company_name, position_name, description, min_salary, max_salary, experience, skills) VALUES
  (1, 'Microsoft', 'CEO', 'Reports to the board of directors and is charged with maximizing the value of the entity, which may include maximizing the share price, market share, revenues, or another element', 120000, 500000, 3, '* Leadership\n Top management');
INSERT INTO vacancies (id, company_name, position_name, description, min_salary, max_salary, experience, skills) VALUES
  (2, 'Facebook', 'Mobile Developer', 'must consider a long array of screen sizes, hardware specifications, and configurations because of intense competition in mobile software and changes within each of the platforms', 100000, 200000, 5, '* iOS\n* Android');

INSERT INTO responses (id, resume_id, vacancy_id) VALUES (1, 1, 1);
INSERT INTO responses (id, resume_id, vacancy_id) VALUES (2, 3, 2);

INSERT INTO messages (message, response_id) VALUES
  ('You are invited for an interview. Please choose a convenient date.', 1);
INSERT INTO  messages (message, response_id) VALUES
  ('Your application was denied.', 2);
