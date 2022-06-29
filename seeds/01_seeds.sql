-- Mock Users
INSERT INTO users(name, email, password)
VALUES
  (
    'Ocatavio Silva',
    'octane@apexlegends.com',
    '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'
  ),
  (
    'Natalie Paquette',
    'watson@apexlegends.com',
    '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.' 
  ),
  (
    'Tae Joon Park',
    'crypto@apexlegends.com',
    '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'
  ),
  (
    'Kairi Imahara',
    'valkyrie@apexlegends.com',
    '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'
  ),
  (
    'MRVN',
    'pathfinder@apexlegends.com',
    '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'
  ),
  (
    'Walter Fitzroy Jr.',
    'fuse@apexlegends.com',
    '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'
  ),
  (
    'Elliott Rodger Witt',
    'mirage@apexlegends.com',
    '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'
  ),
  (
    'Alexander Maxwell Nox',
    'caustic@apexlegends.com',
    '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'
  );

-- Mock Properties (8 users = 1-8 for owner Ids)
INSERT INTO properties (owner_id, title, description, thumbnail_photo_url, cover_photo_url, cost_per_night, parking_spaces, number_of_bathrooms, number_of_bedrooms, country, street, city, province, post_code, active)
VALUES
  (
    7, 
    'Oceanside', 
    'desc', 
    'https://cdn.realtor.ca/listing/TS637919454196530000/reb89/highres/7/R2704117_3.jpg', 
    'https://cdn.realtor.ca/listing/TS637919454196530000/reb89/highres/7/R2704117_3.jpg',
    400,
    2,
    1,
    1,
    'Canada',
    '1402 24th Street',
    'West Vancouver',
    'BC',
    'V7V4G8',
    TRUE
  ),
  (
    1,
    'Cartel',
    'desc',
    'https://cdn.realtor.ca/listing/TS637919347115970000/reb89/highres/7/R2703967_1.jpg',
    'https://cdn.realtor.ca/listing/TS637919347115970000/reb89/highres/7/R2703967_1.jpg',
    666,
    6,
    5,
    4,
    'Canada',
    '3370 Craigend Road',
    'West Vancouver',
    'BC',
    'V7V3G2',
    TRUE
  ),
  (
    3,
    'Stack Overflow',
    'desc',
    'https://cdn.realtor.ca/listing/TS637915206637570000/reb89/highres/4/R2703014_1.jpg',
    'https://cdn.realtor.ca/listing/TS637915206637570000/reb89/highres/4/R2703014_1.jpg',
    1313,
    8,
    7,
    6,
    'Canada',
    '550 Craigmohr Drive',
    'West Vancouver',
    'BC',
    'V7S1W9',
    TRUE
  );

INSERT INTO reservations (start_date, end_date, property_id, guest_id)
VALUES 
  (
    '2022-09-13', 
    '2022-09-26', 
    1, 
    2
  ),
  (
    '2023-07-04', 
    '2023-08-01', 
    2, 
    4
  ),
  (
    '2022-12-24', 
    '2022-12-26', 
    3, 
    5
  );


INSERT INTO property_reviews (guest_id, property_id, reservation_id, rating, message)
VALUES 
  (
    2,
    1,
    1,
    5,
    'Nice Views'
  ),
  (
    4,
    2,
    2,
    3,
    'Too big'
  ),
  (
    5,
    3,
    3,
    2,
    'Too many stairs. Could use an elevator.'
  );


