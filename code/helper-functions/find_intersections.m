function [intersections] = find_intersections(x,line_1,line_2, num)
%FIND_INTERSECTIONS Finds the num of points of intersection for 2 lines

    polys = polyxpoly(x,line_1,x,line_2);
    intersections = polys(end-min(num,length(polys))+1:end);
end

