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

-----


class-id. ReadProps.

working-storage section.

01 props        object reference.
01 fileStream   object reference.

01 jdbc-url     pic x(200).
01 username     pic x(50).
01 password     pic x(50).

procedure division.

    *> Create input stream for the full file path
    set fileStream to new java.io.FileInputStream("C:/Users/V1010513/Desktop/Properties/PFEnquiry/VisualCobAPI/MetaData/PropertyFiles/application.properties")

    *> Create a Properties object
    set props to new java.util.Properties

    *> Load the properties from the file
    invoke props "load" using fileStream

    *> Now access day DB properties
    set jdbc-url  to props::getProperty("day.datasource.jdbc-url")
    set username  to props::getProperty("day.datasource.username")
    set password  to props::getProperty("day.datasource.password")

    display "DAY DB JDBC URL   : " jdbc-url
    display "DAY DB Username   : " username
    display "DAY DB Password   : " password

    *> You can also access night DB properties
    set username  to props::getProperty("night.datasource.username")
    set password  to props::getProperty("night.datasource.password")

    display "NIGHT DB Username : " username
    display "NIGHT DB Password : " password

    goback.

end class.


class-id. ReadFile.

repository.
    class java.io.FileReader.
    class java.io.BufferedReader.

working-storage section.
01 fileReader       object reference.
01 bufferedReader   object reference.
01 line             string.

procedure division.

    *> Open file for reading
    set fileReader to new java.io.FileReader("C:/Users/V1010513/Desktop/Properties/PFEnquiry/VisualCobAPI/MetaData/PropertyFiles/application.properties")
    set bufferedReader to new java.io.BufferedReader(fileReader)

    perform until line = null
        set line to bufferedReader::readLine()
        if line not = null
            display line
        end-if
    end-perform

    invoke bufferedReader "close"

    goback.

end class.