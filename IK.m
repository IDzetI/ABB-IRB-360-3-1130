function q = IK(x)
    parameters;
    
    q = zeros(1,4);
    q(4) = x(4);
    
    for i = 1:3
        
        x_leg = Rz(angles(i)) * x(1:3);
        x_1 = a;
        z_1 = -c;
        x_0 = x_leg(1) + b;
        z_0 = x_leg(3);

        x_10 = x_1 - x_0;
        z_10 = z_1 - z_0;

        betta = atan2(x_10,z_10);
        q(i) = asin((l^2 - z_10^2 - x_10^2 - r^2)/(2*r*sqrt(x_10^2+z_10^2)))-betta;

    end
end

