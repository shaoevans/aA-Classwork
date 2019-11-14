PRAGMA foreign_keys = ON;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body VARCHAR(255),
  author_id INTEGER NOT NULL,

  FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)

);
CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  reply_to_id INTEGER NOT NULL,
  reply_user_id INTEGER NOT NULL,
  body VARCHAR(255),

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (reply_user_id) REFERENCES replies(id),
  FOREIGN KEY (reply_to_id) REFERENCES replies(id)  
);

CREATE TABLE question_likes(
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO 
  users (fname, lname)
VALUES
  ('Evans', 'Shao'),
  ('Sami', 'Ellaboudy');

INSERT INTO
  questions (title, body, author_id)
VALUES 
  ('VARCHAR?', 'What is VARCHAR', (SELECT id FROM users WHERE fname = 'Evans')),
  ('Life', 'what is meaning of life', (SELECT id FROM users WHERE lname = 'Ellaboudy')),
  ('What?', 'What?', (SELECT id FROM users WHERE fname = 'Evans')),
  ('is?', 'is?', (SELECT id FROM users WHERE fname = 'Evans')),
  ('your?', 'your?', (SELECT id FROM users WHERE fname = 'Evans')),
  ('name?', 'name?', (SELECT id FROM users WHERE fname = 'Evans'));

INSERT INTO
  question_follows (question_id, user_id)
VALUES 
  (1,2),
  (1,1),
  (2,2),
  (2,1),
  (3,1),
  (1,1),
  (2,2),
  (4,1),
  (4,1);


INSERT INTO
  question_likes (question_id, user_id)
VALUES 
  (1,2),
  (1,1),
  (2,2),
  (2,1),
  (3,1),
  (1,1),
  (2,2),
  (4,1),
  (4,1);

