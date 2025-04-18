package com.ziminpro.ums.dtos;

public class Constants {
    private Constants() {
        throw new IllegalStateException("Constants only class");
    }

    // HTTP Section
    public static final String CODE = "code";
    public static final String MESSAGE = "message";
    public static final String DATA = "data";

    // HEADERS Section
    public static final String APPLICATION_JSON = "application/json";
    public static final String CONTENT_TYPE = "Content-Type";
    public static final String ACCEPT = "Accept";

    // Database Section
    public static final String DB = "ums";
    public static final String TABLE_USERS = "users";
    public static final String TABLE_ROLES = "roles";
    public static final String TABLE_LAST_VISIT = "last_visit";
    public static final String TABLE_USERS_ROLES = "users_has_roles";
    public static final String GET_ALL_USERS = "SELECT " +
            "users.id as \"users.id\",\n" +
            "users.name as \"users.name\",\n" +
            "users.email as \"users.email\",\n" +
            "users.password as \"users.password\",\n" +
            "users.created as \"users.created\",\n" +
            "roles.id as \"roles.id\",\n" +
            "roles.name as \"roles.name\",\n" +
            "roles.description as \"roles.description\",\n" +
            "last_visit.in as \"last_visit.in\",\n" +
            "last_visit.out as \"last_visit.out\" " +
            "FROM " + TABLE_USERS + " LEFT JOIN " + TABLE_USERS_ROLES
            + " ON " + TABLE_USERS_ROLES + ".users_id = " + TABLE_USERS + ".id LEFT JOIN " + TABLE_ROLES + " ON "
            + TABLE_USERS_ROLES + ".roles_id = " + TABLE_ROLES + ".id LEFT JOIN " + TABLE_LAST_VISIT + " ON "
            + TABLE_USERS + ".last_visit_id = " + TABLE_LAST_VISIT + ".id;";

    public static final String GET_USER_BY_ID_FULL = "SELECT " +
            "users.id as \"users.id\",\n" +
            "users.name as \"users.name\",\n" +
            "users.email as \"users.email\",\n" +
            "users.password as \"users.password\",\n" +
            "users.created as \"users.created\",\n" +
            "roles.id as \"roles.id\",\n" +
            "roles.name as \"roles.name\",\n" +
            "roles.description as \"roles.description\",\n" +
            "last_visit.in as \"last_visit.in\",\n" +
            "last_visit.out as \"last_visit.out\" " +
            "FROM " + TABLE_USERS + " LEFT JOIN " + TABLE_USERS_ROLES
            + " ON " + TABLE_USERS_ROLES + ".users_id = " + TABLE_USERS + ".id LEFT JOIN " + TABLE_ROLES + " ON "
            + TABLE_USERS_ROLES + ".roles_id = " + TABLE_ROLES + ".id LEFT JOIN " + TABLE_LAST_VISIT + " ON "
            + TABLE_USERS + ".last_visit_id = " + TABLE_LAST_VISIT + ".id WHERE " + TABLE_USERS
            + ".id=?::uuid;";
    public static final String CREATE_USER = "INSERT INTO " + TABLE_USERS
            + " (id, name, email, password, created, last_visit_id) VALUES "
            + "(?::uuid, ?, ?, ?, ?, ?::uuid);";
    public static final String ASSIGN_ROLE = "INSERT INTO " + TABLE_USERS_ROLES
            + " (users_id, roles_id) VALUES (?::uuid, ?::uuid);";
    public static final String CREATE_LOGIN = "INSERT INTO " + TABLE_LAST_VISIT + " VALUES " + "(?::uuid,?,?);";
    public static final String GET_ALL_ROLES = "SELECT " +
            "roles.id as \"roles.id\",\n" +
            "roles.name as \"roles.name\",\n" +
            "roles.description as \"roles.description\"\n" +
            "FROM " + TABLE_ROLES;
    public static final String DELETE_USER = "DELETE FROM " + TABLE_USERS + " WHERE id = (?::uuid);";
    public static final String DELETE_LAST_VISIT = "DELETE FROM " + TABLE_LAST_VISIT + " WHERE id = (?::uuid);";
}
