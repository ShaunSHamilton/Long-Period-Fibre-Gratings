function [intersections, x, y] = find_intersections(x,line_1,line_2, num)
%FIND_INTERSECTIONS Finds the num of points of intersection for 2 lines

    [x, y] = polyxpoly(x,line_1,x,line_2);
    polys = [x, y];
    %figure(2);
    %plot(polys);
    pol_len = length(polys);
    to_return = pol_len-min(num, pol_len)+1:pol_len;
    intersections = polys(to_return,:);
end

