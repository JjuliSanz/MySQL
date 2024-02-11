INSERT INTO users (name, email, password) VALUES (
  "Antonio", 
  "antonio@gmail.com", 
  "1234"
);

INSERT INTO tasks (user_id, title, description, completed, due_date) VALUES (
  1, 
  "Aprender Frontend", 
  "Aprender Vue.js en Mastermind", 
  false, 
  "2025-08-01"
);

INSERT INTO users (name, email, password) VALUES (
  "Nate", 
  "nate@gmail.com", 
  "123"
);

INSERT INTO tasks (user_id, title, description, completed, due_date) VALUES 
  (
    2, 
    "Aprender Frontend", 
    "Aprender Framer Motion para mejorar la experiencia ui", 
    false, 
    "2024-03-01"
  ),
  (
    2, 
    "Aprender Frontend", 
    "Aprender Tailwind para mejorar la experiencia ui", 
    false, 
    "2024-03-10"
  );