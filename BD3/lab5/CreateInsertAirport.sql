drop table roads;
drop sequence roads_seq;
delete from USER_SDO_GEOM_METADATA a where a.COLUMN_NAME='R_G';

--Layer 1 : roads
CREATE TABLE roads (
  id NUMBER,
  name VARCHAR2(50),
  r_g SDO_GEOMETRY );
  
create sequence roads_seq;
  
INSERT INTO roads (id, name, r_g) VALUES (roads_seq.nextval, 'road1',sdo_geometry (2003, null, null, 
  sdo_elem_info_array (1,1003,3), 
  sdo_ordinate_array (15,0, 19,30)));
INSERT INTO roads (id, name, r_g) VALUES (roads_seq.nextval, 'road2',sdo_geometry (2003, null, null, 
  sdo_elem_info_array (1,1003,3), 
  sdo_ordinate_array (0,10, 15,15)));
  
drop table buildings;
drop sequence buildings_seq;
delete from USER_SDO_GEOM_METADATA a where a.COLUMN_NAME='B_G';

--Layer 2 : buildings
CREATE TABLE buildings (
  id NUMBER,
  name VARCHAR2(50),
  b_g SDO_GEOMETRY );
  
create sequence buildings_seq;
  
INSERT INTO buildings (id, name, b_g) VALUES (buildings_seq.nextval, 'building1',sdo_geometry (2003, null, null, 
  sdo_elem_info_array (1,1003,3), 
  sdo_ordinate_array (2,18, 14,27)));
  
  
drop table trees;
drop sequence trees_seq;
delete from USER_SDO_GEOM_METADATA a where a.COLUMN_NAME='T_G';
  
--Layer 3 : trees
CREATE TABLE trees (
  id NUMBER,
  name VARCHAR2(50),
  t_g SDO_GEOMETRY );
  
create sequence trees_seq;
  
INSERT INTO trees (id, name, t_g) VALUES (trees_seq.nextval, 'tree1',sdo_geometry (2003, null, null, 
  sdo_elem_info_array (1,1003,4), 
  sdo_ordinate_array (3,17, 4,16, 3,15)));
INSERT INTO trees (id, name, t_g) VALUES (trees_seq.nextval, 'tree2',sdo_geometry (2003, null, null, 
  sdo_elem_info_array (1,1003,4), 
  sdo_ordinate_array (8,17, 9,16, 8,15)));
INSERT INTO trees (id, name, t_g) VALUES (trees_seq.nextval, 'tree3',sdo_geometry (2003, null, null, 
  sdo_elem_info_array (1,1003,4), 
  sdo_ordinate_array (13,17, 14,16, 13,15)));
INSERT INTO trees (id, name, t_g) VALUES (trees_seq.nextval, 'tree4',sdo_geometry (2003, null, null, 
  sdo_elem_info_array (1,1003,4), 
  sdo_ordinate_array (3,10, 4,9, 3,8)));
INSERT INTO trees (id, name, t_g) VALUES (trees_seq.nextval, 'tree5',sdo_geometry (2003, null, null, 
  sdo_elem_info_array (1,1003,4), 
  sdo_ordinate_array (8,10, 9,9, 8,8)));
INSERT INTO trees (id, name, t_g) VALUES (trees_seq.nextval, 'tree6',sdo_geometry (2003, null, null, 
  sdo_elem_info_array (1,1003,4), 
  sdo_ordinate_array (13,10, 14,9, 13,8)));
INSERT INTO trees (id, name, t_g) VALUES (trees_seq.nextval, 'tree7',sdo_geometry (2003, null, null, 
  sdo_elem_info_array (1,1003,4), 
  sdo_ordinate_array (13,5, 14,4, 13,3)));
INSERT INTO trees (id, name, t_g) VALUES (trees_seq.nextval, 'tree8',sdo_geometry (2003, null, null, 
  sdo_elem_info_array (1,1003,4), 
  sdo_ordinate_array (20,5, 21,4, 20,3)));
INSERT INTO trees (id, name, t_g) VALUES (trees_seq.nextval, 'tree9',sdo_geometry (2003, null, null, 
  sdo_elem_info_array (1,1003,4), 
  sdo_ordinate_array (20,10, 21,9, 20,8)));
INSERT INTO trees (id, name, t_g) VALUES (trees_seq.nextval, 'tree10',sdo_geometry (2003, null, null, 
  sdo_elem_info_array (1,1003,4), 
  sdo_ordinate_array (20,15, 21,14, 20,13)));
INSERT INTO trees (id, name, t_g) VALUES (trees_seq.nextval, 'tree11',sdo_geometry (2003, null, null, 
  sdo_elem_info_array (1,1003,4), 
  sdo_ordinate_array (20,20, 21,19, 20,18)));
INSERT INTO trees (id, name, t_g) VALUES (trees_seq.nextval, 'tree12',sdo_geometry (2003, null, null, 
  sdo_elem_info_array (1,1003,4), 
  sdo_ordinate_array (20,25, 21,24, 20,23)));
INSERT INTO trees (id, name, t_g) VALUES (trees_seq.nextval, 'tree13',sdo_geometry (2003, null, null, 
  sdo_elem_info_array (1,1003,4), 
  sdo_ordinate_array (20,30, 21,29, 20,28)));

drop table runways;
drop sequence runways_seq;
delete from USER_SDO_GEOM_METADATA a where a.COLUMN_NAME='RW_G';

--Layer 4 : runways
CREATE TABLE runways (
  id NUMBER,
  name VARCHAR2(50),
  rw_g SDO_GEOMETRY );
  
create sequence runways_seq;
INSERT INTO runways (id, name, rw_g) VALUES (runways_seq.nextval, 'runway1',sdo_geometry (2003, null, null, 
  sdo_elem_info_array (1,1005,2, 1,2,1, 7,2,2), 
  sdo_ordinate_array (1,5.5, 1,0, 12,0, 12,5.5, 6,8, 1,5.5)));

drop table vehicles;
drop sequence vehicles_seq;
delete from USER_SDO_GEOM_METADATA a where a.COLUMN_NAME='V_G';

--Layer 5 : vehicles
CREATE TABLE vehicles (
  id NUMBER,
  name VARCHAR2(50),
  v_g SDO_GEOMETRY );
  
create sequence vehicles_seq;
  
INSERT INTO vehicles (id, name, v_g) VALUES (vehicles_seq.nextval, 'car1',sdo_geometry (2003, null, null, 
  sdo_elem_info_array (1,1003,1), 
  sdo_ordinate_array (17,4, 18,4, 18,7, 17,7, 17,4)));
  
INSERT INTO vehicles (id, name, v_g) VALUES (vehicles_seq.nextval, 'car2',sdo_geometry (2003, null, null, 
  sdo_elem_info_array (1,1003,1), 
  sdo_ordinate_array (16,7, 17,7, 17,10, 16,10, 16,7)));
  
INSERT INTO vehicles (id, name, v_g) VALUES (vehicles_seq.nextval, 'car3',sdo_geometry (2003, null, null, 
  sdo_elem_info_array (1,1003,1), 
  sdo_ordinate_array (16,17, 17,17, 17,20, 16,20, 16,17)));
  
INSERT INTO vehicles (id, name, v_g) VALUES (vehicles_seq.nextval, 'car4',sdo_geometry (2003, null, null, 
  sdo_elem_info_array (1,1003,1), 
  sdo_ordinate_array (3,13, 6,13, 6,14, 3,14, 3,13)));
  
INSERT INTO vehicles (id, name, v_g) VALUES (vehicles_seq.nextval, 'plane1',sdo_geometry (2003, null, null, 
  sdo_elem_info_array (1,1003,1), 
  sdo_ordinate_array (2,3, 2,2, 5,2, 5,1, 6,1, 6,2, 9,2, 9,3, 6,3, 6,5, 5,5, 5,3,2,3)));
  

--Metadata
INSERT  INTO  USER_SDO_GEOM_METADATA(TABLE_NAME, COLUMN_NAME, DIMINFO, SRID)  
  VALUES('roads', 'r_g',MDSYS.SDO_DIM_ARRAY(
  MDSYS.SDO_DIM_ELEMENT('X', 0, 30, 1),
  MDSYS.SDO_DIM_ELEMENT('Y', 0, 30, 1)), 
  NULL);
  
INSERT  INTO  USER_SDO_GEOM_METADATA(TABLE_NAME, COLUMN_NAME, DIMINFO, SRID)  
  VALUES('buildings', 'b_g',MDSYS.SDO_DIM_ARRAY(
  MDSYS.SDO_DIM_ELEMENT('X', 0, 30, 1),
  MDSYS.SDO_DIM_ELEMENT('Y', 0, 30, 1)), 
  NULL);
  
INSERT  INTO  USER_SDO_GEOM_METADATA(TABLE_NAME, COLUMN_NAME, DIMINFO, SRID)  
  VALUES('trees', 't_g',MDSYS.SDO_DIM_ARRAY(
  MDSYS.SDO_DIM_ELEMENT('X', 0, 30, 1),
  MDSYS.SDO_DIM_ELEMENT('Y', 0, 30, 1)), 
  NULL);
  
INSERT  INTO  USER_SDO_GEOM_METADATA(TABLE_NAME, COLUMN_NAME, DIMINFO, SRID)  
  VALUES('runways', 'rw_g',MDSYS.SDO_DIM_ARRAY(
  MDSYS.SDO_DIM_ELEMENT('X', 0, 30, 1),
  MDSYS.SDO_DIM_ELEMENT('Y', 0, 30, 1)), 
  NULL);
  
INSERT  INTO  USER_SDO_GEOM_METADATA(TABLE_NAME, COLUMN_NAME, DIMINFO, SRID)  
  VALUES('vehicles', 'v_g',MDSYS.SDO_DIM_ARRAY(
  MDSYS.SDO_DIM_ELEMENT('X', 0, 30, 1),
  MDSYS.SDO_DIM_ELEMENT('Y', 0, 30, 1)), 
  NULL);
  
--Indexes
create index IND_buildings on buildings(b_g) indextype is  MDSYS.SPATIAL_INDEX;
create index IND_trees on trees(t_g) indextype is  MDSYS.SPATIAL_INDEX;
create index IND_runways on runways(rw_g) indextype is  MDSYS.SPATIAL_INDEX;
create index IND_vehicles on vehicles(v_g) indextype is  MDSYS.SPATIAL_INDEX;
create index IND_roads on roads(r_g) indextype is  MDSYS.SPATIAL_INDEX;
