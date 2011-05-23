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
        fprintf(stderr, "Connection to database failed: %s", PQerrorMessage(conn));
    }
}

- (void)testTransaction
{
    NSLog(@"%@ start", self.name);
    res = PQexec(conn, "BEGIN");

    if (PQresultStatus(res) != PGRES_COMMAND_OK) {
        fprintf(stderr, "BEGIN command failed: %s", PQerrorMessage(conn));
    }

    PQclear(res);
}
@end
