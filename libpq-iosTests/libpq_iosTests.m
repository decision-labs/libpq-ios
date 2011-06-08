//
//  libpq_iosTests.m
//  libpq-iosTests
//
//  Created by Kashif Rasul on 5/23/11.
//  Copyright 2011 SpacialDB. All rights reserved.
//

#import "libpq_iosTests.h"

@implementation libpq_iosTests

- (void)setUp
{
    [super setUp];
    NSLog(@"%@ start", self.name);
    conninfo = "dbname = postgres";
    conn = PQconnectdb(conninfo);
}

- (void)tearDown
{
    NSLog(@"%@ start", self.name);
    PQfinish(conn);
    [super tearDown];
}

- (void)testConnectionOK
{
    NSLog(@"%@ start", self.name);
    if (PQstatus(conn) != CONNECTION_OK) {
        NSString *message = [[NSString alloc] initWithUTF8String:PQerrorMessage(conn)];
        NSLog(@"Connection to database failed: %@", message);
        [message release];
    }
}

- (void)testTransaction
{
    NSLog(@"%@ start", self.name);

    res = PQexec(conn, "BEGIN");
    if (PQresultStatus(res) != PGRES_COMMAND_OK) {
        NSString *message = [[NSString alloc] initWithUTF8String:PQerrorMessage(conn)];
        NSLog(@"BEGIN command failed: %@", message);
        [message release];
    }
    PQclear(res);

    res = PQexec(conn, "END");
    PQclear(res);
}

- (void)testFetch
{
    NSLog(@"%@ start", self.name);

    res = PQexec(conn, "BEGIN");
    PQclear(res);

    res = PQexec(conn, "DECLARE myportal CURSOR FOR select * from pg_database");
    if (PQresultStatus(res) != PGRES_COMMAND_OK)
    {
        NSString *message = [[NSString alloc] initWithUTF8String:PQerrorMessage(conn)];
        NSLog(@"DECLARE CURSOR failed: %@", message);
        [message release];
    }
    PQclear(res);

    res = PQexec(conn, "FETCH ALL in myportal");
    if (PQresultStatus(res) != PGRES_TUPLES_OK)
    {
        NSString *message = [[NSString alloc] initWithUTF8String:PQerrorMessage(conn)];
        NSLog(@"FETCH ALL failed: %@", message);
        [message release];
    }

    int nFields = PQnfields(res);
    for (int i = 0; i < nFields; i++)
    {
        NSString *name = [[NSString alloc] initWithUTF8String:PQfname(res, i)];
        NSLog(@"%@\n\n", name);
        [name release];
    }

    for (int i = 0; i < PQntuples(res); i++)
    {
        for (int j = 0; j < nFields; j++) {
            NSString *value = [[NSString alloc] initWithUTF8String:PQgetvalue(res, i, j)];
            NSLog(@"%@\n", value);
            [value release];
        }
    }
    PQclear(res);

    res = PQexec(conn, "CLOSE myportal");
    PQclear(res);

    res = PQexec(conn, "END");
    PQclear(res);
}

@end
