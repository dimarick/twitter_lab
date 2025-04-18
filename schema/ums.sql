CREATE DATABASE ums;

\c ums

DROP TABLE IF EXISTS last_visit;

CREATE TABLE last_visit
(
    id   uuid NOT NULL,
    "in" int DEFAULT NULL,
    out  int DEFAULT NULL,
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS roles;
CREATE TABLE roles
(
    id          uuid NOT NULL,
    name        varchar(45) DEFAULT NULL,
    description varchar(45) DEFAULT NULL,
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS users;
CREATE TABLE users
(
    id            uuid        NOT NULL,
    name          varchar(45) NOT NULL,
    email         varchar(45) NOT NULL,
    password      varchar(45) NOT NULL,
    created       int         NOT NULL,
    last_visit_id uuid DEFAULT NULL,
    PRIMARY KEY (id),
    foreign key (last_visit_id) references last_visit (id) ON DELETE CASCADE ON UPDATE CASCADE
);

create unique index email_key on users (email);
create index users_last_visit_id on users (last_visit_id);

DROP TABLE IF EXISTS users_has_roles;
CREATE TABLE users_has_roles
(
    users_id uuid NOT NULL,
    roles_id uuid NOT NULL,
    PRIMARY KEY (users_id, roles_id),
    FOREIGN KEY (roles_id) REFERENCES roles (id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (users_id) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE
);

drop index if exists fk_users_has_roles_roles1_idx;
create index fk_users_has_roles_roles1_idx on users_has_roles (roles_id);

INSERT INTO last_visit (id, "in", out)
VALUES ('306DCF05D3D64B438E066B6FFE2331FC'::uuid, '1604249194', '1604249224'),
       ('3C37571B0F494FED875845BFAE428B29'::uuid, '1604249181', '1604249209'),
       ('7AC613D5538745E58C9F9F49A0F271E1'::uuid, '1604249171', '1604249203'),
       ('8A0BE660EBC64C47AF813F7123977993'::uuid, '1604249188', '1604249217'),
       ('BE76648F49F24FBE9BC434BD8C23C70E'::uuid, '1604130098', '1604130106');

INSERT INTO roles (id, name, description)
VALUES ('43DCF1D63AC0429099FD44F9B9F9BECF', 'ADMIN', 'Admistrative toles for the system'),
       ('B479B3577E2547FA8DBABFDAEECC6C2C', 'SUBSCRIBER', 'Message content consumer'),
       ('EB932DBB7005422FA6497190AF39E984', 'PRODUCER', 'Message content producer');

INSERT INTO users (id, name, email, password, created, last_visit_id)
VALUES ('0DD03A597DBC4D0081073271B3345434', 'Angela Merkel', 'angela@merkel.de', 'password', '1504249224',
        '8A0BE660EBC64C47AF813F7123977993'),
       ('1CD89E11602A4186AFBFE0149B59EB08', 'Emmanuel Macron', 'emmanuel@macron.fr', 'password', '1504249224',
        'BE76648F49F24FBE9BC434BD8C23C70E'),
       ('6E27EA06A7164C89AF88813749A8BD48', 'Donald Trump', 'donalt@trump.us', 'password', '1604129987',
        'BE76648F49F24FBE9BC434BD8C23C70E'),
       ('70A64B5443C34C18BBEC64590FF7E0CC', 'Justing Trudeau', 'justin@trudeau.ca', 'password', '1504249224',
        '3C37571B0F494FED875845BFAE428B29'),
       ('ABB04B9F5D1040DD9076EB27CA76891A', 'Vladimir Putin', 'vladimir@putin.tu', 'password', '1504249224',
        '7AC613D5538745E58C9F9F49A0F271E1');

INSERT INTO users_has_roles (users_id, roles_id)
VALUES ('0DD03A597DBC4D0081073271B3345434', 'B479B3577E2547FA8DBABFDAEECC6C2C'),
       ('1CD89E11602A4186AFBFE0149B59EB08', 'B479B3577E2547FA8DBABFDAEECC6C2C'),
       ('1CD89E11602A4186AFBFE0149B59EB08', 'EB932DBB7005422FA6497190AF39E984'),
       ('6E27EA06A7164C89AF88813749A8BD48', 'B479B3577E2547FA8DBABFDAEECC6C2C'),
       ('6E27EA06A7164C89AF88813749A8BD48', 'EB932DBB7005422FA6497190AF39E984'),
       ('70A64B5443C34C18BBEC64590FF7E0CC', 'B479B3577E2547FA8DBABFDAEECC6C2C'),
       ('ABB04B9F5D1040DD9076EB27CA76891A', 'B479B3577E2547FA8DBABFDAEECC6C2C');
