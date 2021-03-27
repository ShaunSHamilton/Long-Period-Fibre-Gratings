function [intersections] = find_intersections(x,line_1,line_2)
%FIND_INTERSECTIONS Finds the points of intersection for 2 lines

    intersections = polyxpoly(x,line_1,x,line_2);
end

