CREATE TABLE users
(
    id BIGSERIAL PRIMARY KEY,
    email VARCHAR(254) NOT NULL,
    registered TIMESTAMP DEFAULT now() NOT NULL,
    last_visited TIMESTAMP DEFAULT now() NOT NULL
);
CREATE UNIQUE INDEX users_id_uindex ON users (id);
CREATE INDEX users_email_index ON users (email);
COMMENT ON COLUMN public.users.email IS 'адрес электронной почты';
COMMENT ON COLUMN public.users.registered IS 'время регистрации';
COMMENT ON COLUMN public.users.last_visited IS 'время последнего входа';

CREATE TABLE public.vacancies
(
    id BIGSERIAL PRIMARY KEY NOT NULL,
    company_name VARCHAR(256) NOT NULL,
    position_name VARCHAR(256) NOT NULL,
    description VARCHAR(1000000) DEFAULT NULL,
    min_salary INT DEFAULT NULL,
    max_salary INT DEFAULT NULL,
    experience INT DEFAULT NULL,
    skills VARCHAR(1000) DEFAULT NULL,
    published TIMESTAMP DEFAULT now() NOT NULL
);
CREATE UNIQUE INDEX vacancies_id_uindex ON public.vacancies (id);
CREATE INDEX vacancies_company_name_index ON public.vacancies (company_name);
CREATE INDEX vacancies_position_name_index ON public.vacancies (position_name);
CREATE INDEX vacancies_min_salary_index ON public.vacancies (min_salary);
CREATE INDEX vacancies_max_salary_index ON public.vacancies (max_salary);
CREATE INDEX vacancies_experience_index ON public.vacancies (experience);
CREATE INDEX vacancies_published_index ON public.vacancies (published);
COMMENT ON COLUMN public.vacancies.company_name IS 'название компании';
COMMENT ON COLUMN public.vacancies.position_name IS 'название должности';
COMMENT ON COLUMN public.vacancies.description IS 'описание вакансии';
COMMENT ON COLUMN public.vacancies.min_salary IS 'минимальная зп';
COMMENT ON COLUMN public.vacancies.max_salary IS 'максимальная зп';
COMMENT ON COLUMN public.vacancies.experience IS 'требуемый опыт работы в месяцах';
COMMENT ON COLUMN public.vacancies.skills IS 'требуемые навыки';
COMMENT ON COLUMN public.vacancies.published IS 'время размещения вакансии';

CREATE TABLE public.resumes
(
    id BIGSERIAL PRIMARY KEY NOT NULL,
    position_name VARCHAR(256) NOT NULL,
    first_last_name VARCHAR(256) NOT NULL,
    age INT NOT NULL,
    min_salary INT DEFAULT NULL,
    max_salary INT DEFAULT NULL,
    experience INT NOT NULL,
    skills VARCHAR(1000) NOT NULL,
    user_id BIGINT NOT NULL,
    CONSTRAINT resumes_users_id_fk FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE UNIQUE INDEX resumes_id_uindex ON public.resumes (id);
CREATE INDEX resumes_position_name_index ON public.resumes (position_name);
CREATE INDEX resumes_first_last_name_index ON public.resumes (first_last_name);
CREATE INDEX resumes_age_index ON public.resumes (age);
CREATE INDEX resumes_min_salary_index ON public.resumes (min_salary);
CREATE INDEX resumes_max_salary_index ON public.resumes (max_salary);
CREATE INDEX resumes_experience_index ON public.resumes (experience);
COMMENT ON COLUMN public.resumes.position_name IS 'название должности';
COMMENT ON COLUMN public.resumes.first_last_name IS 'ФИО';
COMMENT ON COLUMN public.resumes.age IS 'возраст';
COMMENT ON COLUMN public.resumes.min_salary IS 'минимальная зп';
COMMENT ON COLUMN public.resumes.max_salary IS 'максимальная зп';
COMMENT ON COLUMN public.resumes.experience IS 'опыт работы в месяцах';
COMMENT ON COLUMN public.resumes.skills IS 'скилы соискателя';
COMMENT ON COLUMN public.resumes.user_id IS 'ссылка на пользователя';

CREATE TABLE public.responses
(
    id BIGSERIAL PRIMARY KEY NOT NULL,
    resume_id BIGINT NOT NULL,
    vacancy_id BIGINT NOT NULL,
    CONSTRAINT responses_resumes_id_fk FOREIGN KEY (resume_id) REFERENCES resumes (id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT responses_vacancies_id_fk FOREIGN KEY (vacancy_id) REFERENCES vacancies (id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE UNIQUE INDEX responses_id_uindex ON public.responses (id);
CREATE INDEX responses_resume_id_index ON public.responses (resume_id);
CREATE INDEX responses_vacancy_id_index ON public.responses (vacancy_id);
CREATE UNIQUE INDEX responses_resume_id_vacancy_id_index ON public.responses (resume_id, vacancy_id);
COMMENT ON COLUMN public.responses.resume_id IS 'ссылка на резюме';
COMMENT ON COLUMN public.responses.vacancy_id IS 'ссылка на вакансию';
COMMENT ON TABLE public.responses IS 'отклики';

CREATE TABLE public.messages
(
    id BIGSERIAL PRIMARY KEY NOT NULL,
    message VARCHAR(1000) NOT NULL,
    response_id BIGINT NOT NULL,
    CONSTRAINT messages_responses_id_fk FOREIGN KEY (response_id) REFERENCES responses (id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE UNIQUE INDEX messages_id_uindex ON public.messages (id);
COMMENT ON COLUMN public.messages.message IS 'текст сообщения';
COMMENT ON COLUMN public.messages.response_id IS 'ссылка на отклик';
COMMENT ON TABLE public.messages IS 'сообщения';
