//
//  RRCityDAO.m
//  RRCurseApp8
//
//  Created by formacion on 04/03/14.
//  Copyright (c) 2014 EveronGames. All rights reserved.
//

#import "RRCityDAO.h"
#import "RRCity.h"

@implementation RRCityDAO


- (NSString *) obtenerRutaBD{
    NSString *dirDocs;
    NSArray *rutas;
    NSString *rutaBD;
    
    rutas = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    dirDocs = [rutas objectAtIndex:0];
    
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    rutaBD = [[NSString alloc] initWithString:[dirDocs stringByAppendingPathComponent:@"cities2.sqlite"]];
    
    if([fileMgr fileExistsAtPath:rutaBD] == NO){
        [fileMgr copyItemAtPath:[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"cities2.sqlite"] toPath:rutaBD error:NULL];
    }
    
    return rutaBD;
}


- (NSMutableArray *) obtenerCities{
	NSMutableArray *listaCities = [[NSMutableArray alloc] init];
	NSString *ubicacionDB = [self obtenerRutaBD];
	
	if(!(sqlite3_open([ubicacionDB UTF8String], &bd) == SQLITE_OK)){
		NSLog(@"No se puede conectar con la BD");
	}
	
	const char *sentenciaSQL = "SELECT id, name, description,image FROM city";
	sqlite3_stmt *sqlStatement;
	
	if(sqlite3_prepare_v2(bd, sentenciaSQL, -1, &sqlStatement, NULL) != SQLITE_OK){
		NSLog(@"Problema al preparar el statement");
	}
	
	while(sqlite3_step(sqlStatement) == SQLITE_ROW){
		RRCity *city = [[RRCity alloc] init];
		city.cityID = sqlite3_column_int(sqlStatement, 0);
		city.cityName = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 1)];
        city.cityDescription= [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 2)];
        
        
        NSData *cityData= [[NSData alloc] initWithBytes:sqlite3_column_blob(sqlStatement, 3) length:sqlite3_column_bytes(sqlStatement, 3)];
        city.cityPicture= [UIImage imageWithData:cityData];
				
		[listaCities addObject:city];
	}
	
	return listaCities;
}

- (void) deleteCity: (NSInteger) cityID
{
    NSString *ubicacionBD = [self obtenerRutaBD];
	
	if(!(sqlite3_open([ubicacionBD UTF8String], &bd) == SQLITE_OK)){
		NSLog(@"No se puede conectar con la BD");
		return;
	} else {
		NSString *sqlDelete = [NSString stringWithFormat:@"DELETE FROM city WHERE id = %d", cityID];
		const char *sql = [sqlDelete UTF8String];
		sqlite3_stmt *sqlStatement;
		
		if(sqlite3_prepare_v2(bd, sql, -1, &sqlStatement, NULL) != SQLITE_OK){
			NSLog(@"Problema al preparar el statement.");
			return;
		} else {
			if(sqlite3_step(sqlStatement) == SQLITE_DONE){
				sqlite3_finalize(sqlStatement);
				sqlite3_close(bd);
			}
		}
	}
    
}
- (void) addCity: (NSString *)nombre withDescription:(NSString *) description withImage:(UIImage *) cityImage
{
    NSString *ubicacionDB = [self obtenerRutaBD];
	
   // NSData *cityData=  UIImagePNGRepresentation (cityImage);
    //NSData *cityData= [[NSData alloc] initWithBytes:cityImage
     //                  city.cityPicture= [UIImage imageWithData:cityData];
    
    
    
    
	if(!(sqlite3_open([ubicacionDB UTF8String], &bd) == SQLITE_OK)){
		NSLog(@"No se puede conectar con la BD");
		return;
	} else {
		NSString *sqlInsert = [NSString stringWithFormat:@"INSERT INTO city (name, description,image) VALUES ('%@', '%@',?)", nombre, description];
		const char *sql = [sqlInsert UTF8String];
		sqlite3_stmt *sqlStatement;
		
		if(sqlite3_prepare_v2(bd, sql, -1, &sqlStatement, NULL) != SQLITE_OK){
			NSLog(@"Problema al preparar el statement");
			return;
		} else {
            NSData *cityData=  UIImagePNGRepresentation (cityImage);
            sqlite3_bind_blob(sqlStatement, 1, [cityData bytes], [cityData length], SQLITE_STATIC);
			if(sqlite3_step(sqlStatement) == SQLITE_DONE){
				sqlite3_finalize(sqlStatement);
				sqlite3_close(bd);
			}
		}
		
	}
    
    
    
}



@end
