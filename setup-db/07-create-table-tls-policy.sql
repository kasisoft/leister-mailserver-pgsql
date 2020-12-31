DO $$ BEGIN
  CREATE TYPE POLICY_TYPE AS ENUM ('none', 'may', 'encrypt', 'dane', 'dane-only', 'fingerprint', 'verify', 'secure');
EXCEPTION
  WHEN duplicate_object THEN null;
END $$;

CREATE TABLE IF NOT EXISTS tlspolicies (
  id INTEGER NOT NULL,
  domain VARCHAR(255) NOT NULL,
  policy POLICY_TYPE NOT NULL,
  params VARCHAR(255),
  PRIMARY KEY (id),
  CONSTRAINT uk_domain UNIQUE (domain)
);

