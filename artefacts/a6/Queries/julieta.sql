/*1 - GET ALL FAQS DONE */
SELECT question, answer FROM faqs;

/*2 - SIGN IN DONE */
SELECT id
FROM users
WHERE username = $username
AND password = $hashedPassword;

SELECT id
FROM users
WHERE email = $email
AND password = $hashedPassword;

/*3 - SIGN UP DONE */
INSERT INTO users (name, username, email, password)
VALUES ($name, $username, $email, $hashedPassword);

/*4 - USER INFO FOR PROFILE DONE*/
SELECT name, username, email
FROM users
WHERE id = $id;

UPDATE users
SET name=$name, username=$username, email=$email, password=$hashedPassword
WHERE id=$id;

/*5 - GET USER ADRESSES DONE*/
SELECT A.id, A.name, A.street, A."postal_code", CTY.name, CNTR.name
FROM addresses AS A, cities AS CTY, countries AS CNTR
WHERE A."user_id" = $id
AND A."city_id" = CTY.id
AND CTY."country_id" = CNTR.id
AND A.archived NOT(true);

UPDATE addresses
SET archived=$archived
WHERE id=$id

/*-------------------------------------------------------------NOT TESTED-------------------------------------------------------------*/
/*6 - GET USER PURCHASES OF A CERTAIN TYPE*/
SELECT PRCHS.id, PRCHS."date", PRCHS.status, PRCHS.total
FROM users AS U, purchases AS PRCHS
WHERE PRCHS."user_id" = $id,
AND PRCHS.status = $type

/*8 - GET PURCHASE PRODUCTS*/
SELECT PRDCT.id, PRDCT.name, PP.price, PP.quantity
FROM purchases AS PRCHS, products AS PRDCT, product_purchases AS PP,
WHERE PRCHS.id = $id,
AND PP."purchase_id" = PRCHS.id,
AND PP."product_id" = PRDCT.id;

/*9 - GET PURHASE ADDRESS DONE*/
SELECT A.street, A."postal_code", CTY.name, CNTR.name
FROM purchases AS P, addresses AS A, cities AS CTY, countries AS CNTR
WHERE P.id = $id,
AND P."address_id" = A.id,
AND A."city_id" = CTY.id,
AND CTY."country_id" = CNTR.id;