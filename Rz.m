function t = Rz(a)
    t = eye(3);
    t(1,1) = cos(a);  t(1,2) = -sin(a);
    t(2,1) = -t(1,2); t(2,2) = t(1,1);
end

