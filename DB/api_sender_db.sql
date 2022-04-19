CREATE DATABASE api_sender_db;

USE api_sender_db;

CREATE TABLE IF NOT EXISTS account(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS messenger(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name TEXT NOT NULL,
    driver TEXT NOT NULL,
    status BOOL NOT NULL
);

CREATE TABLE IF NOT EXISTS messenger_settings(
    messenger_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    account_id INT NOT NULL,
    settings JSON NOT NULL,
    CONSTRAINT FK_MESSENGER_SETTINGS_ACCOUNT_ID FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE IF NOT EXISTS message(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    account_id INT NOT NULL,
    message TEXT NOT NULL,
    status INT NOT NULL,
    method INT NOT NULL,
    CONSTRAINT FK_MESSAGE_METHOD FOREIGN KEY (method) REFERENCES messenger_settings(messenger_id),
    CONSTRAINT FK_MESSAGE_ACCOUNT_ID FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE IF NOT EXISTS message_list(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    message TEXT NOT NULL
);

INSERT INTO message_list (message) VALUES ('Привет');
INSERT INTO message_list (message) VALUES ('Пока');
INSERT INTO message_list (message) VALUES ('Как дела?');