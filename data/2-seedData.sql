-- ============================================================
-- SEED DATA — full replacement
-- Includes workout_day table inserts.
-- plan_exercise now inserts by day_id, not plan_id.
-- workout_day IDs are deterministic based on insert order below.
-- ============================================================

-- user 1 is reserved as the system account
-- real users start at ID 2
-- coaches: Sam(3), Taylor(5) | admin: Jordan(4)

INSERT INTO users_immutables (dob, first_name, last_name, email, phone_number) VALUES
  (NULL,         'System',  'Betafit', 'system@betafit.internal', NULL),
  ('2000-01-01', 'Alex',   'Taylor',  'alex@example.com',         '555-1000'),
  ('1998-06-15', 'Sam',    'Nguyen',  'sam@example.com',          '555-2000'),
  ('1995-11-20', 'Jordan', 'Patel',   'jordan@example.com',       '555-3000'),
  ('1997-02-11', 'Taylor', 'Brooks',  'taylor@example.com',       '555-4000'),
  ('1994-09-23', 'Morgan', 'Lee',     'morgan@example.com',       '555-5000'),
  ('2001-07-04', 'Riley',  'Chen',    'riley@example.com',        '555-6000'),
  ('1999-12-18', 'Casey',  'Diaz',    'casey@example.com',        '555-7000'),
  ('1996-03-22', 'Drew',   'Okafor',  'drew@example.com',         '555-8000'),
  ('2002-08-09', 'Quinn',  'Martins', 'quinn@example.com',        '555-9000'),
  ('1993-05-30', 'Avery',  'Hobbs',   'avery@example.com',        '555-0100');

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
  (5,  'taylor_b', '$2b$12$7RLskAPYg.QqaTnf4lHGXO1MvsXs.BINL5QhChxfUfDfPyKcAW4L2', 'taylor@example.com'),
  (6,  'morgan_l', '$2b$12$7RLskAPYg.QqaTnf4lHGXO1MvsXs.BINL5QhChxfUfDfPyKcAW4L2', 'morgan@example.com'),
  (7,  'riley_c',  '$2b$12$7RLskAPYg.QqaTnf4lHGXO1MvsXs.BINL5QhChxfUfDfPyKcAW4L2', 'riley@example.com'),
  (8,  'casey_d',  '$2b$12$7RLskAPYg.QqaTnf4lHGXO1MvsXs.BINL5QhChxfUfDfPyKcAW4L2', 'casey@example.com'),
  (9,  'drew_o',   '$2b$12$7RLskAPYg.QqaTnf4lHGXO1MvsXs.BINL5QhChxfUfDfPyKcAW4L2', 'drew@example.com'),
  (10, 'quinn_m',  '$2b$12$7RLskAPYg.QqaTnf4lHGXO1MvsXs.BINL5QhChxfUfDfPyKcAW4L2', 'quinn@example.com'),
  (11, 'avery_h',  '$2b$12$7RLskAPYg.QqaTnf4lHGXO1MvsXs.BINL5QhChxfUfDfPyKcAW4L2', 'avery@example.com');

INSERT INTO coach (coach_id, coach_description, price) VALUES
  (1, 'System account. Used for platform-assigned plans and automated actions.', 0.00),
  (3, 'Certified coach focusing on strength + habit building.', 75.00),
  (5, 'HIIT and conditioning specialist.',                      65.00);

INSERT INTO admin (admin_id) VALUES (4);

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

INSERT INTO exercise (exercise_name, equipment, video_url) VALUES
  ('Hack Calf Raise',                    'sled machine',     '2ORFMoR.gif'),   -- 1
  ('Sled Leg Press',                     'sled machine',     '2Qh2J1e.gif'),   -- 2
  ('Dumbbell Front Raise',               'dumbbell',         '3eGE2JC.gif'),   -- 3
  ('Dumbbell Reverse Wrist Curl',        'dumbbell',         '3tAXPQ6.gif'),   -- 4
  ('Barbell Incline Bench Press',        'barbell',          '3TZduzM.gif'),   -- 5
  ('Cable Squat Curl',                   'cable',            '3XFdb1Z.gif'),   -- 6
  ('Dumbbell Hammer Preacher Curl',      'dumbbell',         '4dF3maG.gif'),   -- 7
  ('Barbell Close Grip Curl',            'barbell',          '4dUn2iv.gif'),   -- 8
  ('Kettlebell Pistol Squat',            'kettlebell',       '5bpPTHv.gif'),   -- 9
  ('Weighted Dips',                      'body weight',      '05Cf2v8.gif'),   -- 10
  ('Barbell Overhead Tricep Extension',  'barbell',          '5uFK1xr.gif'),   -- 11
  ('Smith Machine Incline Press',        'smith machine',    '5v7KYld.gif'),   -- 12
  ('Weighted Side Bend',                 'weighted',         '6bOA1Oi.gif'),   -- 13
  ('Dumbbell Upright Row',               'dumbbell',         '6cKQC5E.gif'),   -- 14
  ('Barbell Calf Raise',                 'barbell',          '6HiHHe0.gif'),   -- 15
  ('Barbell Wrist Curl',                 'barbell',          '6kSxYnw.gif'),   -- 16
  ('Dumbbell Tricep Extension',          'dumbbell',         '6MfS53i.gif'),   -- 17
  ('Dumbbell Spider Curl',               'dumbbell',         '6sMAmNv.gif'),   -- 18
  ('Lying Knee Twist',                   'body weight',      '6sYyrRX.gif'),   -- 19
  ('Lat Pulldown',                       'leverage machine', '7F1DVzn.gif'),   -- 20
  ('Seated Cable Row',                   'leverage machine', '7I6LNUG.gif'),   -- 21
  ('Dumbbell Concentration Curl',        'dumbbell',         '7inpWch.gif'),   -- 22
  ('Cable Decline Fly',                  'cable',            '7saC5zz.gif'),   -- 23
  ('Smith Machine Leg Press',            'smith machine',    '7zdxRTl.gif'),   -- 24
  ('Dumbbell Incline Press',             'dumbbell',         '8eqjhOl.gif'),   -- 25
  ('Hanging Knee Raise',                 'assisted',         '8K0w2yA.gif'),   -- 26
  ('Cable Curl',                         'cable',            '8oYqOt9.gif'),   -- 27
  ('Standing Calf Raise',                'barbell',          '8ozhUIZ.gif'),   -- 28
  ('Hyperextension',                     'weighted',         '8urJS9b.gif'),   -- 29
  ('Cable Crunch',                       'cable',            '8xUv4J7.gif');   -- 30

-- ============================================================
-- workout_plan (IDs 1-14, unchanged)
-- ============================================================
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
  ('Chicken Bowl',       650, 45.00, 70.00, 18.00),
  ('Greek Yogurt',       140, 15.00, 10.00,  3.00),
  ('Salmon Plate',       550, 40.00, 30.00, 25.00),
  ('Protein Shake',      220, 30.00, 10.00,  5.00),
  ('Avocado Toast',      350, 12.00, 40.00, 18.00),
  ('Turkey Wrap',        480, 35.00, 45.00, 14.00),
  ('Egg White Omelette', 310, 28.00, 12.00,  9.00),
  ('Brown Rice Bowl',    520, 22.00, 80.00,  8.00),
  ('Cottage Cheese',     200, 25.00, 10.00,  4.00),
  ('Tuna Salad',         390, 38.00, 15.00, 18.00);

INSERT INTO food_item (user_id, name, calories, protein, carbs, fats) VALUES
  (2, 'Homemade Oatmeal',      300, 10.00, 50.00,  6.00),
  (2, 'Peanut Butter on Rice', 280,  9.00, 30.00, 14.00),
  (3, 'Protein Pancakes',      350, 28.00, 38.00,  8.00),
  (5, 'Pre-workout Smoothie',  240, 18.00, 32.00,  4.00),
  (6, 'Overnight Oats',        320, 12.00, 52.00,  7.00);

INSERT INTO meal_plan (user_id, plan_name, start_date, end_date, total_calories) VALUES
  (2,  'Cut Plan Week 1',   '2026-03-02', '2026-03-08', 2000),
  (2,  'Cut Plan Week 2',   '2026-03-09', '2026-03-15', 1950),
  (3,  'Maintenance Week',  NULL,         NULL,          2400),
  (3,  'Surplus Week',      '2026-03-02', '2026-03-08', 2700),
  (5,  'Lean Bulk',         NULL,         NULL,          2900),
  (6,  'Fat Loss Phase',    '2026-03-01', '2026-03-31', 1800),
  (7,  'High Protein Cut',  '2026-03-02', '2026-03-22', 2100),
  (8,  'Recomp Plan',       '2026-03-01', NULL,          2200),
  (9,  'Bulk Phase',        '2026-03-01', '2026-04-30', 3200),
  (10, 'Beginner Cut',      '2026-03-01', '2026-03-31', 1700);

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
  ('dm',    2,  NULL),
  ('group', 3,  'Week 1 Accountability'),
  ('group', 5,  'HIIT Squad'),
  ('dm',    5,  NULL),
  ('dm',    3,  NULL),
  ('group', 3,  'Strength Block - March'),
  ('dm',    7,  NULL),
  ('dm',    9,  NULL),
  ('group', 5,  'Morning Crew'),
  ('dm',    11, NULL);

INSERT INTO conversation_member (conversation_id, user_id, role) VALUES
  (1,  2,  'owner'), (1,  3,  'member'),
  (2,  3,  'owner'), (2,  2,  'member'), (2,  4,  'admin'), (2,  6,  'member'),
  (3,  5,  'owner'), (3,  6,  'member'), (3,  7,  'member'), (3,  8,  'member'),
  (4,  5,  'owner'), (4,  7,  'member'),
  (5,  3,  'owner'), (5,  8,  'member'),
  (6,  3,  'owner'), (6,  2,  'member'), (6,  9,  'member'), (6,  10, 'member'),
  (7,  7,  'owner'), (7,  5,  'member'),
  (8,  9,  'owner'), (8,  3,  'member'),
  (9,  5,  'owner'), (9,  7,  'member'), (9,  11, 'member'),
  (10, 11, 'owner'), (10, 3,  'member');

INSERT INTO message (conversation_id, sender_user_id, content, sent_at) VALUES
  (1,  2,  'Hey coach, excited to start.',                      '2026-03-02 07:55:00'),
  (1,  3,  'Let''s do it. Keep it simple, keep it consistent.', '2026-03-02 08:00:00'),
  (2,  3,  'Welcome everyone. Post your sessions here.',        '2026-03-02 08:05:00'),
  (2,  2,  'Push day done. Felt strong.',                       '2026-03-02 19:05:00'),
  (2,  6,  'Upper day complete. Shoulder felt a bit off.',      '2026-03-04 13:10:00'),
  (3,  5,  'Let''s crush today''s HIIT.',                       '2026-03-03 06:50:00'),
  (3,  6,  'Ready when you are!',                               '2026-03-03 06:55:00'),
  (3,  7,  'Just finished. That was brutal.',                   '2026-03-03 07:45:00'),
  (4,  5,  'Riley great work today. Check form on squats.',     '2026-03-05 09:00:00'),
  (4,  7,  'Thanks coach, will watch the video again.',         '2026-03-05 09:15:00'),
  (6,  3,  'Strength block starting Monday. Who''s in?',        '2026-03-01 10:00:00'),
  (6,  2,  'In. What''s the plan?',                             '2026-03-01 10:05:00'),
  (9,  5,  'Morning crew - everyone ready for the week?',       '2026-03-02 06:00:00'),
  (9,  7,  'Ready!',                                            '2026-03-02 06:10:00'),
  (9,  11, 'First week, nervous but excited.',                  '2026-03-02 06:15:00');

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
  (2,  140), (3,  275), (4,  500), (5,  190), (6,   80),
  (7,  220), (8,   60), (9,   40), (10,  25), (11, 310);

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

INSERT INTO prediction_market (creator_user_id, title, goal_text, end_date, status) VALUES
  (4,  'Will Alex hit 175 by April?',                 'Goal: reach 175 lbs by 2026-04-01.',     '2026-04-01', 'open'),
  (2,  'Will Sam complete 3 workouts this week?',     'Goal: 3 logged sessions by 2026-03-08.', '2026-03-10', 'open'),
  (3,  'Will Riley run 5K in under 25 min?',          'Goal: sub-25 5K before April.',          '2026-04-15', 'open'),
  (5,  'Will Morgan lose 5 lbs this month?',          'Goal: 5 lb drop by 2026-03-31.',         '2026-03-31', 'open'),
  (4,  'Will Casey hit a 225 bench?',                 'Goal: 225 lb bench press.',              '2026-05-01', 'open'),
  (3,  'Will Drew complete 8 sessions in March?',     'Goal: 8 logged sessions in March.',      '2026-03-31', 'open'),
  (2,  'Will Quinn stick to meal plan for 2 weeks?',  'Goal: zero logged deviations.',          '2026-03-20', 'settled'),
  (5,  'Will Avery break 10k steps daily for a week?','Goal: 7 consecutive days 10k+.',        '2026-03-10', 'settled'),
  (4,  'Will Jordan run a 10K?',                      'Goal: complete a 10K event.',            '2026-06-01', 'open'),
  (3,  'Will Taylor coach 10 clients by June?',       'Goal: 10 active clients by June.',       '2026-06-30', 'open');

INSERT INTO prediction (market_id, predictor_user_id, prediction_value, points_wagered) VALUES
  (1,  2,  'yes', 10), (1,  3,  'no',  20), (1,  5,  'yes', 15),
  (2,  2,  'yes', 15), (2,  5,  'no',  10),
  (3,  2,  'yes', 20), (3,  8,  'no',  10),
  (4,  3,  'yes', 25), (4,  7,  'no',  15),
  (5,  2,  'yes', 30), (5,  10, 'no',  10),
  (6,  3,  'yes', 20),
  (7,  4,  'yes', 50),
  (8,  4,  'yes', 50),
  (9,  6,  'yes', 10),
  (10, 2,  'yes', 20);

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