-module(cau17).
-import(lists,[usort/1, append/2]).
-export([ghep/2]).

ghep(A, B) -> 
	C = append(A, B),
	usort(C).