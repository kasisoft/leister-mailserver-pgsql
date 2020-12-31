/*
 * this table provides the additional column 'fullusername' which should be the same as CONCAT(username, '@', domain). the reason for this
 * is that if you support multiple domains and you want to make the password changeable by the user in 'rainloop' you need a column to select
 * the corresponding record (if you only have one domain that's not an issue but if you have multiple domains you need to incorporate that into
 * the select). rainloop doesn't provide the possibility to provide a query, so we need an extra column for the selection.
 */
CREATE TABLE IF NOT EXISTS accounts (
  id INTEGER NOT NULL,
  username VARCHAR(64) NOT NULL,
  domain VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  quota INTEGER DEFAULT 0,
  enabled BOOLEAN DEFAULT false,
  sendonly BOOLEAN DEFAULT false,
  fullusername VARCHAR(128) NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT uk_accounts__username_domain UNIQUE (username, domain),
  CONSTRAINT fk_domain FOREIGN KEY (domain) REFERENCES domains (domain)
);

