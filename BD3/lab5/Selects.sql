--Select queries


--Select meta data
select * from USER_SDO_GEOM_METADATA;

--Select indexes
select * from ALL_SDO_INDEX_INFO;

--stdo filter which element can interact, here it is vehicles that are on the road 1
SELECT r.name, v.name
FROM vehicles v, roads r
WHERE r.NAME = 'road1' AND 
SDO_FILTER(v.v_g, r.r_g) = 'TRUE'; 


--Distance between the building and all vehicles
SELECT v.NAME, B.NAME, SDO_GEOM.SDO_DISTANCE(v.v_g,b.b_g,0.0005) AS distance 
FROM vehicles V,buildings B; 

--Distance between the plane and all trees
SELECT v.NAME, t.NAME, SDO_GEOM.SDO_DISTANCE(v.v_g,t.t_g,0.0005) AS distance 
FROM vehicles V,trees t
WHERE v.name='plane1'; 

--any interaction
SELECT v.name,r.name
FROM vehicles v, runways r
WHERE SDO_RELATE(v.v_g, r.rw_g, 'MASK=ANYINTERACT')='TRUE';

--touching vehicles 
SELECT v.name, w.name 
FROM vehicles v, vehicles w
WHERE MDSYS.SDO_TOUCH(v.v_g, w.v_g) = 'TRUE'; 

--touching roads  
SELECT r.name, s.name 
FROM roads r, roads s 
WHERE MDSYS.SDO_TOUCH(r.r_g, s.r_g) = 'TRUE'; 
