sequenceDiagram
    participant t as Terminal
    participant app as Main program (in app.rb)
    participant br as BookRespository class <br />(in lib/book_respository.rb)
    participant dbc as DatabaseConnection class <br />(in lib/database_connection.rb)
    participant db as Postgres database

    Note left of t: Flow of time <br />⬇ <br /> ⬇ <br /> ⬇ 

    t->>app: Runs `ruby app.rb`
    app->>app: `App.list` method runs
    app->>dbc: Opens database connection by calling `connect` on DatabaseConnection
    app->>br: Calls `all` method on BookRepository
    br->>dbc: Sends SQL query to `exec_params` <br />method on DatabaseConnection
    dbc->>db: Executes query via open connection
    db->>dbc: Returns results as array of hashes, <br />one for each matching record in the table
    dbc->>br: Returns results as array of hashes, <br />one for each matching record in the table
    loop
        br->>br: Loops over the results, <br />creating a new `book` object for each, <br />and pushes them into the `books` array
    end
    br->>app: Returns the `books` array

    loop
        app->>t: Loops through `books` array <br />and prints a list of <br />titles and authors
    end
