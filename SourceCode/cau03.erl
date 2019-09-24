-module(cau03). 
-export([areaC/1,areaT/1,area/2]). 

 areaC(R) -> R*R*3.14.

 areaT(A) ->
 	math:sqrt(1.5*A*0.5*A*0.5*A*0.5*A).	

 area(A,R) -> 0.5*areaC(R) + 3*areaT(A).

 