function [intersections, x, y] = find_intersections(x,line_1,line_2, num)
%FIND_INTERSECTIONS Finds the num of points of intersection for 2 lines

    [x, y] = polyxpoly(x,line_1,x,line_2);
    polys = [x, y];
    %figure(2);
    %plot(polys);
    intersections = polys(end-min(num,length(polys))+1:end);
end

