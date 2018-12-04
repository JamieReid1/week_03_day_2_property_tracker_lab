
DROP TABLE IF EXISTS properties;

CREATE TABLE properties (
  id SERIAL8 PRIMARY KEY,
  address VARCHAR(255),
  no_bedrooms INT2,
  value INT4,
  sq_footage INT4
);
