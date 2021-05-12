function [intersections, x, y] = find_intersections(x,line_1,line_2, num)
%FIND_INTERSECTIONS Finds the num of points of intersection for 2 lines

    % Handle NaN values
    if isnan(line_1(1)) || isnan(line_2(1))
        line_1 = line_1(2:end);
        line_2 = line_2(2:end);
        x = x(2:end);
    end
    [x, y] = polyxpoly(x,line_1,x,line_2, 'unique');
    polys = [x, y];
    %figure(2);
    %plot(polys);
    pol_len = length(polys);
    to_return = pol_len-min(num, pol_len)+1:pol_len;
    intersections = padarray(polys(to_return,:),num-length(to_return),'post');
end

