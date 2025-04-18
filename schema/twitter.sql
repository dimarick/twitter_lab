CREATE DATABASE twitter;

\c twitter

DROP TABLE IF EXISTS producers;
CREATE TABLE producers
(
    producer_id uuid NOT NULL,
    PRIMARY KEY (producer_id)
);

DROP TABLE IF EXISTS messages;
CREATE TABLE messages
(
    id          uuid NOT NULL,
    producer_id uuid NOT NULL,
    content     varchar(140) DEFAULT NULL,
    created     int          DEFAULT NULL,
    PRIMARY KEY (id, producer_id),
    CONSTRAINT fk_messages_producers1 FOREIGN KEY (producer_id) REFERENCES producers (producer_id)
);

create index fk_messages_producers_idx on messages (producer_id);

DROP TABLE IF EXISTS subscribers;
CREATE TABLE subscribers
(
    subscriber_id uuid NOT NULL,
    PRIMARY KEY (subscriber_id)
);

DROP TABLE IF EXISTS subscriptions;
CREATE TABLE subscriptions
(
    subscriber_id uuid NOT NULL,
    producer_id   uuid NOT NULL,
    PRIMARY KEY (subscriber_id, producer_id),
    CONSTRAINT fk_subscriptions_producers FOREIGN KEY (producer_id) REFERENCES producers (producer_id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_subscriptions_subscribers FOREIGN KEY (subscriber_id) REFERENCES subscribers (subscriber_id) ON DELETE CASCADE ON UPDATE CASCADE
);

create index fk_subscriptions_producers_idx on subscriptions (producer_id);
create index fk_subscriptions_subscribers_idx on subscriptions (subscriber_id);

INSERT INTO producers (producer_id)
VALUES ('1CD89E11602A4186AFBFE0149B59EB08'),
       ('6E27EA06A7164C89AF88813749A8BD48');

INSERT INTO subscribers (subscriber_id)
VALUES ('70A64B5443C34C18BBEC64590FF7E0CC');

INSERT INTO subscriptions (subscriber_id, producer_id)
VALUES ('70A64B5443C34C18BBEC64590FF7E0CC', '1CD89E11602A4186AFBFE0149B59EB08');

INSERT INTO messages (id, producer_id, content, created)
VALUES ('462894B2B5A14088B7AF701C71D6D304', '6E27EA06A7164C89AF88813749A8BD48', 'Who is subscribed to Mr. Trump?',
        '1605194769'),
       ('B7A1C8D5C04E4FE38F986392BB751AD9', '6E27EA06A7164C89AF88813749A8BD48', 'And here Mr. Trump come again',
        '1605194747'),
       ('DF7E3D8FE19A4458BAD64BE7585200F5', '1CD89E11602A4186AFBFE0149B59EB08', 'Mr. Macron would like to say hello!',
        '1605197637'),
       ('E5C6F13A76D648B681F020B74FA9F04C', '6E27EA06A7164C89AF88813749A8BD48', 'Donald Trump posted his first message',
        '1605194709'),
       ('FCCC455BFF284DFD8153F07C0F869118', '1CD89E11602A4186AFBFE0149B59EB08', 'Now France President is here as well',
        '1605195323');
