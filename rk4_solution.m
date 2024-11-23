% Function to compute RK4 solution for a given step size
function [t, y] = rk4_solution(t0, tf, y0, h, l2)
    n = ceil((tf - t0) / h);
    t = linspace(t0, tf, n + 1);
    y = zeros(4, n + 1);
    y(:, 1) = y0;
    for i = 1:n
        y(:, i + 1) = rk4_step(t(i), y(:, i), h, l2);
    end
end


