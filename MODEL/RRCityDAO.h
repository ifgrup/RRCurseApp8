//
//  RRCityDAO.h
//  RRCurseApp8
//
//  Created by formacion on 04/03/14.
//  Copyright (c) 2014 EveronGames. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
@interface RRCityDAO : NSObject
{
    sqlite3 *bd;
    
}

- (NSString *) obtenerRutaBD;
- (NSMutableArray *) obtenerCities;
- (void) deleteCity: (NSInteger) cityID;
- (void) addCity: (NSString *)nombre withDescription:(NSString *) description withImage:(UIImage *) cityImage;
/*
- (void) crearCiudad: (NSString *)nombre ruedas:(NSInteger) ruedas;

- (void) actualizarVehiculo: (NSInteger) vehiculoID nombre:(NSString *)nombre ruedas:(NSInteger) ruedas;
- (void) borrarVehiculo: (NSInteger) vehiculoID;

*/


@end
