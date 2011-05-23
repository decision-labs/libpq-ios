//
//  libpq_iosTests.h
//  libpq-iosTests
//
//  Created by Kashif Rasul on 5/23/11.
//  Copyright 2011 SpacialDB. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "libpq-fe.h"

@interface libpq_iosTests : SenTestCase {
@private
    const char *conninfo;
    PGconn     *conn;
    PGresult   *res;
}

@end
