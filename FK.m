function x = FK(q)
    parameters;
    
    x_1_o = [a 0 -c];
    x_2_o = [cos(2/3*pi)*a sin(2/3*pi)*a -c];
    x_3_o = [cos(-2/3*pi)*a sin(-2/3*pi)*a -c];

    x_1_r = x_1_o + [r * cos(q(1)) 0 r*sin(q(1))];
    x_2_r = x_2_o + [cos(2/3*pi)*(r*cos(q(2))) sin(2/3*pi)*(r*cos(q(2))) r*sin(q(2))];
    x_3_r = x_3_o + [cos(-2/3*pi)*(r*cos(q(3))) sin(-2/3*pi)*(r*cos(q(3))) r*sin(q(3))];

    x_1 = x_1_r(1) - b; 
    y_1 = x_1_r(2); 
    z_1 = x_1_r(3);
    
    x_2 = x_2_r(1) - b*cos(2/3*pi); 
    y_2 = x_2_r(2) - b*sin(2/3*pi); 
    z_2 = x_2_r(3);
    
    x_3 = x_3_r(1) - b*cos(-2/3*pi); 
    y_3 = x_3_r(2) - b*sin(-2/3*pi); 
    z_3 = x_3_r(3);

    syms x y z 
    eqns = [
        l^2 == (x-x_1)^2 + (y-y_1)^2 + (z-z_1)^2,
        l^2 == (x-x_2)^2 + (y-y_2)^2 + (z-z_2)^2,
        l^2 == (x-x_3)^2 + (y-y_3)^2 + (z-z_3)^2 ];
    S = solve(eqns, [x,y,z]);

    if S.z(1)> S.z(2)
        i = 2;
    else
        i = 1;
    end

    x = [double(S.x(i)) double(S.y(i)) double(S.z(i)) q(4)];
end

