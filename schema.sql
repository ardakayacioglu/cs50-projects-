CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    username TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL
);
CREATE TABLE schools (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    school_type TEXT NOT NULL,
    location TEXT NOT NULL,
    founded_year INTEGER NOT NULL
);
CREATE TABLE companies (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    industry TEXT NOT NULL,
    location TEXT NOT NULL
);
CREATE TABLE connections (
    user1_id INTEGER,
    user2_id INTEGER,
    FOREIGN KEY (user1_id) REFERENCES users(id),
    FOREIGN KEY (user2_id) REFERENCES users(id),
    PRIMARY KEY (user1_id, user2_id)
);
CREATE TABLE school_affiliations (
    user_id INTEGER,
    school_id INTEGER,
    start_date TEXT,
    end_date TEXT,
    degree TEXT,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (school_id) REFERENCES schools(id),
    PRIMARY KEY (user_id, school_id)
);
CREATE TABLE company_affiliations (
    user_id INTEGER,
    company_id INTEGER,
    start_date TEXT,
    end_date TEXT,
    title TEXT,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (company_id) REFERENCES companies(id),
    PRIMARY KEY (user_id, company_id)
);

