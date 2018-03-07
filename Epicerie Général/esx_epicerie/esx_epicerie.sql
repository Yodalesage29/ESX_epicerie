INSERT INTO `addon_account` (name, label, shared) VALUES
  ('society_epicerie', 'Epicerie', 1)
;

INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
('epicerie', 'Epicerie', 1),
('society_epicerie_reserve', 'Epicerie (réserve)', 1);

INSERT INTO `datastore` (name, label, shared) VALUES 
    ('society_epicerie', 'Epicerie', 1)
;

INSERT INTO `jobs` (name, label, whitelisted) VALUES
  ('epicerie', 'Epicerie', 1)
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('epicerie', 0, 'stagiere', 'Stagière', 450, '{}', '{}'),
  ('epicerie', 1, 'epicier', 'Vendeur', 650, '{}', '{}'),
  ('epicerie', 2, 'co-gerant', 'Co-gérant', 800, '{}', '{}'),
  ('epicerie', 3, 'boss', 'Patron', 1000, '{}', '{}')
;

INSERT INTO `items` (`name`, `label`) VALUES  
    ('levure', 'Levure'),
    ('salade', 'Salade'),
    ('cafeine', 'Cafeine'),
    ('gaz', 'Gaz'),
    ('soda', 'Soda'),
    ('redbull', 'Redbull'),
    ('eau sucre', 'Eau Sucré'),
    ('tomate', 'Tomage'),
    ('icetea', 'Ice Tea'),
    ('farine', 'Farine'),
    ('tacos', 'Tacos'),
    ('steak', 'Steak'),
    ('poulet grille', 'Poulet grillé'),
    ('jusfruit', 'Jus de fruit'),
    ('arome', 'Arome'),
    ('ice', 'Glaçon'),
    ('pizza', 'Pizza'),
    ('magret de canard', 'Magret de canard'),
    ('baguette', 'Baguette'),
    ('cheeseburger', 'Cheeseburger'),
    ('coca cola', 'Coca Cola'),
    ('canard', 'Canard'),
    ('epice', 'Epice'),
    ('oignon', 'Oignon'),
	('ceau', 'Carton d eau'),
	('cpain', 'Carton de pain'),
    ('fromage', 'Fromage')
;
