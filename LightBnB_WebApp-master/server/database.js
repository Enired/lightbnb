

const properties = require('./json/properties.json');
const users = require('./json/users.json');

const { Pool } = require('pg');

const pool = new Pool({
  user: 'labber',
  password: 'labber',
  host: 'localhost',
  database: 'lightbnb'
});

pool.connect();


/// Users

/**
 * Get a single user from the database given their email.
 * @param {String} email The email of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithEmail = function(email) {
  const values = [`${email}`]

  return pool.query(`
    SELECT *
    FROM users
    WHERE users.email = $1
  `, values)
  .then(results => {
    console.log(results.rows)
    return results.rows[0]
  })
  .catch(err => console.error(err.message));
}
exports.getUserWithEmail = getUserWithEmail;

/**
 * Get a single user from the database given their id.
 * @param {string} id The id of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithId = function(id) {
  const values = [`${id}`];
  
  return pool.query(`
  SELECT *
  FROM users
  WHERE users.id = $1
  `, values)
  .then(results => {
    console.log(results.rows)
    return results.rows[0] 
  })
  .catch(err => console.error(err.message));

}
exports.getUserWithId = getUserWithId;


/**
 * Add a new user to the database.
 * @param {{name: string, password: string, email: string}} user
 * @return {Promise<{}>} A promise to the user.
 */
const addUser =  function(user) {
  const values = [`${user.name}`, `${user.password}`, `${user.email}`]
  return pool.query(`
    INSERT INTO users(name, password, email)
    VALUES ($1, $2, $3)
    RETURNING *;
  `
  ,values)
  .then(results=>{
    return results.rows
  })
}
exports.addUser = addUser;

/// Reservations

/**
 * Get all reservations for a single user.
 * @param {string} guest_id The id of the user.
 * @return {Promise<[{}]>} A promise to the reservations.
 */
const getAllReservations = function(guest_id, limit = 10) {
  const values = [`${guest_id}`, `${limit}`]
  return pool.query(`
  SELECT properties.*
  FROM properties
  JOIN reservations ON reservations.property_id = properties.id
  JOIN users on users.id = reservations.guest_id
  WHERE reservations.guest_id = $1
  LIMIT $2;
  `,values)
  .then(results => {
    return results.rows
  })
  .catch(err => console.error(err.message));

}
exports.getAllReservations = getAllReservations;

/// Properties

/**
 * Get all properties.
 * @param {{}} options An object containing query options.
 * @param {*} limit The number of results to return.
 * @return {Promise<[{}]>}  A promise to the properties.
 */
const getAllProperties = function(options, limit = 10) {
  const values = [`${limit}`];
  
  return pool.query(`SELECT *
  FROM properties
  LIMIT $1
  `,
  values)
  .then(results =>{
    return results.rows
  })
  .catch(err => console.error(err.message));



  const limitedProperties = {};
  for (let i = 1; i <= limit; i++) {
    limitedProperties[i] = properties[i];
  }
  return Promise.resolve(limitedProperties);
}
exports.getAllProperties = getAllProperties;


/**
 * Add a property to the database
 * @param {{}} property An object containing all of the property details.
 * @return {Promise<{}>} A promise to the property.
 */
const addProperty = function(property) {
  const propertyId = Object.keys(properties).length + 1;
  property.id = propertyId;
  properties[propertyId] = property;
  return Promise.resolve(property);
}
exports.addProperty = addProperty;
