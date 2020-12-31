CREATE TABLE IF NOT EXISTS domains (
  id INTEGER NOT NULL,
  domain VARCHAR(255) NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT uk_domains__domain UNIQUE (domain)
);

