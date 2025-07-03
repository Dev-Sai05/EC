class-id. AppProps.

working-storage section.
01 props         object reference.
01 fileStream    object reference.
01 db-url        pic x(100).
01 db-user       pic x(50).
01 db-pass       pic x(50).

procedure division.

    *> Create FileInputStream for application.properties
    set fileStream to new java.io.FileInputStream("config/application.properties")

    *> Create Properties object
    set props to new java.util.Properties

    *> Load the file
    invoke props "load" using fileStream

    *> Read the properties
    set db-url  to props::getProperty("db.url")
    set db-user to props::getProperty("db.username")
    set db-pass to props::getProperty("db.password")

    display "URL     = " db-url
    display "User    = " db-user
    display "Pass    = " db-pass

    goback.

end class.

Hi
