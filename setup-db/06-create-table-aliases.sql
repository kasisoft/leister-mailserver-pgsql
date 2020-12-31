CREATE TABLE IF NOT EXISTS aliases (
  id INTEGER NOT NULL,
  source_username VARCHAR(64) NOT NULL,
  source_domain VARCHAR(255) NOT NULL,
  destination_username VARCHAR(64) NOT NULL,
  destination_domain VARCHAR(255) NOT NULL,
  enabled BOOLEAN DEFAULT false,
  PRIMARY KEY (id),
  CONSTRAINT uk_key UNIQUE (source_username, source_domain, destination_username, destination_domain),
  CONSTRAINT fk_source_domain FOREIGN KEY (source_domain) REFERENCES domains (domain)
);

