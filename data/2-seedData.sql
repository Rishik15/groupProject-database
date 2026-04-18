SET FOREIGN_KEY_CHECKS = 0;
-- user 1 is reserved as the system account
-- real users start at ID 2
-- coaches: Sam(3), Taylor(5) | admin: Jordan(4)

INSERT INTO users_immutables (dob, first_name, last_name, email, phone_number) VALUES
  (NULL,         'System',  'Betafit', 'system@betafit.internal', NULL),   -- 1  system
  ('2000-01-01', 'Alex',   'Taylor',  'alex@example.com',         '555-1000'),  -- 2
  ('1998-06-15', 'Sam',    'Nguyen',  'sam@example.com',          '555-2000'),  -- 3
  ('1995-11-20', 'Jordan', 'Patel',   'jordan@example.com',       '555-3000'),  -- 4
  ('1997-02-11', 'Taylor', 'Brooks',  'taylor@example.com',       '555-4000'),  -- 5
  ('1994-09-23', 'Morgan', 'Lee',     'morgan@example.com',       '555-5000'),  -- 6
  ('2001-07-04', 'Riley',  'Chen',    'riley@example.com',        '555-6000'),  -- 7
  ('1999-12-18', 'Casey',  'Diaz',    'casey@example.com',        '555-7000'),  -- 8
  ('1996-03-22', 'Drew',   'Okafor',  'drew@example.com',         '555-8000'),  -- 9
  ('2002-08-09', 'Quinn',  'Martins', 'quinn@example.com',        '555-9000'),  -- 10
  ('1993-05-30', 'Avery',  'Hobbs',   'avery@example.com',        '555-0100');  -- 11

-- system user has no mutable profile
INSERT INTO user_mutables (user_id, profile_picture, weight, height, goal_weight) VALUES
  (2,  'https://cdn.example.com/pfp/alex.png', 180, 70, 170),
  (3,  'https://cdn.example.com/pfp/sam.png',  150, 66, 145),
  (4,  NULL, 210, 72, 190),
  (5,  NULL, 165, 68, 155),
  (6,  NULL, 140, 64, 135),
  (7,  NULL, 190, 71, 180),
  (8,  NULL, 155, 67, 150),
  (9,  NULL, 200, 73, 185),
  (10, NULL, 130, 63, 125),
  (11, NULL, 175, 69, 165);

INSERT INTO user_creds (user_id, username, password_hash, email) VALUES
  (1,  'system',   'n/a',         'system@betafit.internal'),
  (2,  'alex_t',   '$2b$12$7RLskAPYg.QqaTnf4lHGXO1MvsXs.BINL5QhChxfUfDfPyKcAW4L2', 'alex@example.com'),
  (3,  'sam_n',    '$2b$12$7RLskAPYg.QqaTnf4lHGXO1MvsXs.BINL5QhChxfUfDfPyKcAW4L2', 'sam@example.com'),
  (4,  'jordan_p', '$2b$12$7RLskAPYg.QqaTnf4lHGXO1MvsXs.BINL5QhChxfUfDfPyKcAW4L2', 'jordan@example.com'),
  (5,  'taylor_b', '$2b$12$7RLskAPYg.QqaTnf4lHGXO1MvsXs.BINL5QhChxfUfDfPyKcAW4L2',     'taylor@example.com'),
  (6,  'morgan_l', '$2b$12$7RLskAPYg.QqaTnf4lHGXO1MvsXs.BINL5QhChxfUfDfPyKcAW4L2',     'morgan@example.com'),
  (7,  'riley_c',  '$2b$12$7RLskAPYg.QqaTnf4lHGXO1MvsXs.BINL5QhChxfUfDfPyKcAW4L2',     'riley@example.com'),
  (8,  'casey_d',  '$2b$12$7RLskAPYg.QqaTnf4lHGXO1MvsXs.BINL5QhChxfUfDfPyKcAW4L2',     'casey@example.com'),
  (9,  'drew_o',   '$2b$12$7RLskAPYg.QqaTnf4lHGXO1MvsXs.BINL5QhChxfUfDfPyKcAW4L2',     'drew@example.com'),
  (10, 'quinn_m',  '$2b$12$7RLskAPYg.QqaTnf4lHGXO1MvsXs.BINL5QhChxfUfDfPyKcAW4L2',     'quinn@example.com'),
  (11, 'avery_h',  '$2b$12$7RLskAPYg.QqaTnf4lHGXO1MvsXs.BINL5QhChxfUfDfPyKcAW4L2',     'avery@example.com');

-- Sam(3) and Taylor(5) are coaches, Jordan(4) is admin
INSERT INTO coach (coach_id, coach_description, price) VALUES
  (1, 'System account. Used for platform-assigned plans and automated actions.', 0.00),
  (3, 'Certified coach focusing on strength + habit building.', 75.00),
  (5, 'HIIT and conditioning specialist.',                      65.00);

INSERT INTO admin (admin_id) VALUES (4);

-- certifications (10)
INSERT INTO certifications (coach_id, cert_name, provider_name, description, issued_date, expires_date) VALUES
  (3, 'CPT',                     'NASM',               'Certified Personal Trainer',      '2022-01-01', '2026-01-01'),
  (3, 'Nutrition Coach',         'Precision Nutrition', 'Nutrition coaching fundamentals', '2023-05-01', NULL),
  (3, 'Corrective Exercise',     'NASM',               'Corrective exercise specialist',  '2023-03-15', '2027-03-15'),
  (3, 'CPR/AED',                 'Red Cross',           NULL,                             '2024-01-10', '2026-01-10'),
  (3, 'Performance Enhancement', 'NASM',               'PES certification',               '2021-07-01', '2025-07-01'),
  (5, 'CSCS',                    'NSCA',                NULL,                             '2021-03-01', NULL),
  (5, 'CPR/AED',                 'Red Cross',           NULL,                             '2023-01-15', NULL),
  (5, 'CrossFit L1',             'CrossFit',           'CrossFit Level 1 Trainer',        '2022-06-01', '2024-06-01'),
  (5, 'Kettlebell Specialist',   'StrongFirst',        'SFG Level 1',                     '2023-09-01', NULL),
  (5, 'Precision Nutrition L1',  'Precision Nutrition','PN1 certification',                '2024-02-01', NULL);


-- exercise library (IDs 1-30)
INSERT INTO exercise (exercise_name, equipment, video_url) VALUES
  ('hack calf raise',                              'sled machine',     '2ORFMoR.gif'),  
  ('sled 45° leg press (side pov)',                'sled machine',     '2Qh2J1e.gif'),  
  ('dumbbell front raise',                         'dumbbell',         '3eGE2JC.gif'),  
  ('dumbbell over bench revers wrist curl',        'dumbbell',         '3tAXPQ6.gif'),  
  ('barbell incline bench press',                  'barbell',          '3TZduzM.gif'),  
  ('cable squatting curl',                         'cable',            '3XFdb1Z.gif'),  
  ('dumbbell one arm hammer preacher curl',        'dumbbell',         '4dF3maG.gif'),  
  ('barbell standing close grip curl',             'barbell',          '4dUn2iv.gif'),  
  ('kettlebell pistol squat',                      'kettlebell',       '5bpPTHv.gif'),  
  ('impossible dips',                              'body weight',      '05Cf2v8.gif'),  
  ('barbell seated overhead triceps extension',    'barbell',          '5uFK1xr.gif'),  
  ('smith incline bench press',                    'smith machine',    '5v7KYld.gif'),  
  ('weighted side bend (on stability ball)',       'weighted',         '6bOA1Oi.gif'),  
  ('dumbbell one arm upright row',                 'dumbbell',         '6cKQC5E.gif'),  
  ('barbell standing rocking leg calf raise',      'barbell',          '6HiHHe0.gif'),  
  ('barbell wrist curl v. 2',                      'barbell',          '6kSxYnw.gif'),  
  ('dumbbell lying single extension',              'dumbbell',         '6MfS53i.gif'),  
  ('dumbbell reverse spider curl',                 'dumbbell',         '6sMAmNv.gif'),  
  ('bent knee lying twist (male)',                 'body weight',      '6sYyrRX.gif'),  
  ('lever front pulldown',                         'leverage machine', '7F1DVzn.gif'),  
  ('lever seated row',                             'leverage machine', '7I6LNUG.gif'),  
  ('dumbbell standing concentration curl',         'dumbbell',         '7inpWch.gif'),  
  ('cable decline fly',                            'cable',            '7saC5zz.gif'),  
  ('smith leg press',                              'smith machine',    '7zdxRTl.gif'),  
  ('dumbbell palms in incline bench press',        'dumbbell',         '8eqjhOl.gif'),  
  ('assisted hanging knee raise with throw down', 'assisted',         '8K0w2yA.gif'),   
  ('cable seated curl',                            'cable',            '8oYqOt9.gif'),  
  ('barbell standing calf raise',                  'barbell',          '8ozhUIZ.gif'),  
  ('weighted hyperextension (on stability ball)', 'weighted',         '8urJS9b.gif'),   
  ('cable seated crunch',                          'cable',            '8xUv4J7.gif');  


-- workout plans
-- 1-4: coach-created | 5-14: system predefined library (UC 4.2)
INSERT INTO workout_plan (plan_name) VALUES
  ('Push Pull Legs - Intermediate'),   -- 1
  ('Upper Lower Split - Beginner'),    -- 2
  ('Full Body Strength - 3x Week'),    -- 3
  ('Arms & Shoulders Hypertrophy'),    -- 4
  ('Beginner Bodyweight'),             -- 5
  ('Core & Conditioning'),             -- 6
  ('Cable Machine Intro'),             -- 7
  ('Kettlebell Fundamentals'),         -- 8
  ('Strength Foundations'),            -- 9
  ('Isolation Arm Builder'),           -- 10
  ('Fat Loss Circuit'),                -- 11
  ('Cutting Shred Program'),           -- 12
  ('Cardio Endurance Builder'),        -- 13
  ('HIIT & Conditioning');             -- 14


-- ============================================================
-- workout_day
-- day_id assignment (auto_increment, insertion order):
--
-- plan 1 - Push Pull Legs (3 days):
--   day_id 1  → plan 1, day_order 1, Push
--   day_id 2  → plan 1, day_order 2, Pull
--   day_id 3  → plan 1, day_order 3, Legs
--
-- plan 2 - Upper Lower Split (2 days):
--   day_id 4  → plan 2, day_order 1, Upper
--   day_id 5  → plan 2, day_order 2, Lower
--
-- plans 3-14 (1 day each):
--   day_id 6  → plan 3
--   day_id 7  → plan 4
--   day_id 8  → plan 5
--   day_id 9  → plan 6
--   day_id 10 → plan 7
--   day_id 11 → plan 8
--   day_id 12 → plan 9
--   day_id 13 → plan 10
--   day_id 14 → plan 11
--   day_id 15 → plan 12
--   day_id 16 → plan 13
--   day_id 17 → plan 14
-- ============================================================

INSERT INTO workout_day (plan_id, day_order, day_label) VALUES
  (1, 1, 'Push'),   -- day_id 1
  (1, 2, 'Pull'),   -- day_id 2
  (1, 3, 'Legs'),   -- day_id 3
  (2, 1, 'Upper'),  -- day_id 4
  (2, 2, 'Lower'),  -- day_id 5
  (3,  1, 'Day 1'), -- day_id 6
  (4,  1, 'Day 1'), -- day_id 7
  (5,  1, 'Day 1'), -- day_id 8
  (6,  1, 'Day 1'), -- day_id 9
  (7,  1, 'Day 1'), -- day_id 10
  (8,  1, 'Day 1'), -- day_id 11
  (9,  1, 'Day 1'), -- day_id 12
  (10, 1, 'Day 1'), -- day_id 13
  (11, 1, 'Day 1'), -- day_id 14
  (12, 1, 'Day 1'), -- day_id 15
  (13, 1, 'Day 1'), -- day_id 16
  (14, 1, 'Day 1'); -- day_id 17

-- ============================================================
-- plan_exercise: uses day_id, NOT plan_id
-- (day_id, exercise_id) is the new PK
--
-- plan 1 day breakdown:
--   Push (day_id=1): exercise_id 5 (bench), 10 (dips)
--   Pull (day_id=2): exercise_id 20 (pulldown), 21 (row), 18 (spider curl)
--   Legs (day_id=3): exercise_id 1 (calf raise), 2 (leg press), 9 (pistol squat)
--
-- plan 2 day breakdown:
--   Upper (day_id=4): exercise_id 5 (bench), 3 (front raise), 14 (upright row)
--   Lower (day_id=5): exercise_id 2 (leg press), 28 (calf raise), 1 (hack calf raise)
-- ============================================================

INSERT INTO plan_exercise (day_id, exercise_id, order_in_workout, sets_goal, reps_goal, weight_goal) VALUES
  -- plan 1: Push (day_id=1)
  (1,  5, 1, 4,  8, NULL),   -- barbell incline bench press
  (1, 10, 2, 3, 10, NULL),   -- weighted dips

  -- plan 1: Pull (day_id=2)
  (2, 20, 1, 4, 10, NULL),   -- lat pulldown
  (2, 21, 2, 4, 10, NULL),   -- seated cable row
  (2, 18, 3, 3, 12, NULL),   -- dumbbell spider curl

  -- plan 1: Legs (day_id=3)
  (3,  1, 1, 4, 12, NULL),   -- hack calf raise
  (3,  2, 2, 4, 10, NULL),   -- sled leg press
  (3,  9, 3, 3,  8, NULL),   -- kettlebell pistol squat

  -- plan 2: Upper (day_id=4)
  (4,  5, 1, 3, 10, NULL),   -- barbell incline bench press
  (4,  3, 2, 3, 12, NULL),   -- dumbbell front raise
  (4, 14, 3, 3, 12, NULL),   -- dumbbell upright row

  -- plan 2: Lower (day_id=5)
  (5,  2, 1, 3, 12, NULL),   -- sled leg press
  (5, 28, 2, 3, 15, NULL),   -- standing calf raise
  (5,  1, 3, 3, 15, NULL),   -- hack calf raise

  -- plan 3: Full Body Strength (day_id=6)
  (6,  5, 1, 4,  6, 135.00),
  (6, 21, 2, 4,  6,  95.00),
  (6,  2, 3, 4,  8, 180.00),
  (6, 11, 4, 3, 10,  65.00),
  (6, 28, 5, 3, 12,  NULL),

  -- plan 4: Arms & Shoulders (day_id=7)
  (7,  8, 1, 4, 10, NULL),
  (7,  7, 2, 3, 12, NULL),
  (7,  6, 3, 3, 12, NULL),
  (7, 18, 4, 3, 15, NULL),
  (7, 11, 5, 4, 10, NULL),
  (7,  3, 6, 3, 15, NULL),

  -- plan 5: Beginner Bodyweight (day_id=8)
  (8, 10, 1, 3, 10, NULL),
  (8, 19, 2, 3, 15, NULL),
  (8,  3, 3, 3, 12, NULL),

  -- plan 6: Core & Conditioning (day_id=9)
  (9, 19, 1, 3, 20, NULL),
  (9, 30, 2, 3, 15, NULL),
  (9, 13, 3, 3, 15, NULL),
  (9, 26, 4, 3, 10, NULL),

  -- plan 7: Cable Machine Intro (day_id=10)
  (10,  6, 1, 3, 12, NULL),
  (10, 23, 2, 3, 12, NULL),
  (10, 27, 3, 3, 12, NULL),
  (10, 30, 4, 3, 15, NULL),

  -- plan 8: Kettlebell Fundamentals (day_id=11)
  (11,  9, 1, 3,  8, NULL),
  (11, 13, 2, 3, 12, NULL),
  (11, 29, 3, 3, 12, NULL),

  -- plan 9: Strength Foundations (day_id=12)
  (12,  5, 1, 5,  5, NULL),
  (12, 21, 2, 5,  5, NULL),
  (12,  2, 3, 5,  5, NULL),
  (12, 28, 4, 3, 10, NULL),

  -- plan 10: Isolation Arm Builder (day_id=13)
  (13,  8, 1, 4, 10, NULL),
  (13, 22, 2, 3, 12, NULL),
  (13, 17, 3, 3, 12, NULL),
  (13, 27, 4, 3, 12, NULL),
  (13, 11, 5, 3, 10, NULL),

  -- plan 11: Fat Loss Circuit (day_id=14)
  (14, 30, 1, 4, 15, NULL),
  (14, 19, 2, 4, 20, NULL),
  (14, 26, 3, 3, 10, NULL),
  (14, 10, 4, 3, 12, NULL),

  -- plan 12: Cutting Shred Program (day_id=15)
  (15,  6, 1, 4, 15, NULL),
  (15, 23, 2, 4, 15, NULL),
  (15, 30, 3, 4, 20, NULL),
  (15, 18, 4, 3, 15, NULL),
  (15, 13, 5, 3, 15, NULL),

  -- plan 13: Cardio Endurance Builder (day_id=16)
  (16, 19, 1, 3, 25, NULL),
  (16, 26, 2, 3, 12, NULL),
  (16, 30, 3, 3, 20, NULL),
  (16, 29, 4, 3, 15, NULL),

  -- plan 14: HIIT & Conditioning (day_id=17)
  (17, 10, 1, 5, 10, NULL),
  (17, 19, 2, 5, 15, NULL),
  (17,  9, 3, 4,  8, NULL),
  (17, 26, 4, 4, 10, NULL),
  (17, 30, 5, 4, 15, NULL);

-- ============================================================
-- workout_plan_template (unchanged)
-- ============================================================
INSERT INTO workout_plan_template (plan_id, author_user_id, is_public, description) VALUES
  (1,  1, 1, 'Strength | 3 days/week | 60-75 min | Intermediate'),
  (2,  1, 1, 'General Fitness | 4 days/week | 45-60 min | Beginner'),
  (3,  3, 1, 'Strength | 3 days/week | 45-60 min | Beginner'),
  (4,  5, 0, 'Muscle Gain | 2 days/week | 60-75 min | Intermediate'),
  (5,  1, 1, 'General Fitness | 3 days/week | 30-45 min | Beginner'),
  (6,  1, 1, 'Endurance | 3 days/week | 30-45 min | Beginner'),
  (7,  1, 1, 'Muscle Gain | 3 days/week | 45-60 min | Beginner'),
  (8,  1, 1, 'General Fitness | 3 days/week | 45-60 min | Intermediate'),
  (9,  1, 1, 'Strength | 4 days/week | 60-75 min | Advanced'),
  (10, 1, 1, 'Muscle Gain | 4 days/week | 60-75 min | Intermediate'),
  (11, 1, 1, 'Cutting | 4 days/week | 45-60 min | Beginner'),
  (12, 1, 1, 'Cutting | 5 days/week | 60-75 min | Intermediate'),
  (13, 1, 1, 'Endurance | 4 days/week | 45-60 min | Intermediate'),
  (14, 1, 1, 'Endurance | 5 days/week | 60-75 min | Advanced');

-- ============================================================
-- Everything below this line is unchanged from the original seed
-- ============================================================

INSERT INTO calendar (user_id, full_date, day_name) VALUES
  (2,  '2026-03-02', 'Mon'),
  (2,  '2026-03-04', 'Wed'),
  (2,  '2026-03-06', 'Fri'),
  (3,  '2026-03-02', 'Mon'),
  (3,  '2026-03-05', 'Thu'),
  (5,  '2026-03-03', 'Tue'),
  (5,  '2026-03-06', 'Fri'),
  (6,  '2026-03-04', 'Wed'),
  (7,  '2026-03-05', 'Thu'),
  (8,  '2026-03-07', 'Sat');

INSERT INTO event (user_id, event_date, start_time, end_time, event_type, description, workout_plan_id) VALUES
  (2,  '2026-03-02', '18:00:00', '19:00:00', 'workout',       'PPL - push day.',            1),
  (2,  '2026-03-04', '18:00:00', '19:00:00', 'workout',       'PPL - pull day.',            1),
  (2,  '2026-03-06', '18:00:00', '19:00:00', 'workout',       'PPL - legs day.',            1),
  (3,  '2026-03-02', '09:00:00', '09:30:00', 'coach_session', 'Weekly check-in with Alex.', NULL),
  (3,  '2026-03-05', '12:00:00', '12:30:00', 'meal',          'Meal prep Sunday.',          NULL),
  (5,  '2026-03-03', '07:00:00', '08:00:00', 'workout',       'Full body morning session.', 3),
  (5,  '2026-03-06', '07:00:00', '08:00:00', 'workout',       'Full body session 2.',       3),
  (6,  '2026-03-04', '12:00:00', '12:30:00', 'meal',          'Lunch prep',                 NULL),
  (7,  '2026-03-05', '18:00:00', '18:30:00', 'reminder',      'Stretching and mobility.',   NULL),
  (8,  '2026-03-07', '10:00:00', '11:00:00', 'workout',       'Arms and shoulders day.',    4);

INSERT INTO meal (name, calories, protein, carbs, fats) VALUES
  ('Chicken Bowl',       650, 45.00, 70.00, 18.00),   -- 1
  ('Greek Yogurt',       140, 15.00, 10.00,  3.00),   -- 2
  ('Salmon Plate',       550, 40.00, 30.00, 25.00),   -- 3
  ('Protein Shake',      220, 30.00, 10.00,  5.00),   -- 4
  ('Avocado Toast',      350, 12.00, 40.00, 18.00),   -- 5
  ('Turkey Wrap',        480, 35.00, 45.00, 14.00),   -- 6
  ('Egg White Omelette', 310, 28.00, 12.00,  9.00),   -- 7
  ('Brown Rice Bowl',    520, 22.00, 80.00,  8.00),   -- 8
  ('Cottage Cheese',     200, 25.00, 10.00,  4.00),   -- 9
  ('Tuna Salad',         390, 38.00, 15.00, 18.00);   -- 10

INSERT INTO food_item (user_id, name, calories, protein, carbs, fats) VALUES
  (2, 'Homemade Oatmeal',      300, 10.00, 50.00,  6.00),
  (2, 'Peanut Butter on Rice', 280,  9.00, 30.00, 14.00),
  (3, 'Protein Pancakes',      350, 28.00, 38.00,  8.00),
  (5, 'Pre-workout Smoothie',  240, 18.00, 32.00,  4.00),
  (6, 'Overnight Oats',        320, 12.00, 52.00,  7.00);


-- meal plans (IDs 1-10)
INSERT INTO meal_plan (user_id, plan_name, start_date, end_date, total_calories) VALUES
  (2,  'Cut Plan Week 1',   '2026-03-02', '2026-03-08', 2000),   -- 1
  (2,  'Cut Plan Week 2',   '2026-03-09', '2026-03-15', 1950),   -- 2
  (3,  'Maintenance Week',  NULL,         NULL,          2400),   -- 3
  (3,  'Surplus Week',      '2026-03-02', '2026-03-08', 2700),   -- 4
  (5,  'Lean Bulk',         NULL,         NULL,          2900),   -- 5
  (6,  'Fat Loss Phase',    '2026-03-01', '2026-03-31', 1800),   -- 6
  (7,  'High Protein Cut',  '2026-03-02', '2026-03-22', 2100),   -- 7
  (8,  'Recomp Plan',       '2026-03-01', NULL,          2200),   -- 8
  (9,  'Bulk Phase',        '2026-03-01', '2026-04-30', 3200),   -- 9
  (10, 'Beginner Cut',      '2026-03-01', '2026-03-31', 1700);   -- 10

INSERT INTO user_meal (meal_id, meal_plan_id, meal_type, servings, day_of_week) VALUES
  (1,  1, 'dinner',    1.00, 'Mon'),
  (2,  1, 'breakfast', 1.00, 'Mon'),
  (3,  1, 'lunch',     1.00, 'Tue'),
  (4,  2, 'breakfast', 1.50, 'Mon'),
  (5,  2, 'snack',     1.00, 'Wed'),
  (6,  3, 'lunch',     1.00, 'Mon'),
  (7,  3, 'breakfast', 1.00, 'Tue'),
  (8,  4, 'lunch',     1.00, 'Thu'),
  (9,  5, 'snack',     2.00, 'Fri'),
  (10, 6, 'dinner',    1.00, 'Sat');

INSERT INTO meal_log (user_id, meal_id, food_item_id, eaten_at, servings, notes) VALUES
  (2, 2,    NULL, '2026-03-02 08:10:00', 1.00, 'Quick breakfast.'),
  (2, NULL, 1,    '2026-03-02 12:30:00', 1.00, 'Added berries.'),
  (2, 1,    NULL, '2026-03-02 18:30:00', 1.00, 'Post workout.'),
  (3, 4,    NULL, '2026-03-02 07:45:00', 1.50, 'Pre-training.'),
  (3, 6,    NULL, '2026-03-02 13:00:00', 1.00, NULL),
  (5, NULL, 4,    '2026-03-03 06:30:00', 1.00, 'Before morning session.'),
  (5, 8,    NULL, '2026-03-03 12:00:00', 1.00, NULL),
  (6, NULL, 5,    '2026-03-04 08:00:00', 1.00, NULL),
  (6, 3,    NULL, '2026-03-04 13:00:00', 1.00, 'Good macros today.'),
  (7, 10,   NULL, '2026-03-05 12:30:00', 1.00, NULL);


-- coaching contracts (10)
INSERT INTO user_coach_contract (coach_id, user_id, agreed_price, start_date, end_date, contract_text, active) VALUES
  (3, 2,  75.00, '2026-03-01', '2026-06-01', 'Monthly coaching agreement.',         1),
  (3, 6,  70.00, '2026-03-01', '2026-05-01', 'Bi-monthly check-in package.',        1),
  (3, 8,  75.00, '2026-02-01', '2026-05-01', 'Strength focus program.',             1),
  (3, 9,  65.00, '2026-01-15', '2026-04-15', 'Online coaching - beginner package.', 1),
  (3, 10, 75.00, '2026-03-10', NULL,          'Ongoing coaching.',                  1),
  (5, 7,  65.00, '2026-03-01', '2026-06-01', 'HIIT conditioning block.',            1),
  (5, 11, 60.00, '2026-02-15', '2026-05-15', 'Fat loss HIIT program.',              1),
  (5, 2,  65.00, '2025-12-01', '2026-03-01', 'Completed conditioning block.',       0),
  (5, 6,  65.00, '2026-01-01', '2026-02-28', 'Intro HIIT package - completed.',     0),
  (3, 3,  75.00, '2025-09-01', '2026-01-01', 'Expired strength program.',           0);

INSERT INTO coach_availability (coach_id, day_of_week, start_time, end_time, recurring, active) VALUES
  (3, 'Mon', '08:00:00', '11:00:00', 1, 1),
  (3, 'Wed', '14:00:00', '18:00:00', 1, 1),
  (3, 'Fri', '09:00:00', '12:00:00', 1, 1),
  (3, 'Sat', '10:00:00', '13:00:00', 1, 1),
  (5, 'Tue', '06:00:00', '10:00:00', 1, 1),
  (5, 'Thu', '06:00:00', '10:00:00', 1, 1),
  (5, 'Sat', '08:00:00', '12:00:00', 1, 1),
  (5, 'Sun', '09:00:00', '11:00:00', 1, 0),
  (3, 'Tue', '16:00:00', '19:00:00', 1, 0),
  (5, 'Mon', '17:00:00', '20:00:00', 1, 1);

INSERT INTO coach_time_off (coach_id, start_dt, end_dt, reason) VALUES
  (3, '2026-03-20 00:00:00', '2026-03-22 23:59:00', 'Conference'),
  (5, '2026-04-01 00:00:00', '2026-04-05 23:59:00', 'Vacation');

INSERT INTO coach_client_note (coach_id, client_user_id, note_text, private) VALUES
  (3, 2,  'Alex is making consistent progress. Increase bench weight next session.',  1),
  (3, 6,  'Morgan struggles with lower body mobility. Add warmup work.',              1),
  (3, 8,  'Casey is strong but tends to skip leg day. Keep accountability.',         1),
  (3, 9,  'Drew is brand new to lifting. Keep weights light for first 4 weeks.',     1),
  (3, 10, 'Quinn has a history of shoulder impingement. Avoid overhead pressing.',   1),
  (5, 7,  'Riley pushed through last session despite being tired. Good effort.',     1),
  (5, 11, 'Avery needs to work on cardio base before ramping up HIIT intensity.',    1),
  (3, 2,  'Shared PPL template with Alex for self-guided days.',                     0),
  (5, 7,  'Referred Riley to physio for knee check.',                                1),
  (3, 6,  'Discussed nutrition targets for the cut phase.',                          1);


INSERT INTO conversation (conversation_type, created_by, title) VALUES
  ('dm', 3, NULL),  -- 1: 3 ↔ 2
  ('dm', 3, NULL),  -- 2: 3 ↔ 6
  ('dm', 3, NULL),  -- 3: 3 ↔ 8
  ('dm', 3, NULL),  -- 4: 3 ↔ 9
  ('dm', 3, NULL),  -- 5: 3 ↔ 10

  ('dm', 5, NULL),  -- 6: 5 ↔ 7
  ('dm', 5, NULL);  -- 7: 5 ↔ 11

-- messaging (10 conversations)
INSERT INTO conversation_member (conversation_id, user_id, role) VALUES
  (1, 3, 'owner'), (1, 2, 'member'),
  (2, 3, 'owner'), (2, 6, 'member'),
  (3, 3, 'owner'), (3, 8, 'member'),
  (4, 3, 'owner'), (4, 9, 'member'),
  (5, 3, 'owner'), (5, 10, 'member'),

  (6, 5, 'owner'), (6, 7, 'member'),
  (7, 5, 'owner'), (7, 11, 'member');

INSERT INTO message (conversation_id, sender_user_id, content, sent_at) VALUES

-- convo 1: coach 3 ↔ user 2
(1, 2, 'Hey coach, excited to start.',                      '2026-03-02 07:55:00'),
(1, 3, 'Good to hear. Let''s stay consistent this week.',   '2026-03-02 08:00:00'),

-- convo 2: coach 3 ↔ user 6
(2, 6, 'Finished upper body today.',                        '2026-03-04 13:10:00'),
(2, 3, 'Nice, how did shoulders feel?',                     '2026-03-04 13:15:00'),

-- convo 3: coach 3 ↔ user 8
(3, 3, 'Let''s focus on strength this month.',              '2026-03-03 09:00:00'),
(3, 8, 'Sounds good, ready to go.',                         '2026-03-03 09:05:00'),

-- convo 4: coach 3 ↔ user 9
(4, 9, 'Started the program today.',                        '2026-03-01 10:00:00'),
(4, 3, 'Great, keep me posted on progress.',                '2026-03-01 10:05:00'),

-- convo 5: coach 3 ↔ user 10
(5, 10, 'When does the next phase begin?',                  '2026-03-10 11:00:00'),
(5, 3,  'We start next Monday.',                            '2026-03-10 11:10:00'),

-- convo 6: coach 5 ↔ user 7
(6, 5, 'Let''s crush today''s HIIT.',                       '2026-03-03 06:50:00'),
(6, 7, 'Just finished. That was brutal.',                   '2026-03-03 07:45:00'),

-- convo 7: coach 5 ↔ user 11
(7, 11, 'First week, nervous but excited.',                 '2026-03-02 06:15:00'),
(7, 5,  'You''ll do great, just stay consistent.',          '2026-03-02 06:20:00');


-- reviews (10)
INSERT INTO coach_review (coach_id, reviewer_user_id, rating, review_text) VALUES
  (3, 2,  5, 'Clear, practical, and motivating.'),
  (3, 6,  4, 'Very structured and clear.'),
  (3, 8,  5, 'Best coach I''ve worked with. Completely changed my approach.'),
  (3, 9,  4, 'Great for beginners. Very patient and explains everything.'),
  (3, 10, 3, 'Good coach but communication could be faster.'),
  (5, 7,  5, 'High energy and motivating.'),
  (5, 11, 5, 'Incredible HIIT sessions. Lost 10 lbs in 6 weeks.'),
  (5, 2,  4, 'Tough but fair. Really pushes you to your limit.'),
  (5, 6,  4, 'Great energy. Sessions are always well structured.'),
  (3, 3,  5, 'Sam is an amazing coach. Helped me build real consistency.');


-- reports (10)
INSERT INTO user_report (reported_user_id, reporter_user_id, reason, status, admin_action, resolved_by_admin_id) VALUES
  (2,  4,  'Test report: spam content.',                  'resolved',  'No action needed (test).',         4),
  (6,  2,  'Inappropriate message in group chat.',        'resolved',  'Warning issued to user.',          4),
  (8,  3,  'Suspicious account activity.',                'reviewing', NULL,                               NULL),
  (9,  4,  'Possible fake profile.',                      'open',      NULL,                               NULL),
  (10, 5,  'Spam messages sent to multiple users.',       'resolved',  'Account temporarily restricted.',  4),
  (7,  2,  'Reported for sharing personal contact info.', 'dismissed', 'No violation found.',              4),
  (3,  8,  'Alleged misleading coaching claims.',         'reviewing', NULL,                               NULL),
  (5,  6,  'Report: coach missed scheduled sessions.',    'open',      NULL,                               NULL),
  (11, 7,  'Unsolicited DMs.',                            'resolved',  'User warned.',                     4),
  (4,  10, 'Potential impersonation.',                    'open',      NULL,                               NULL);


-- sessions (IDs 1-10)
INSERT INTO workout_session (user_id, started_at, ended_at, workout_plan_id, notes) VALUES
  (2,  '2026-03-02 18:00:00', '2026-03-02 18:55:00', 1, 'Push day. Hit all sets.'),
  (2,  '2026-03-04 18:00:00', '2026-03-04 19:05:00', 1, 'Pull day. Rows felt heavy.'),
  (2,  '2026-03-06 18:00:00', '2026-03-06 19:10:00', 1, 'Legs day. Calf raise PR.'),
  (5,  '2026-03-03 07:00:00', '2026-03-03 07:58:00', 3, 'Full body. Fatigued on leg press.'),
  (5,  '2026-03-06 07:00:00', '2026-03-06 08:05:00', 3, 'Full body session 2. Felt better.'),
  (6,  '2026-03-04 12:00:00', NULL,                   2, 'Upper day. Stopped early.'),
  (7,  '2026-03-05 18:00:00', '2026-03-05 19:10:00', 4, 'Arms day. Good pump.'),
  (8,  '2026-03-07 10:00:00', '2026-03-07 11:00:00', 4, 'First time on close grip curl.'),
  (9,  '2026-03-03 17:00:00', '2026-03-03 17:50:00', 2, 'Upper day. Kept weights light.'),
  (10, '2026-03-04 09:00:00', '2026-03-04 09:45:00', 2, 'First ever gym session. Very proud.');

INSERT INTO exercise_set_log (session_id, exercise_id, set_number, reps, weight, rpe, performed_at) VALUES
  (1,  5, 1,  8, 135.00, 7.0, '2026-03-02 18:05:00'),
  (1,  5, 2,  8, 135.00, 7.5, '2026-03-02 18:08:00'),
  (1,  5, 3,  7, 135.00, 8.5, '2026-03-02 18:11:00'),
  (1, 10, 1, 10, NULL,   6.5, '2026-03-02 18:22:00'),
  (1, 10, 2,  9, NULL,   7.5, '2026-03-02 18:25:00'),
  (2, 20, 1, 10,  80.00, 7.0, '2026-03-04 18:05:00'),
  (2, 21, 1, 10,  90.00, 7.5, '2026-03-04 18:20:00'),
  (2, 18, 1, 12,  20.00, 6.5, '2026-03-04 18:35:00'),
  (3,  2, 1, 10, 180.00, 8.0, '2026-03-06 18:05:00'),
  (3,  1, 1, 12, NULL,   6.0, '2026-03-06 18:25:00'),
  (3,  9, 1,  8,  35.00, 7.5, '2026-03-06 18:40:00'),
  (4,  2, 1,  8, 180.00, 8.0, '2026-03-03 07:10:00'),
  (4,  5, 1,  6, 145.00, 8.5, '2026-03-03 07:25:00'),
  (4, 28, 1, 12, NULL,   6.0, '2026-03-03 07:45:00'),
  (5,  2, 1,  8, 185.00, 7.5, '2026-03-06 07:10:00'),
  (5,  5, 1,  6, 150.00, 8.0, '2026-03-06 07:25:00'),
  (6,  5, 1, 10,  95.00, 6.5, '2026-03-04 12:05:00'),
  (6,  3, 1, 12,  20.00, 6.0, '2026-03-04 12:18:00'),
  (7,  8, 1, 10,  65.00, 7.5, '2026-03-05 18:05:00'),
  (7,  7, 1, 12,  25.00, 7.0, '2026-03-05 18:20:00'),
  (7, 11, 1, 10,  55.00, 8.0, '2026-03-05 18:35:00'),
  (8,  8, 1, 10,  55.00, 7.0, '2026-03-07 10:05:00'),
  (8,  6, 1, 12, NULL,   6.5, '2026-03-07 10:20:00'),
  (9,  5, 1, 10,  85.00, 6.0, '2026-03-03 17:05:00'),
  (9, 14, 1, 12,  15.00, 5.5, '2026-03-03 17:20:00'),
  (10, 5, 1,  8,  65.00, 5.0, '2026-03-04 09:05:00'),
  (10, 3, 1, 12,  10.00, 5.0, '2026-03-04 09:20:00');

INSERT INTO cardio_log (session_id, user_id, performed_at, steps, distance_km, duration_min, calories, avg_hr) VALUES
  (NULL, 2,  '2026-03-02 12:00:00', 6500,  4.800, 45, 280, 118),
  (NULL, 2,  '2026-03-05 07:00:00', 7200,  5.200, 48, 295, 122),
  (NULL, 3,  '2026-03-02 07:00:00', 9000,  6.500, 55, 340, 135),
  (NULL, 6,  '2026-03-04 07:00:00', 8200,  6.100, 55, 320, 132),
  (NULL, 6,  '2026-03-06 07:00:00', 7800,  5.800, 50, 305, 128),
  (NULL, 7,  '2026-03-03 06:30:00', 5500,  4.000, 35, 210, 140),
  (NULL, 8,  '2026-03-07 08:00:00', 4200,  3.100, 30, 180, 115),
  (NULL, 9,  '2026-03-03 06:00:00', 6000,  4.400, 40, 250, 125),
  (NULL, 10, '2026-03-04 08:00:00', 3500,  2.600, 25, 155, 110),
  (NULL, 11, '2026-03-02 09:00:00', 10200, 7.500, 65, 410, 145);

INSERT INTO daily_metrics (user_id, metric_date, weight, sleep_hours, resting_hr) VALUES
  (2,  '2026-03-02', 179.5, 7.25, 58),
  (2,  '2026-03-03', 179.0, 6.50, 60),
  (3,  '2026-03-02', 149.0, 8.00, 55),
  (5,  '2026-03-02', 164.0, 7.00, 62),
  (5,  '2026-03-03', 163.5, 7.50, 61),
  (6,  '2026-03-02', 139.0, 6.75, 64),
  (7,  '2026-03-02', 189.5, 7.00, 66),
  (8,  '2026-03-02', 154.5, 8.25, 59),
  (9,  '2026-03-03', 199.0, 7.00, 70),
  (10, '2026-03-04', 129.5, 9.00, 57);

INSERT INTO mental_wellness_survey (user_id, survey_date, mood_score, notes) VALUES
  (2,  '2026-03-02', 8,  'Pretty solid day.'),
  (2,  '2026-03-03', 7,  'A bit tired after session.'),
  (3,  '2026-03-02', 7,  NULL),
  (5,  '2026-03-02', 9,  NULL),
  (5,  '2026-03-03', 8,  'Good session this morning.'),
  (6,  '2026-03-04', 6,  'Shoulder still bugging me a little.'),
  (7,  '2026-03-05', 9,  'Loved today''s session.'),
  (8,  '2026-03-07', 7,  NULL),
  (9,  '2026-03-03', 5,  'Feeling out of it. Long day at work.'),
  (10, '2026-03-04', 10, 'First gym session ever. Incredible feeling.');


INSERT INTO survey_question (prompt, question_type, active) VALUES
  ('How stressed do you feel today (1-10)?',       'scale',  1),
  ('Any notes about your mood?',                   'text',   1),
  ('How would you rate your sleep last night?',    'scale',  1),
  ('Did you experience any pain during training?', 'yes_no', 1),
  ('How motivated do you feel today (1-10)?',      'scale',  1);

INSERT INTO survey_response (question_id, user_id, response_date, answer_text) VALUES
  (1, 2,  '2026-03-02', '3'),
  (2, 2,  '2026-03-02', 'Felt focused and productive.'),
  (3, 2,  '2026-03-02', '8'),
  (1, 3,  '2026-03-02', '5'),
  (2, 5,  '2026-03-02', 'Feeling energized.'),
  (4, 6,  '2026-03-04', 'yes'),
  (2, 6,  '2026-03-04', 'Left shoulder was sore during pressing.'),
  (5, 7,  '2026-03-05', '9'),
  (1, 9,  '2026-03-03', '7'),
  (3, 10, '2026-03-04', '9');

INSERT INTO points_wallet (user_id, balance) VALUES
  (2,  140),
  (3,  275),
  (4,  500),
  (5,  190),
  (6,   80),
  (7,  220),
  (8,   60),
  (9,   40),
  (10,  25),
  (11, 310);

INSERT INTO points_txn (user_id, delta_points, reason, ref_type, ref_id) VALUES
  (2,   50, 'Completed workout session', 'workout_session',   1),
  (2,   50, 'Completed workout session', 'workout_session',   2),
  (2,   50, 'Completed workout session', 'workout_session',   3),
  (2,  -10, 'Prediction wager',          'prediction_market', NULL),
  (3,   25, 'Workout bonus',             NULL,                NULL),
  (5,   40, 'Challenge completed',       NULL,                NULL),
  (5,   50, 'Completed workout session', 'workout_session',   4),
  (6,   30, 'Completed workout session', 'workout_session',   6),
  (7,   50, 'Completed workout session', 'workout_session',   7),
  (8,   60, 'Completed first session',   'workout_session',   8),
  (9,   40, 'Completed workout session', 'workout_session',   9),
  (10,  25, 'Completed first session',   'workout_session',   10),
  (11, 100, 'Referral bonus',            NULL,                NULL),
  (11, 100, 'Referral bonus',            NULL,                NULL),
  (11, 110, 'Challenge winner',          NULL,                NULL);


-- prediction market (IDs 1-10)
INSERT INTO prediction_market (creator_user_id, title, goal_text, end_date, status) VALUES
  (4,  'Will Alex hit 175 by April?',               'Goal: reach 175 lbs by 2026-04-01.',    '2026-04-01', 'open'),
  (2,  'Will Sam complete 3 workouts this week?',   'Goal: 3 logged sessions by 2026-03-08.','2026-03-10', 'open'),
  (3,  'Will Riley run 5K in under 25 min?',        'Goal: sub-25 5K before April.',         '2026-04-15', 'open'),
  (5,  'Will Morgan lose 5 lbs this month?',        'Goal: 5 lb drop by 2026-03-31.',        '2026-03-31', 'open'),
  (4,  'Will Casey hit a 225 bench?',               'Goal: 225 lb bench press.',             '2026-05-01', 'open'),
  (3,  'Will Drew complete 8 sessions in March?',   'Goal: 8 logged sessions in March.',     '2026-03-31', 'open'),
  (2,  'Will Quinn stick to meal plan for 2 weeks?','Goal: zero logged deviations.',         '2026-03-20', 'settled'),
  (5,  'Will Avery break 10k steps daily for a week?','Goal: 7 consecutive days 10k+.',     '2026-03-10', 'settled'),
  (4,  'Will Jordan run a 10K?',                    'Goal: complete a 10K event.',           '2026-06-01', 'open'),
  (3,  'Will Taylor coach 10 clients by June?',     'Goal: 10 active clients by June.',      '2026-06-30', 'open');

INSERT INTO prediction (market_id, predictor_user_id, prediction_value, points_wagered) VALUES
  (1,  2,  'yes', 10),
  (1,  3,  'no',  20),
  (1,  5,  'yes', 15),
  (2,  2,  'yes', 15),
  (2,  5,  'no',  10),
  (3,  2,  'yes', 20),
  (3,  8,  'no',  10),
  (4,  3,  'yes', 25),
  (4,  7,  'no',  15),
  (5,  2,  'yes', 30),
  (5,  10, 'no',  10),
  (6,  3,  'yes', 20),
  (7,  4,  'yes', 50),
  (8,  4,  'yes', 50),
  (9,  6,  'yes', 10),
  (10, 2,  'yes', 20);


-- coach assignments (10)
INSERT INTO coach_assignment_log (coach_id, user_id, assigned_type, workout_plan_id, meal_plan_id, template_id, assigned_at, note) VALUES
  (3, 2,  'workout_plan', 1,    NULL, NULL, '2026-03-01 10:00:00', 'Start with PPL. 3 days on 1 off.'),
  (3, 2,  'meal_plan',    NULL, 1,    NULL, '2026-03-01 10:05:00', 'Keep calories consistent.'),
  (3, 2,  'template',     NULL, NULL, 1,    '2026-03-01 10:10:00', 'Public PPL template for reference.'),
  (5, 6,  'workout_plan', 2,    NULL, NULL, '2026-03-02 09:00:00', 'Upper/lower for beginners. 4x week.'),
  (5, 7,  'workout_plan', 4,    NULL, NULL, '2026-03-02 09:15:00', 'Arms and shoulders focus block.'),
  (3, 8,  'workout_plan', 4,    NULL, NULL, '2026-03-02 10:00:00', 'Starting with arms/shoulders isolation.'),
  (3, 9,  'workout_plan', 2,    NULL, NULL, '2026-03-02 10:15:00', 'Beginner upper/lower. Keep it light.'),
  (3, 10, 'workout_plan', 2,    NULL, NULL, '2026-03-10 09:00:00', 'Starting fresh. Full onboarding next week.'),
  (5, 11, 'workout_plan', 3,    NULL, NULL, '2026-02-15 08:00:00', 'Full body 3x to build base before HIIT.'),
  (3, 6,  'meal_plan',    NULL, 6,    NULL, '2026-03-01 11:00:00', 'Fat loss phase nutrition targets.');


-- landing (10 testimonials)
INSERT INTO landing_testimonial (before_after_story, text, rating, display_order) VALUES
  ('Lost 12 lbs in 8 weeks.',          'I finally found a plan I can stick to.',          5,  1),
  (NULL,                                'Lost 8 lbs and gained confidence!',               5,  2),
  (NULL,                                'Best app I''ve used for tracking.',                4,  3),
  ('Went from 210 to 185 in 3 months.', 'The coach matching feature is a game changer.',  5,  4),
  (NULL,                                'Finally consistent with my workouts.',             4,  5),
  ('Deadlift went from 135 to 275.',    'The workout plans are actually well designed.',   5,  6),
  (NULL,                                'Love the meal tracking. Simple and effective.',    4,  7),
  ('Lost 20 lbs before my wedding.',    'My coach kept me accountable the whole way.',     5,  8),
  (NULL,                                'Great community. Everyone is supportive.',         4,  9),
  (NULL,                                'The prediction market feature is so motivating.',  5, 10);

INSERT INTO progress_showcase_media (media_url, media_type, testimonial_id) VALUES
  ('https://cdn.example.com/progress/alex_before_after.jpg',    'image', 1),
  ('https://cdn.example.com/progress/user4_progress.jpg',       'image', 4),
  ('https://cdn.example.com/progress/user6_deadlift.mp4',       'video', 6),
  ('https://cdn.example.com/progress/user8_wedding_before.jpg', 'image', 8),
  ('https://cdn.example.com/progress/community_highlight.mp4',  'video', 9);

INSERT INTO feature (title, description, icon, display_order, active) VALUES
  ('Workout Plans',        'Build and follow structured plans.',    'dumbbell',       1,  1),
  ('Meal Tracking',        'Log meals and monitor macros.',         'utensils',       2,  1),
  ('Coach Messaging',      'Chat with your coach in-app.',          'message-circle', 3,  1),
  ('Progress Charts',      'Visualize trends over time.',           'chart-line',     4,  1),
  ('Community Challenges', 'Compete with friends.',                 'trophy',         5,  1),
  ('Prediction Market',    'Bet points on your fitness goals.',     'zap',            6,  1),
  ('Cardio Tracking',      'Log runs, steps and cardio sessions.',  'activity',       7,  1),
  ('Wellness Surveys',     'Track mood, stress and sleep.',         'heart',          8,  1),
  ('Coach Discovery',      'Find and hire a certified coach.',      'search',         9,  1),
  ('Workout Templates',    'Browse public plans from top coaches.', 'layout',         10, 1);

INSERT INTO coach_featured (coach_id, display_order, start_date, end_date, active) VALUES
  (3, 1, '2026-03-01', '2026-04-01', 1),
  (5, 2, '2026-03-01', '2026-04-01', 1);

INSERT INTO notification 
(user_id, type, conversation_id, reference_id, title, body, is_read)
VALUES
-- CHAT NOTIFICATIONS (coach gets message from client)
(2, 'chat_message', 1, 1,  'New message from Alex',  'Hey coach, excited to start.', 0),

-- CHAT (client gets reply from coach)
(1, 'chat_message', 1, 2, 
 'New message from Coach Sam', 
 'Let''s do it. Keep it simple, keep it consistent.', 
 1),

-- COACH ACCEPTED CLIENT (based on contract)
(1, 'coach_assigned', NULL, 1,
 'Coach Assigned',
 'You are now working with Coach Sam.',
 0),

-- WELLNESS REMINDER
(1, 'wellness_reminder', NULL, NULL,
 'Daily Check-in',
 'Don’t forget to complete your wellness survey today.',
 0),

-- WORKOUT REMINDER (based on event)
(1, 'workout_reminder', NULL, 1,
 'Workout Scheduled',
 'You have a workout scheduled today at 6 PM.',
 0); 
-- ==========================================
-- 1. USERS (IDs 12 to 50)
-- ==========================================
INSERT INTO users_immutables (user_id, dob, first_name, last_name, email, phone_number) VALUES
(12, '1990-04-12', 'Liam', 'Smith', 'liam@example.com', '555-0012'),
(13, '1992-05-14', 'Olivia', 'Johnson', 'olivia@example.com', '555-0013'),
(14, '1988-08-22', 'Noah', 'Williams', 'noah@example.com', '555-0014'),
(15, '1995-11-03', 'Emma', 'Brown', 'emma@example.com', '555-0015'),
(16, '1991-01-30', 'Oliver', 'Jones', 'oliver@example.com', '555-0016'),
(17, '1989-07-19', 'Ava', 'Garcia', 'ava@example.com', '555-0017'),
(18, '1993-09-08', 'Elijah', 'Miller', 'elijah@example.com', '555-0018'),
(19, '1994-12-12', 'Charlotte', 'Davis', 'charlotte@example.com', '555-0019'),
(20, '1987-03-25', 'William', 'Rodriguez', 'william@example.com', '555-0020'),
(21, '1996-06-16', 'Sophia', 'Martinez', 'sophia@example.com', '555-0021'),
(22, '1998-02-11', 'James', 'Hernandez', 'james@example.com', '555-0022'),
(23, '1999-04-09', 'Isabella', 'Lopez', 'isabella@example.com', '555-0023'),
(24, '2000-08-15', 'Benjamin', 'Gonzalez', 'benjamin@example.com', '555-0024'),
(25, '2001-10-21', 'Mia', 'Wilson', 'mia@example.com', '555-0025'),
(26, '1997-12-05', 'Lucas', 'Anderson', 'lucas@example.com', '555-0026'),
(27, '1995-03-14', 'Amelia', 'Thomas', 'amelia@example.com', '555-0027'),
(28, '1992-07-07', 'Henry', 'Taylor', 'henry@example.com', '555-0028'),
(29, '1994-09-29', 'Harper', 'Moore', 'harper@example.com', '555-0029'),
(30, '1990-11-18', 'Alexander', 'Jackson', 'alexander@example.com', '555-0030'),
(31, '1989-01-22', 'Evelyn', 'Martin', 'evelyn@example.com', '555-0031'),
(32, '1993-05-06', 'Michael', 'Lee', 'michael2@example.com', '555-0032'),
(33, '1996-08-30', 'Abigail', 'Perez', 'abigail@example.com', '555-0033'),
(34, '1998-10-12', 'Daniel', 'Thompson', 'daniel@example.com', '555-0034'),
(35, '2000-12-24', 'Emily', 'White', 'emily@example.com', '555-0035'),
(36, '1991-02-15', 'Matthew', 'Harris', 'matthew@example.com', '555-0036'),
(37, '1994-04-20', 'Elizabeth', 'Sanchez', 'elizabeth@example.com', '555-0037'),
(38, '1997-06-25', 'Jackson', 'Clark', 'jackson@example.com', '555-0038'),
(39, '1999-09-08', 'Mila', 'Ramirez', 'mila@example.com', '555-0039'),
(40, '1988-11-14', 'Sebastian', 'Lewis', 'sebastian@example.com', '555-0040'),
(41, '1992-01-27', 'Ella', 'Robinson', 'ella@example.com', '555-0041'),
(42, '1995-03-31', 'David', 'Walker', 'david@example.com', '555-0042'),
(43, '1998-05-04', 'Avery', 'Young', 'avery2@example.com', '555-0043'),
(44, '2000-07-17', 'Carter', 'Allen', 'carter@example.com', '555-0044'),
(45, '1993-09-21', 'Sofia', 'King', 'sofia@example.com', '555-0045'),
(46, '1996-11-02', 'Wyatt', 'Wright', 'wyatt@example.com', '555-0046'),
(47, '1999-01-09', 'Camila', 'Scott', 'camila@example.com', '555-0047'),
(48, '1990-03-15', 'Jayden', 'Torres', 'jayden@example.com', '555-0048'),
(49, '1994-05-28', 'Aria', 'Nguyen', 'aria@example.com', '555-0049'),
(50, '1997-08-11', 'John', 'Hill', 'john@example.com', '555-0050');

INSERT INTO user_mutables (user_id, weight, height, goal_weight) VALUES
(12, 175, 70, 165), (13, 140, 64, 130), (14, 190, 72, 180), (15, 130, 62, 120),
(16, 210, 74, 195), (17, 150, 65, 140), (18, 185, 71, 175), (19, 135, 63, 125),
(20, 200, 73, 185), (21, 145, 66, 135), (22, 180, 70, 170), (23, 125, 61, 120),
(24, 195, 72, 185), (25, 130, 63, 125), (26, 175, 71, 165), (27, 140, 65, 135),
(28, 185, 72, 175), (29, 150, 64, 140), (30, 210, 75, 190), (31, 135, 62, 125),
(32, 190, 73, 180), (33, 145, 66, 135), (34, 170, 70, 160), (35, 125, 61, 120),
(36, 180, 71, 170), (37, 150, 65, 140), (38, 200, 74, 185), (39, 140, 64, 130),
(40, 195, 73, 180), (41, 130, 62, 120), (42, 185, 72, 175), (43, 135, 63, 125),
(44, 205, 75, 195), (45, 145, 65, 135), (46, 175, 71, 165), (47, 120, 60, 115),
(48, 190, 72, 180), (49, 150, 66, 140), (50, 200, 73, 190);

INSERT INTO user_creds (user_id, username, password_hash, email) VALUES
(12, 'liam_12', '$2b$12$7RLskAPYg.QqaTnf4lHGXO1MvsXs.BINL5QhChxfUfDfPyKcAW4L2', 'liam@example.com'),
(13, 'olivia_13', '$2b$12$7RLskAPYg.QqaTnf4lHGXO1MvsXs.BINL5QhChxfUfDfPyKcAW4L2', 'olivia@example.com'),
(14, 'noah_14', '$2b$12$7RLskAPYg.QqaTnf4lHGXO1MvsXs.BINL5QhChxfUfDfPyKcAW4L2', 'noah@example.com'),
(15, 'emma_15', '$2b$12$7RLskAPYg.QqaTnf4lHGXO1MvsXs.BINL5QhChxfUfDfPyKcAW4L2', 'emma@example.com'),
(16, 'oliver_16', '$2b$12$7RLskAPYg.QqaTnf4lHGXO1MvsXs.BINL5QhChxfUfDfPyKcAW4L2', 'oliver@example.com'),
(17, 'ava_17', '$2b$12$7RLskAPYg.QqaTnf4lHGXO1MvsXs.BINL5QhChxfUfDfPyKcAW4L2', 'ava@example.com'),
(18, 'elijah_18', '$2b$12$7RLskAPYg.QqaTnf4lHGXO1MvsXs.BINL5QhChxfUfDfPyKcAW4L2', 'elijah@example.com'),
(19, 'charlot_19', '$2b$12$7RLskAPYg.QqaTnf4lHGXO1MvsXs.BINL5QhChxfUfDfPyKcAW4L2', 'charlotte@example.com'),
(20, 'william_20', '$2b$12$7RLskAPYg.QqaTnf4lHGXO1MvsXs.BINL5QhChxfUfDfPyKcAW4L2', 'william@example.com'),
(21, 'sophia_21', '$2b$12$7RLskAPYg.QqaTnf4lHGXO1MvsXs.BINL5QhChxfUfDfPyKcAW4L2', 'sophia@example.com'),
(22, 'james_22', '$2b$12$7RLskAPYg.QqaTnf4lHGXO1MvsXs.BINL5QhChxfUfDfPyKcAW4L2', 'james@example.com'),
(23, 'isabella_23', '$2b$12$7RLskAPYg.QqaTnf4lHGXO1MvsXs.BINL5QhChxfUfDfPyKcAW4L2', 'isabella@example.com'),
(24, 'benjami_24', '$2b$12$7RLskAPYg.QqaTnf4lHGXO1MvsXs.BINL5QhChxfUfDfPyKcAW4L2', 'benjamin@example.com'),
(25, 'mia_25', '$2b$12$7RLskAPYg.QqaTnf4lHGXO1MvsXs.BINL5QhChxfUfDfPyKcAW4L2', 'mia@example.com'),
(26, 'lucas_26', '$2b$12$7RLskAPYg.QqaTnf4lHGXO1MvsXs.BINL5QhChxfUfDfPyKcAW4L2', 'lucas@example.com'),
(27, 'amelia_27', '$2b$12$7RLskAPYg.QqaTnf4lHGXO1MvsXs.BINL5QhChxfUfDfPyKcAW4L2', 'amelia@example.com'),
(28, 'henry_28', '$2b$12$7RLskAPYg.QqaTnf4lHGXO1MvsXs.BINL5QhChxfUfDfPyKcAW4L2', 'henry@example.com'),
(29, 'harper_29', '$2b$12$7RLskAPYg.QqaTnf4lHGXO1MvsXs.BINL5QhChxfUfDfPyKcAW4L2', 'harper@example.com'),
(30, 'alexand_30', '$2b$12$7RLskAPYg.QqaTnf4lHGXO1MvsXs.BINL5QhChxfUfDfPyKcAW4L2', 'alexander@example.com'),
(31, 'evelyn_31', '$2b$12$7RLskAPYg.QqaTnf4lHGXO1MvsXs.BINL5QhChxfUfDfPyKcAW4L2', 'evelyn@example.com'),
(32, 'michael_32', '$2b$12$7RLskAPYg.QqaTnf4lHGXO1MvsXs.BINL5QhChxfUfDfPyKcAW4L2', 'michael2@example.com'),
(33, 'abigail_33', '$2b$12$7RLskAPYg.QqaTnf4lHGXO1MvsXs.BINL5QhChxfUfDfPyKcAW4L2', 'abigail@example.com'),
(34, 'daniel_34', '$2b$12$7RLskAPYg.QqaTnf4lHGXO1MvsXs.BINL5QhChxfUfDfPyKcAW4L2', 'daniel@example.com'),
(35, 'emily_35', '$2b$12$7RLskAPYg.QqaTnf4lHGXO1MvsXs.BINL5QhChxfUfDfPyKcAW4L2', 'emily@example.com'),
(36, 'matthew_36', '$2b$12$7RLskAPYg.QqaTnf4lHGXO1MvsXs.BINL5QhChxfUfDfPyKcAW4L2', 'matthew@example.com'),
(37, 'elizabe_37', '$2b$12$7RLskAPYg.QqaTnf4lHGXO1MvsXs.BINL5QhChxfUfDfPyKcAW4L2', 'elizabeth@example.com'),
(38, 'jackson_38', '$2b$12$7RLskAPYg.QqaTnf4lHGXO1MvsXs.BINL5QhChxfUfDfPyKcAW4L2', 'jackson@example.com'),
(39, 'mila_39', '$2b$12$7RLskAPYg.QqaTnf4lHGXO1MvsXs.BINL5QhChxfUfDfPyKcAW4L2', 'mila@example.com'),
(40, 'sebasti_40', '$2b$12$7RLskAPYg.QqaTnf4lHGXO1MvsXs.BINL5QhChxfUfDfPyKcAW4L2', 'sebastian@example.com'),
(41, 'ella_41', '$2b$12$7RLskAPYg.QqaTnf4lHGXO1MvsXs.BINL5QhChxfUfDfPyKcAW4L2', 'ella@example.com'),
(42, 'david_42', '$2b$12$7RLskAPYg.QqaTnf4lHGXO1MvsXs.BINL5QhChxfUfDfPyKcAW4L2', 'david@example.com'),
(43, 'avery_43', '$2b$12$7RLskAPYg.QqaTnf4lHGXO1MvsXs.BINL5QhChxfUfDfPyKcAW4L2', 'avery2@example.com'),
(44, 'carter_44', '$2b$12$7RLskAPYg.QqaTnf4lHGXO1MvsXs.BINL5QhChxfUfDfPyKcAW4L2', 'carter@example.com'),
(45, 'sofia_45', '$2b$12$7RLskAPYg.QqaTnf4lHGXO1MvsXs.BINL5QhChxfUfDfPyKcAW4L2', 'sofia@example.com'),
(46, 'wyatt_46', '$2b$12$7RLskAPYg.QqaTnf4lHGXO1MvsXs.BINL5QhChxfUfDfPyKcAW4L2', 'wyatt@example.com'),
(47, 'camila_47', '$2b$12$7RLskAPYg.QqaTnf4lHGXO1MvsXs.BINL5QhChxfUfDfPyKcAW4L2', 'camila@example.com'),
(48, 'jayden_48', '$2b$12$7RLskAPYg.QqaTnf4lHGXO1MvsXs.BINL5QhChxfUfDfPyKcAW4L2', 'jayden@example.com'),
(49, 'aria_49', '$2b$12$7RLskAPYg.QqaTnf4lHGXO1MvsXs.BINL5QhChxfUfDfPyKcAW4L2', 'aria@example.com'),
(50, 'john_50', '$2b$12$7RLskAPYg.QqaTnf4lHGXO1MvsXs.BINL5QhChxfUfDfPyKcAW4L2', 'john@example.com');

-- ==========================================
-- 2. GOOGLE IDENTITIES
-- ==========================================
INSERT INTO google_user_identity (user_id, google_sub, google_email, email_verified) VALUES
(12, 'sub12', 'liam@example.com', 1),
(13, 'sub13', 'olivia@example.com', 1),
(14, 'sub14', 'noah@example.com', 1),
(15, 'sub15', 'emma@example.com', 1),
(16, 'sub16', 'oliver@example.com', 1),
(17, 'sub17', 'ava@example.com', 1),
(18, 'sub18', 'elijah@example.com', 1),
(19, 'sub19', 'charlotte@example.com', 1),
(20, 'sub20', 'william@example.com', 1),
(21, 'sub21', 'sophia@example.com', 1),
(22, 'sub22', 'james@example.com', 1),
(23, 'sub23', 'isabella@example.com', 1);

-- ==========================================
-- 3. ADMIN (1 new)
-- ==========================================
INSERT INTO admin (admin_id) VALUES (12);

-- ==========================================
-- 4. COACHES (10 new, IDs 13-22)
-- ==========================================
INSERT INTO coach (coach_id, coach_description, price) VALUES
(13, 'Strength coaching and hypertrophy specialist. Get big, get strong.', 100.00),
(14, 'Fat loss and body recomposition expert. Sustainable habits.', 80.00),
(15, 'Beginner coaching and mobility. Start your journey right.', 60.00),
(16, 'Conditioning and athletic performance.', 120.00),
(17, 'Nutrition support and online accountability coaching.', 70.00),
(18, 'Post-injury return to training. Let''s rebuild together.', 90.00),
(19, 'Online accountability and habit building for busy professionals.', 75.00),
(20, 'USA Weightlifting L1 coach. Olympic lifting focus.', 110.00),
(21, 'Holistic wellness, combining mental and physical fitness.', 85.00),
(22, 'General fitness and health optimization.', 55.00);

-- ==========================================
-- 5. CERTIFICATIONS
-- ==========================================
INSERT INTO certifications (coach_id, cert_name, provider_name, description, issued_date, expires_date) VALUES
(13, 'CSCS', 'NSCA', 'Strength and Conditioning Specialist', '2023-01-15', '2028-01-15'),
(13, 'Precision Nutrition L1', 'Precision Nutrition', NULL, '2022-05-10', NULL),
(14, 'CPT', 'ACE', 'Personal Trainer Certification', '2024-03-22', '2028-03-22'),
(14, 'CPR/AED', 'AHA', NULL, '2024-08-01', '2026-08-01'),
(15, 'CPT', 'NASM', 'Certified Personal Trainer', '2023-11-05', '2027-11-05'),
(15, 'Corrective Exercise', 'NASM', 'CES', '2022-12-10', NULL),
(16, 'CrossFit L1', 'CrossFit', NULL, '2022-06-15', '2027-06-15'),
(17, 'CPT', 'ISSA', NULL, '2023-02-28', '2027-02-28'),
(17, 'Nutrition Coach', 'ISSA', NULL, '2024-01-15', NULL),
(18, 'CSCS', 'NSCA', NULL, '2024-09-10', '2029-09-10'),
(18, 'Corrective Exercise', 'NASM', NULL, '2023-10-15', NULL),
(19, 'CPT', 'ACE', NULL, '2023-01-20', '2027-01-20'),
(20, 'USA Weightlifting L1', 'USAW', NULL, '2022-04-12', NULL),
(21, 'CPT', 'NASM', NULL, '2024-10-30', '2028-10-30'),
(22, 'CPT', 'ACE', NULL, '2024-07-18', '2028-07-18');

-- ==========================================
-- 6. COACH APPLICATIONS (Explicit IDs 1-20)
-- ==========================================
INSERT INTO coach_application (application_id, user_id, years_experience, coach_description, desired_price, status, submitted_at, reviewed_at, admin_action, reviewed_by_admin_id) VALUES
(1, 13, 5, 'Strength coaching and hypertrophy specialist. Get big, get strong.', 100.00, 'approved', '2024-01-10', '2024-01-15', 'Approved, solid credentials.', 4),
(2, 14, 3, 'Fat loss and body recomposition expert. Sustainable habits.', 80.00, 'approved', '2024-02-05', '2024-02-10', 'Approved.', 4),
(3, 15, 4, 'Beginner coaching and mobility. Start your journey right.', 60.00, 'approved', '2024-03-12', '2024-03-14', 'Approved.', 4),
(4, 16, 6, 'Conditioning and athletic performance.', 120.00, 'approved', '2024-04-20', '2024-04-22', 'Approved.', 12),
(5, 17, 2, 'Nutrition support and online accountability coaching.', 70.00, 'approved', '2024-05-18', '2024-05-20', 'Approved.', 12),
(6, 18, 8, 'Post-injury return to training. Let''s rebuild together.', 90.00, 'approved', '2024-06-30', '2024-07-02', 'Approved.', 12),
(7, 19, 3, 'Online accountability and habit building for busy professionals.', 75.00, 'approved', '2024-07-15', '2024-07-18', 'Approved.', 4),
(8, 20, 10, 'USA Weightlifting L1 coach. Olympic lifting focus.', 110.00, 'approved', '2024-08-22', '2024-08-25', 'Approved.', 4),
(9, 21, 4, 'Holistic wellness, combining mental and physical fitness.', 85.00, 'approved', '2024-09-05', '2024-09-10', 'Approved.', 12),
(10, 22, 5, 'General fitness and health optimization.', 55.00, 'approved', '2024-10-12', '2024-10-15', 'Approved.', 4),
(11, 23, 1, 'I like lifting and want to coach.', 50.00, 'pending', '2026-03-01', NULL, NULL, NULL),
(12, 24, 2, 'Good at cardio and running.', 40.00, 'pending', '2026-03-10', NULL, NULL, NULL),
(13, 25, 0, 'No experience but enthusiastic!', 100.00, 'rejected', '2025-11-20', '2025-11-25', 'Not enough experience.', 4),
(14, 26, 1, 'Let me coach please.', 60.00, 'rejected', '2025-12-05', '2025-12-10', 'Incomplete profile and lacking certs.', 12),
(15, 27, 4, 'Looking to train athletes.', 80.00, 'pending', '2026-03-15', NULL, NULL, NULL),
(16, 28, 5, 'Powerlifting specialist.', 90.00, 'pending', '2026-03-18', NULL, NULL, NULL),
(17, 29, 2, 'Nutrition background.', 70.00, 'pending', '2026-03-20', NULL, NULL, NULL),
(18, 30, 1, 'Yoga instructor.', 50.00, 'rejected', '2025-08-10', '2025-08-15', 'No valid fitness certs provided.', 4),
(19, 31, 3, 'Bodybuilding.', 85.00, 'rejected', '2025-09-01', '2025-09-05', 'Certs are expired.', 12),
(20, 32, 7, 'Rehab specialist.', 110.00, 'rejected', '2025-10-10', '2025-10-12', 'Missing proof of insurance.', 4);

-- ==========================================
-- 7. COACH APPLICATION CERTIFICATIONS
-- ==========================================
INSERT INTO coach_application_certification (application_id, cert_name, provider_name, issued_date, expires_date) VALUES
(1, 'CSCS', 'NSCA', '2023-01-15', '2028-01-15'), (1, 'Precision Nutrition L1', 'Precision Nutrition', '2022-05-10', NULL),
(2, 'CPT', 'ACE', '2024-03-22', '2028-03-22'), (2, 'CPR/AED', 'AHA', '2024-08-01', '2026-08-01'),
(3, 'CPT', 'NASM', '2023-11-05', '2027-11-05'), (3, 'Corrective Exercise', 'NASM', '2022-12-10', NULL),
(4, 'CrossFit L1', 'CrossFit', '2022-06-15', '2027-06-15'),
(5, 'CPT', 'ISSA', '2023-02-28', '2027-02-28'), (5, 'Nutrition Coach', 'ISSA', '2024-01-15', NULL),
(6, 'CSCS', 'NSCA', '2024-09-10', '2029-09-10'), (6, 'Corrective Exercise', 'NASM', '2023-10-15', NULL),
(7, 'CPT', 'ACE', '2023-01-20', '2027-01-20'),
(8, 'USA Weightlifting L1', 'USAW', '2022-04-12', NULL),
(9, 'CPT', 'NASM', '2024-10-30', '2028-10-30'),
(10, 'CPT', 'ACE', '2024-07-18', '2028-07-18'),
(11, 'CPR/AED', 'Red Cross', '2025-01-01', '2027-01-01'),
(12, 'Run Coach', 'RRCA', '2024-05-01', NULL),
(13, 'Fake Cert', 'Fake Provider', '2024-01-01', NULL),
(15, 'CSCS', 'NSCA', '2023-08-10', '2028-08-10'), (15, 'CPR', 'AHA', '2025-02-01', '2027-02-01'),
(16, 'Powerlifting cert', 'USAPL', '2024-11-01', NULL),
(17, 'PN L1', 'Precision Nutrition', '2025-01-15', NULL),
(18, 'Yoga Alliance 200hr', 'Yoga Alliance', '2020-05-10', NULL),
(19, 'CPT', 'ACE', '2019-01-01', '2023-01-01'),
(20, 'DPT', 'University', '2015-05-01', NULL);

-- ==========================================
-- 8. CONTRACTS
-- ==========================================
INSERT INTO user_coach_contract (coach_id, user_id, agreed_price, start_date, end_date, contract_text, active) VALUES
(13, 23, 100.00, '2025-05-01', NULL, 'Ongoing strength coaching.', 1),
(13, 24, 90.00, '2025-10-15', '2026-04-15', '6 month hypertrophy block.', 1),
(13, 25, 100.00, '2024-01-01', '2024-07-01', 'Completed block.', 0),
(14, 26, 80.00, '2026-01-10', NULL, 'Fat loss focus.', 1),
(14, 27, 80.00, '2026-02-01', NULL, 'Recomp goals.', 1),
(14, 28, 75.00, '2025-06-01', '2025-12-01', 'Summer shred program.', 0),
(15, 29, 60.00, '2026-02-01', NULL, 'Beginner mobility program.', 1),
(15, 30, 60.00, '2026-03-01', NULL, 'Foundation building.', 1),
(15, 31, 60.00, '2025-08-01', '2026-02-01', '6 month foundations.', 0),
(16, 32, 120.00, '2025-09-15', NULL, 'Athletic conditioning prep.', 1),
(16, 33, 120.00, '2026-03-01', '2026-09-01', 'Offseason conditioning.', 1),
(16, 34, 110.00, '2025-01-01', '2025-06-01', 'Pre-season camp.', 0),
(17, 35, 70.00, '2025-11-01', NULL, 'Nutrition and accountability.', 1),
(17, 36, 70.00, '2026-01-05', '2026-07-05', 'Habit building phase.', 1),
(17, 37, 65.00, '2024-11-01', '2025-05-01', 'Nutrition tracking intro.', 0),
(18, 38, 90.00, '2026-02-15', NULL, 'Post-surgery knee rehab training.', 1),
(18, 39, 90.00, '2026-01-10', NULL, 'Shoulder mobility focus.', 1),
(18, 40, 85.00, '2025-03-01', '2025-09-01', 'Shoulder recovery block.', 0),
(19, 41, 75.00, '2026-03-10', NULL, 'Executive accountability coaching.', 1),
(19, 42, 75.00, '2026-02-20', NULL, 'Daily check-ins.', 1),
(19, 43, 70.00, '2025-12-01', '2026-03-01', 'Winter habit reset.', 0),
(20, 44, 110.00, '2025-07-10', NULL, 'Olympic lifting technique.', 1),
(20, 45, 110.00, '2026-01-20', '2026-06-20', 'Competition prep.', 1),
(20, 46, 100.00, '2025-01-10', '2025-07-10', 'Snatch focus.', 0),
(21, 47, 85.00, '2025-10-01', NULL, 'Mind-body wellness journey.', 1),
(21, 48, 85.00, '2026-01-15', NULL, 'Holistic prep.', 1),
(21, 49, 80.00, '2025-01-15', '2025-07-15', '6 month wellness intro.', 0),
(22, 50, 55.00, '2026-02-01', NULL, 'General fitness programming.', 1),
(22, 12, 55.00, '2026-03-05', NULL, 'Getting back in shape.', 1),
(22, 23, 50.00, '2025-04-01', '2025-10-01', 'Discounted 6 month plan.', 0);

-- ==========================================
-- 9. AVAILABILITY & TIME OFF
-- ==========================================
INSERT INTO coach_availability (coach_id, day_of_week, start_time, end_time, recurring, active) VALUES
(13, 'Mon', '08:00:00', '12:00:00', 1, 1), (13, 'Wed', '14:00:00', '18:00:00', 1, 1), (13, 'Fri', '08:00:00', '12:00:00', 1, 1),
(14, 'Tue', '09:00:00', '17:00:00', 1, 1), (14, 'Thu', '09:00:00', '17:00:00', 1, 1), (14, 'Sat', '08:00:00', '12:00:00', 1, 1),
(15, 'Mon', '10:00:00', '14:00:00', 1, 1), (15, 'Wed', '10:00:00', '14:00:00', 1, 1), (15, 'Fri', '10:00:00', '14:00:00', 1, 1),
(16, 'Mon', '06:00:00', '10:00:00', 1, 1), (16, 'Tue', '06:00:00', '10:00:00', 1, 1), (16, 'Thu', '06:00:00', '10:00:00', 1, 1),
(17, 'Mon', '12:00:00', '16:00:00', 1, 1), (17, 'Wed', '12:00:00', '16:00:00', 1, 1), (17, 'Fri', '12:00:00', '16:00:00', 1, 1),
(18, 'Tue', '14:00:00', '18:00:00', 1, 1), (18, 'Thu', '14:00:00', '18:00:00', 1, 1),
(19, 'Mon', '07:00:00', '11:00:00', 1, 1), (19, 'Wed', '07:00:00', '11:00:00', 1, 1),
(20, 'Tue', '15:00:00', '19:00:00', 1, 1), (20, 'Thu', '15:00:00', '19:00:00', 1, 1), (20, 'Sat', '09:00:00', '13:00:00', 1, 1),
(21, 'Mon', '09:00:00', '13:00:00', 1, 1), (21, 'Wed', '09:00:00', '13:00:00', 1, 1),
(22, 'Fri', '16:00:00', '20:00:00', 1, 1), (22, 'Sat', '08:00:00', '12:00:00', 1, 1);

INSERT INTO coach_time_off (coach_id, start_dt, end_dt, reason) VALUES
(13, '2026-04-10 00:00:00', '2026-04-17 23:59:59', 'Vacation'),
(14, '2026-05-01 00:00:00', '2026-05-05 23:59:59', 'Conference'),
(15, '2026-06-15 00:00:00', '2026-06-20 23:59:59', 'Personal'),
(16, '2026-03-20 00:00:00', '2026-03-22 23:59:59', 'Competition'),
(17, '2026-07-01 00:00:00', '2026-07-07 23:59:59', 'Holiday'),
(18, '2026-08-10 00:00:00', '2026-08-15 23:59:59', 'Continuing Ed'),
(19, '2026-04-01 00:00:00', '2026-04-03 23:59:59', 'Sick Leave'),
(20, '2026-05-20 00:00:00', '2026-05-25 23:59:59', 'Meet Prep'),
(21, '2026-09-01 00:00:00', '2026-09-10 23:59:59', 'Retreat'),
(22, '2026-10-15 00:00:00', '2026-10-20 23:59:59', 'Vacation');

-- ==========================================
-- 10. CLIENT NOTES & REVIEWS
-- ==========================================
INSERT INTO coach_client_note (coach_id, client_user_id, note_text, private) VALUES
(13, 23, 'Client has a history of lower back pain, keep deadlift volume low.', 1),
(13, 24, 'Excellent progress on squats.', 1),
(14, 26, 'Struggling with weekend eating. Implement a looser Saturday macro target.', 1),
(14, 27, 'Hitting protein perfectly.', 1),
(15, 29, 'Ankle mobility is limiting squat depth. Prescribed daily stretches.', 1),
(15, 30, 'Learning hinge mechanics well.', 1),
(16, 32, 'Engine is huge, needs more pacing strategy for metcons.', 1),
(16, 33, 'Great output on the rower today.', 1),
(17, 35, 'Hitting protein goals consistently. Increasing carbs this week.', 1),
(17, 36, 'Needs to drink more water.', 1),
(18, 38, 'Knee is feeling 90% better. Slowly introducing unilateral leg work.', 1),
(18, 39, 'Shoulder mobility is improving.', 1),
(19, 41, 'Missed two check-ins due to work travel.', 1),
(19, 42, 'Nailed the morning routine.', 1),
(20, 44, 'Snatch pull is early, work on extension.', 1),
(20, 45, 'Clean is looking solid.', 1),
(21, 47, 'Reported better sleep after adding evening yoga.', 1),
(21, 48, 'Stress levels are high, pulled back volume.', 1),
(22, 50, 'Consistent attendance.', 1),
(22, 12, 'Getting back into the groove.', 1);

INSERT INTO coach_review (coach_id, reviewer_user_id, rating, review_text) VALUES
(13, 23, 5, 'Absolutely incredible strength coach. My squat went up 40lbs in 3 months!'),
(13, 25, 4, 'Very knowledgeable, but sometimes takes a day to reply.'),
(14, 26, 5, 'Helped me lose 15lbs without sacrificing my social life. Great habits.'),
(14, 28, 5, 'The summer shred program was tough but very effective.'),
(15, 29, 4, 'Great for beginners, super patient with my mobility issues.'),
(15, 31, 4, 'Learned the basics really well. Feeling much more confident in the gym.'),
(16, 32, 5, 'If you want to get pushed to your absolute limit, this is the coach.'),
(16, 34, 5, 'My conditioning is through the roof. Prepared me perfectly for my season.'),
(17, 35, 4, 'Great accountability, the daily check-ins really help me stay on track.'),
(17, 37, 5, 'Finally understand how to eat for my goals without starving.'),
(18, 38, 5, 'Rehabbed my knee better than my PT did. Very careful and progressive.'),
(18, 40, 5, 'Got me back to overhead pressing pain-free. Worth every penny.'),
(19, 41, 5, 'Perfect for my busy schedule. The accountability is exactly what I needed.'),
(19, 43, 4, 'Good check-ins, helped me build a solid morning routine.'),
(20, 44, 5, 'My snatch technique has never been better. Very detail-oriented.'),
(20, 46, 4, 'Solid programming, heavy volume but manageable.'),
(21, 47, 5, 'Love the holistic approach. I feel better physically and mentally.'),
(21, 49, 4, 'Good focus on overall wellness, not just lifting weights.'),
(22, 50, 5, 'Great general programming, keeps me moving and healthy.'),
(22, 23, 4, 'Solid coach, good value for the price.');

-- ==========================================
-- 11. USER REPORTS
-- ==========================================
INSERT INTO user_report (reported_user_id, reporter_user_id, reason, status, admin_action, resolved_by_admin_id) VALUES
(13, 23, 'Coach sent inappropriate promotional DMs outside the platform.', 'reviewing', NULL, NULL),
(25, 28, 'Spam DMs trying to sell supplements.', 'resolved', 'Banned user 25 from messaging.', 4),
(14, 30, 'Missed two scheduled sessions in a row without notice.', 'resolved', 'Spoke with coach, issued warning.', 12),
(26, 35, 'Impersonating another coach.', 'dismissed', 'User is not impersonating, just has a similar name.', 4),
(40, 41, 'Abusive messages in community chat.', 'open', NULL, NULL),
(16, 33, 'Harassment in comments.', 'open', NULL, NULL),
(18, 38, 'Inappropriate language in plan notes.', 'reviewing', NULL, NULL),
(50, 22, 'Spam profile.', 'resolved', 'Warned user.', 12),
(20, 45, 'Missed a zoom call.', 'dismissed', 'Coach proved they were present.', 12),
(47, 21, 'Soliciting other clients.', 'reviewing', NULL, NULL);

-- ==========================================
-- 12. MESSAGES & CONVERSATIONS (Explicit IDs)
-- ==========================================
INSERT INTO conversation (conversation_id, conversation_type, created_by, title) VALUES
(11, 'dm', 13, NULL), (12, 'dm', 14, NULL), (13, 'dm', 15, NULL), (14, 'dm', 16, NULL), (15, 'dm', 17, NULL),
(16, 'dm', 18, NULL), (17, 'dm', 19, NULL), (18, 'dm', 20, NULL), (19, 'dm', 21, NULL), (20, 'dm', 22, NULL);

INSERT INTO conversation_member (conversation_id, user_id, role) VALUES
(11, 13, 'owner'), (11, 23, 'member'),
(12, 14, 'owner'), (12, 26, 'member'),
(13, 15, 'owner'), (13, 29, 'member'),
(14, 16, 'owner'), (14, 32, 'member'),
(15, 17, 'owner'), (15, 35, 'member'),
(16, 18, 'owner'), (16, 38, 'member'),
(17, 19, 'owner'), (17, 41, 'member'),
(18, 20, 'owner'), (18, 44, 'member'),
(19, 21, 'owner'), (19, 47, 'member'),
(20, 22, 'owner'), (20, 50, 'member');

INSERT INTO message (message_id, conversation_id, sender_user_id, content, sent_at) VALUES
(50, 11, 13, 'Hey, your deadlift video looked great. Let''s add 10lbs next week.', '2026-03-01 10:00:00'),
(51, 11, 23, 'Sounds good! Lower back feels fine.', '2026-03-01 10:15:00'),
(52, 12, 14, 'How did the weekend go with the new macro targets?', '2026-03-02 09:00:00'),
(53, 12, 26, 'Much better, didn''t feel restricted at all.', '2026-03-02 09:30:00'),
(54, 13, 15, 'Are you ready for your first block?', '2026-03-03 08:00:00'),
(55, 13, 29, 'Yes, let''s get it!', '2026-03-03 08:10:00'),
(56, 14, 16, 'We need to push the pacing on the erg.', '2026-03-04 14:00:00'),
(57, 14, 32, 'I''ll try to hold sub 1:50.', '2026-03-04 14:20:00'),
(58, 15, 17, 'Did you meal prep yesterday?', '2026-03-05 09:00:00'),
(59, 15, 35, 'Yes, got all my lunches done.', '2026-03-05 09:45:00'),
(60, 16, 18, 'How is the knee after the step-ups?', '2026-03-06 11:00:00'),
(61, 16, 38, 'No pain at all.', '2026-03-06 11:30:00'),
(62, 17, 19, 'Check-in time.', '2026-03-07 07:00:00'),
(63, 17, 41, 'Done, check the app.', '2026-03-07 07:15:00'),
(64, 18, 20, 'Send me the snatch video.', '2026-03-08 16:00:00'),
(65, 18, 44, 'Uploading now.', '2026-03-08 16:30:00'),
(66, 19, 21, 'Did you do the breathwork?', '2026-03-09 20:00:00'),
(67, 19, 47, 'Yes, really helped me wind down.', '2026-03-09 20:30:00'),
(68, 20, 22, 'Great week of workouts.', '2026-03-10 18:00:00'),
(69, 20, 50, 'Thanks coach.', '2026-03-10 18:45:00');

-- ==========================================
-- 13. CALENDAR & EVENTS & MEALS
-- ==========================================
INSERT INTO calendar (user_id, full_date, day_name) VALUES
(23, '2026-03-02', 'Mon'), (23, '2026-03-04', 'Wed'), (23, '2026-03-06', 'Fri'),
(26, '2026-03-03', 'Tue'), (26, '2026-03-05', 'Thu'),
(29, '2026-03-01', 'Sun'), (29, '2026-03-02', 'Mon'),
(32, '2026-03-04', 'Wed'), (32, '2026-03-06', 'Fri');

INSERT INTO event (user_id, event_date, start_time, end_time, event_type, description, workout_plan_id) VALUES
(23, '2026-03-02', '17:00:00', '18:00:00', 'workout', 'Strength block day 1', 1),
(23, '2026-03-04', '17:00:00', '18:00:00', 'workout', 'Strength block day 2', 1),
(26, '2026-03-03', '06:00:00', '07:00:00', 'workout', 'Fat loss circuit', 11),
(26, '2026-03-05', '06:00:00', '07:00:00', 'workout', 'Fat loss circuit 2', 11),
(29, '2026-03-02', '18:00:00', '19:00:00', 'coach_session', 'Check-in with Coach', NULL),
(32, '2026-03-04', '15:00:00', '16:00:00', 'workout', 'Conditioning intervals', 13);

INSERT INTO meal_plan (meal_plan_id, user_id, plan_name, start_date, end_date, total_calories) VALUES
(11, 23, 'Strength Bulk', '2026-03-01', '2026-05-01', 3200),
(12, 26, 'Fat Loss Phase 1', '2026-03-01', '2026-04-01', 2100);

INSERT INTO user_meal (meal_id, meal_plan_id, meal_type, servings, day_of_week) VALUES
(1, 11, 'breakfast', 2.00, 'Mon'),
(2, 11, 'lunch', 1.50, 'Mon'),
(3, 12, 'breakfast', 1.00, 'Tue'),
(4, 12, 'lunch', 1.00, 'Tue');

INSERT INTO meal_log (user_id, meal_id, eaten_at, servings, notes) VALUES
(23, 1, '2026-03-02 08:00:00', 2.00, 'Felt full.'),
(26, 3, '2026-03-03 07:30:00', 1.00, 'Quick breakfast.');

-- ==========================================
-- 14. WORKOUT SESSIONS & LOGS
-- ==========================================
INSERT INTO workout_session (session_id, user_id, started_at, ended_at, workout_plan_id, notes) VALUES
(20, 23, '2026-03-02 17:00:00', '2026-03-02 18:15:00', 1, 'Felt strong today.'),
(21, 23, '2026-03-04 17:00:00', '2026-03-04 18:10:00', 1, 'Good pump.'),
(22, 26, '2026-03-03 06:00:00', '2026-03-03 07:00:00', 11, 'Tough circuit.'),
(23, 26, '2026-03-05 06:00:00', '2026-03-05 06:55:00', 11, 'Sweaty.'),
(24, 32, '2026-03-04 15:00:00', '2026-03-04 16:00:00', 13, 'Pushed hard.');

INSERT INTO exercise_set_log (session_id, exercise_id, set_number, reps, weight, rpe, performed_at) VALUES
(20, 5, 1, 8, 185.00, 7.5, '2026-03-02 17:10:00'),
(20, 5, 2, 8, 185.00, 8.0, '2026-03-02 17:15:00'),
(20, 5, 3, 6, 185.00, 9.5, '2026-03-02 17:20:00'),
(21, 21, 1, 10, 110.00, 7.0, '2026-03-04 17:15:00'),
(21, 21, 2, 10, 110.00, 7.5, '2026-03-04 17:20:00'),
(22, 30, 1, 15, 40.00, 8.0, '2026-03-03 06:10:00'),
(22, 30, 2, 15, 40.00, 8.5, '2026-03-03 06:15:00'),
(24, 26, 1, 12, NULL, 8.0, '2026-03-04 15:10:00');

INSERT INTO cardio_log (session_id, user_id, performed_at, steps, distance_km, duration_min, calories, avg_hr) VALUES
(22, 26, '2026-03-03 06:30:00', 2000, 1.500, 15, 120, 140),
(23, 26, '2026-03-05 06:30:00', 2500, 1.800, 20, 150, 145),
(24, 32, '2026-03-04 15:20:00', 5000, 4.000, 30, 300, 155);

-- ==========================================
-- 15. DAILY METRICS & WELLNESS
-- ==========================================
INSERT INTO daily_metrics (user_id, metric_date, weight, sleep_hours, resting_hr) VALUES
(23, '2026-03-01', 125.00, 8.0, 58),
(23, '2026-03-02', 125.20, 7.5, 60),
(26, '2026-03-01', 175.50, 6.5, 65),
(26, '2026-03-02', 175.00, 7.0, 64),
(32, '2026-03-01', 190.00, 8.5, 55);

INSERT INTO mental_wellness_survey (user_id, survey_date, mood_score, notes) VALUES
(23, '2026-03-01', 8, 'Feeling great after the deload week.'),
(26, '2026-03-01', 6, 'A bit stressed with work.'),
(32, '2026-03-01', 9, 'Ready to crush this week.');

INSERT INTO survey_question (question_id, prompt, question_type, active) VALUES
(11, 'How would you rate your sleep quality this week?', 'scale', 1),
(12, 'Did you hit your protein target most days?', 'yes_no', 1),
(13, 'What was your biggest win this week?', 'text', 1),
(14, 'How stressed do you feel on a scale of 1-10?', 'scale', 1);

INSERT INTO survey_response (question_id, user_id, response_date, answer_text) VALUES
(11, 23, '2026-03-07', '8'), (12, 23, '2026-03-07', 'yes'),
(13, 23, '2026-03-07', 'Finally hit a PR on bench press!'), (14, 23, '2026-03-07', '4'),
(11, 26, '2026-03-07', '6'), (12, 26, '2026-03-07', 'no'),
(11, 32, '2026-03-07', '9'), (14, 32, '2026-03-07', '2');

-- ==========================================
-- 16. POINTS & PREDICTIONS
-- ==========================================
INSERT INTO points_wallet (user_id, balance) VALUES
(12, 100), (13, 500), (14, 450), (15, 300), (16, 200), (17, 150), (18, 100), (19, 50), (20, 25), (21, 10), (22, 5),
(23, 800), (24, 650), (25, 100), (26, 400), (27, 200), (28, 150), (29, 300), (30, 50), (31, 10), (32, 500), (33, 400),
(34, 100), (35, 200), (36, 150), (37, 300), (38, 50), (39, 10), (40, 500), (41, 400), (42, 100), (43, 200), (44, 150),
(45, 300), (46, 50), (47, 10), (48, 500), (49, 400), (50, 100);

INSERT INTO points_txn (user_id, delta_points, reason, ref_type, ref_id) VALUES
(23, 50, 'Completed workout', 'workout_session', 20),
(23, 50, 'Completed workout', 'workout_session', 21),
(26, 50, 'Completed workout', 'workout_session', 22),
(26, 50, 'Completed workout', 'workout_session', 23),
(32, 50, 'Completed workout', 'workout_session', 24);

INSERT INTO prediction_market (market_id, creator_user_id, title, goal_text, status, end_date) VALUES
(11, 4, 'Coach 13 Expansion', 'Will Coach 13 reach 20 clients?', 'open', '2026-04-30'),
(12, 4, 'Diet Challenge', 'Will user 26 log 30 days of meals?', 'open', '2026-04-30');

INSERT INTO prediction (market_id, predictor_user_id, prediction_value, points_wagered) VALUES
(11, 23, 'yes', 100), (11, 26, 'no', 50),
(12, 32, 'yes', 50), (12, 23, 'yes', 25);

-- ==========================================
-- 17. ASSIGNMENT LOG, PHOTOS & TESTIMONIALS
-- ==========================================
INSERT INTO coach_assignment_log (coach_id, user_id, assigned_type, workout_plan_id, template_id, assigned_at, note) VALUES
(13, 23, 'workout_plan', 1, NULL, '2026-03-01 08:00:00', 'Starting the new strength block.'),
(14, 26, 'template', NULL, 11, '2026-03-02 09:00:00', 'Using the cutting shred template for the next 4 weeks.');

INSERT INTO progress_photo (user_id, photo_url, caption, taken_at) VALUES
(23, 'https://cdn.example.com/photos/23_front_1.jpg', 'Start of the bulk', '2025-05-01 08:00:00'),
(23, 'https://cdn.example.com/photos/23_front_2.jpg', '3 months in', '2025-08-01 08:00:00'),
(26, 'https://cdn.example.com/photos/26_side.jpg', 'Feeling leaner', '2026-02-15 09:00:00');

INSERT INTO landing_testimonial (before_after_story, text, rating, display_order) VALUES
('Was stuck at 150lbs for years.', 'Coach 13 helped me break through my plateau and gain 15lbs of muscle.', 5, 11),
('Tried every diet.', 'Coach 14 taught me how to eat sustainably. I''ve lost 20lbs and kept it off.', 5, 12);

INSERT INTO coach_featured (coach_id, display_order, start_date, end_date, active) VALUES
(13, 3, '2026-03-01', '2026-04-01', 1),
(14, 4, '2026-03-01', '2026-04-01', 1);

-- ==========================================
-- 18. NOTIFICATIONS
-- ==========================================
INSERT INTO notification (user_id, type, conversation_id, reference_id, title, body, is_read) VALUES
(23, 'chat_message', 11, 50, 'New message from Coach 13', 'Hey, your deadlift video looked great...', 0),
(13, 'chat_message', 11, 51, 'New message from Isabella', 'Sounds good! Lower back feels fine.', 0),
(26, 'chat_message', 12, 52, 'New message from Coach 14', 'How did the weekend go...', 0),
(14, 'chat_message', 12, 53, 'New message from Lucas', 'Much better, didn''t feel restricted...', 0);

SET FOREIGN_KEY_CHECKS = 1;