% x(2) is natural frequency in rad/sec
% x(1) is damping ratio

function F = calculate_freq(x)
F = [x(1)*x(2) - 0.2;
     x(1)*sqrt(1-(x(2)*x(2)))];
end