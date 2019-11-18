CREATE TABLE IF NOT EXISTS AM_SYSTEM_APPS (
            ID int(11) NOT NULL AUTO_INCREMENT,
            NAME VARCHAR(50) NOT NULL,
            CONSUMER_KEY VARCHAR(512) NOT NULL,
            CONSUMER_SECRET VARCHAR(512) NOT NULL,
            CREATED_TIME TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6),
            PRIMARY KEY (ID)
);

CREATE TABLE IF NOT EXISTS AM_API_CLIENT_CERTIFICATE (
  TENANT_ID INT(11) NOT NULL,
  ALIAS VARCHAR(45) NOT NULL,
  API_ID INTEGER NOT NULL,
  CERTIFICATE BLOB NOT NULL,
  REMOVED BOOLEAN NOT NULL DEFAULT 0,
  TIER_NAME VARCHAR (512),
  FOREIGN KEY (API_ID) REFERENCES AM_API (API_ID) ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY (ALIAS,TENANT_ID, REMOVED)
);

ALTER TABLE AM_POLICY_SUBSCRIPTION
  ADD (
    MONETIZATION_PLAN VARCHAR(25) NULL DEFAULT NULL,
    FIXED_RATE VARCHAR(15) NULL DEFAULT NULL,
    BILLING_CYCLE VARCHAR(15) NULL DEFAULT NULL,
    PRICE_PER_REQUEST VARCHAR(15) NULL DEFAULT NULL,
    CURRENCY VARCHAR(15) NULL DEFAULT NULL
  );

CREATE TABLE IF NOT EXISTS AM_MONETIZATION_USAGE_PUBLISHER (
  ID VARCHAR(100) NOT NULL,
  STATE VARCHAR(50) NOT NULL,
  STATUS VARCHAR(50) NOT NULL,
  STARTED_TIME VARCHAR(50) NOT NULL,
  PUBLISHED_TIME VARCHAR(50) NOT NULL,
  PRIMARY KEY (ID)
);

ALTER TABLE AM_API_COMMENTS
MODIFY COLUMN COMMENT_ID VARCHAR(255) NOT NULL;

ALTER TABLE AM_API_RATINGS
MODIFY COLUMN RATING_ID VARCHAR(255) NOT NULL;

CREATE TABLE IF NOT EXISTS AM_NOTIFICATION_SUBSCRIBER (
    UUID VARCHAR(255),
    CATEGORY VARCHAR(255),
    NOTIFICATION_METHOD VARCHAR(255),
    SUBSCRIBER_ADDRESS VARCHAR(255) NOT NULL,
    PRIMARY KEY(UUID,SUBSCRIBER_ADDRESS)
);

ALTER TABLE AM_EXTERNAL_STORES
ADD LAST_UPDATED_TIME TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6);

-- Start of Data Migration Scripts --
UPDATE AM_API_RATINGS SET RATING_ID=(SELECT RANDOM_UUID());
UPDATE AM_API_COMMENTS SET COMMENT_ID=(SELECT RANDOM_UUID());
