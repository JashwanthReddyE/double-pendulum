% Function to compute RK4 step
function y_next = rk4_step(t_i, y_i, h, l2)
	  f = @(t,x) myderiv(t,x,l2);
    k1 = h * f(t_i, y_i);
    k2 = h * f(t_i + h/2, y_i + k1/2);
    k3 = h * f(t_i + h/2, y_i + k2/2);
    k4 = h * f(t_i + h, y_i + k3);
    y_next = y_i + (k1 + 2*k2 + 2*k3 + k4) / 6;
end
