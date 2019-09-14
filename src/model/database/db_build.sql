BEGIN;

DROP TABLE IF EXISTS cravings, products, ratings CASCADE;

CREATE TABLE cravings (
    id                  SERIAL          PRIMARY KEY,
    craving_name        VARCHAR(100)    NOT NULL
);

CREATE TABLE products (
    id                  SERIAL          PRIMARY KEY,
    product_name        VARCHAR(100)    NOT NULL,
    product_description VARCHAR(500)    NOT NULL,
    craving_id          INTEGER         NOT NULL,
    where_to_buy        text            ARRAY,
    product_image       VARCHAR(200),
    product_price       MONEY
);

CREATE TABLE ratings (
    id                  SERIAL          PRIMARY KEY,
    product_id          INTEGER         NOT NULL,
    rating              INTEGER         NOT NULL,
    comment             VARCHAR(500),
    tags                VARCHAR(200),
    votes               INTEGER
);

INSERT INTO cravings (craving_name) VALUES
('Cheese'),
('Meat'),
('Milk'),
('Sweets');

INSERT INTO products (product_name, product_description, where_to_buy, product_image, craving_id, product_price) VALUES
(
    'Violife Original Grated',
    'With coconut oil and vitamin B12. Melts great! Free from dairy, soya, gluten, lactose and nuts. No preservatives. Suitable for vegans & vegetarians. Kosher',
    '{"Waitrose", "Asda", "Morrisons"}',
    'https://imgur.com/ZCAQAGA.jpg',
    1,
    2.49
),
(
    'Engvita Yeast Flakes B12',
    'A gluten-free, vegan food with a cheesy, nutty taste. These yeast flakes are the ideal condiment to sprinkle on soups, stews, casseroles, toppings, salads and breakfast cereals to enhance the flavour.
    These yeast flakes have been fortified with Vitamin B12, which is considered to be an essential supplement to the vegan diet.
    ',
    '{"Holland&Barrett", "Ocado", "Tesco"}',
    'https://i.imgur.com/ct10sIE.jpg',
    1,
    3.10
),
(
    'Sainsburys Free From Cheddar-Style With Onion',
    'Coconut oil based alternative to Cheddar cheese with caramelised red onion chutney',
    '{"Sainsburys"}',
    'https://i.imgur.com/d5THZ8k.jpg',
    1,
    2.25
),
(
    'Waitrose Vegan Original Grated',
    'Grated coconut derivative based alternative. Melts well',
    '{"Waitrose"}',
    'https://i.imgur.com/OLlOkLR.jpg',
    1,
    2.60
),
(
    'Daiya Medium Cheddar Style Block',
    'Medium Cheddar Style Farmhouse Block. Artfully artisanal crafted. Good source of calcium',
    '{"Sainsburys"}',
    'https://i.imgur.com/jNS9T49.jpg',
    1,
    4.50
), (
    'Elmhurst Milked Almonds™ Almond Milk',
    'Imagine almond milk that actually tastes like almonds. Well, we made it! Our trick?',
    '{"Vegans United"}',
    'https://img.veganlogin.com/PezRzerGDBQ8R4NH.jpg',
    3,
    1.25
), (
    'Oatly Original Oat Milk',
    'Oatlys oat drink contains as much calcium as milk and is also enriched with vitamins. It has all the beneficial properties of oats and contains a balance of protein, carbohydrates and unsaturated fats. Its also dairy free and soya free too.',
    '{"Vegans United"}',
    'https://img.veganlogin.com/THzOMNbQBFaRs8Tl.jpg',
    3,
    1.25
), (
    'Silk Almond Milk, Original',
    'How will you enjoy the smooth taste of Silk® Original Almondmilk? Probably with a great big smile on your face! At a sensible 60 calories a cup, it’s delicious over cereal, in coffee, as part of a favorite recipe or served straight up in a glass.',
    '{"Vegans United"}',
    'https://img.veganlogin.com/8zyOzMzJ8Ze4GTzj.jpg',
    3,
    1.25
), (
    'Elmhurst Milked Hazelnuts™ Hazelnut Milk',
    'Enjoy creamy, mindful indulgence in your iced coffee, smoothie, cereal, or glass.',
    '{"Vegans United"}',
    'https://img.veganlogin.com/VAfe9credLs4k4pO.jpg',
    3,
    1.25
), (
    'Silk Soymilk, Organic Unsweetened',
    'Try Silk Organic Unsweetened Soymilk anywhere you enjoy dairy milk over your cereal, in your coffee or simply by itself. It’s all the soy goodness you love with absolutely no added sugar. Plus, Silk soymilk is a good source of wholesome, nutritionally complete soy protein and has as much calcium as dairy milk.',
    '{"Vegans United"}',
    'https://img.veganlogin.com/3JCFDd3Zad2Y60W8.jpg',
    3,
    1.25
), (
    'Beyond Burger',
    'The worlds first plant-based burger that looks, cooks, and satisfies like beef without GMOs, soy, or gluten.',
    '{"Vegans United"}',
    'https://img.veganlogin.com/t2vynOcMox8SYoYV.png',
    2,
    1.25
), (
    'Bonsan Organic Smoky Barbecue Shredded Jackfruit',
    'Plant-based goodness that tastes like the real deal? Look no further than our tasty Smoky Shredded Jackfruit. This Asian fruit is incredibly versatile and with a meaty texture, it makes for a convincing meat substitute. Get creative and veganize all your favourite dishes, from tacos to fajitas, burgers and wraps!',
    '{"Vegans United"}',
    'https://img.veganlogin.com/zDhxPQ83JdsmCJvN.png',
    2,
    1.25
), (
    'Uptons Naturals Bar B Que Jackfruit',
    'This tangy Bar-B-Que Jackfruit makes a great sandwich topped with coleslaw, and also goes great on a salad, in a wrap, or over rice.',
    '{"Vegans United"}',
    'https://img.veganlogin.com/BZMO0PLjvTsDFloN.png',
    2,
    1.25
), (
    'Tofurky Feast',
    'Tailgate partiers, trick-or-treaters and the Tooth Fairy are all in agreement: if you do something twice in a row, it’s officially a tradition. We’ve been serving up Tofurky Roasts since 1995, so we’re well-versed in the fine art of the meat-free main dish. If this is your first Tofurky Roast dinner, congratulations - you’re halfway to a brand new tradition.',
    '{"Vegans United"}',
    'https://img.veganlogin.com/tNtWeFKdqwecomSC.png',
    2,
    1.25
), (
    'Beyond Sausage Hot Italian',
    'THE WORLD’S FIRST PLANT-BASED SAUSAGE THAT LOOKS, SIZZLES AND SATISFIES LIKE PORK.',
    '{"Vegans United"}',
    'https://img.veganlogin.com/KwrqzKeLBthFa9wq.jpg',
    2,
    1.25
);


INSERT INTO ratings (product_id, rating, comment, votes) VALUES
(1, 4, 'Great!, Tastes just like original cheddar', 6),
(1, 5, 'Why would someone even eat real cheese when this exists???', 1),
(1, 1, 'Did not melt on pizza', 2),
(1, 3, 'Did the job', 5),
(2, 5, 'I love it. So friggin great', 9),
(3, 2, 'A bit of a let down', 2),
(4, 1, 'Do they even know what cheese is like? this is just wierd mush', 6),
(5, 4, 'More than okay', 5),
(6, 4, 'Oooh First Comment', 1),
(7, 4, 'Oooh First Comment', 1),
(8, 4, 'Oooh First Comment', 1),
(9, 4, 'Oooh First Comment', 1),
(10, 4, 'Oooh First Comment', 1),
(11, 4, 'Oooh First Comment', 1),
(12, 4, 'Oooh First Comment', 1),
(13, 4, 'Oooh First Comment', 1),
(14, 4, 'Oooh First Comment', 1),
(15, 4, 'Oooh First Comment', 1);

COMMIT;
