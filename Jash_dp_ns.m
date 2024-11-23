%initial conditions setup
t0 = 1;
tf = 2;
y0 = [0.05; 0; 0.05; 0];
l2 = 0.1

%single step size solution
h = 0.1;
[t, y] = rk4_solution(t0, tf, y0, h, l2);
fprintf('Approximation at h=0.1 and t=2: y1(2) = %.6f, y2(2) = %.6f\n, y3(2) = %.6f, y4(2) = %.6f\n', y(1, end), y(2, end), y(3, end), y(4, end));

%eroor analysis
steps = [0.1, 0.05, 0.025, 0.0125, 0.00625, 0.003125, 0.0015625, 0.00078125, 0.000390625, 0.0001953125];
errors_y1 = zeros(1, length(steps));
errors_y2 = zeros(1, length(steps));
errors_y3 = zeros(1, length(steps));
errors_y4 = zeros(1, length(steps));

%Approximate true solution(h = 0.001)
h_true = 0.0001;
[t_true, y_true] = rk4_solution(t0, tf, y0, h_true, l2);
y1_true = y_true(1, end);
y2_true = y_true(2, end);
y3_true = y_true(3, end);
y4_true = y_true(4, end);

for j = 1:length(steps)
    h = steps(j);
    [~, y] = rk4_solution(t0, tf, y0, h, l2);
    errors_y1(j) = abs(y(1, end) - y1_true);
    errors_y2(j) = abs(y(2, end) - y2_true);
    errors_y3(j) = abs(y(3, end) - y3_true);
    errors_y4(j) = abs(y(4, end) - y4_true);
end

% Plot errors on a log-log scale
figure;
loglog(steps, errors_y1, '-o', 'DisplayName', 'y1 error');
hold on;
loglog(steps, errors_y2, '-o', 'DisplayName', 'y2 error');
loglog(steps, errors_y3, '-o', 'DisplayName', 'y3 error');
loglog(steps, errors_y4, '-o', 'DisplayName', 'y4 error');
xlabel('Step size (h)');
ylabel('Error');
title('Error Estimation');
legend;
grid on;

%Solution for h = 0.0001
h = 0.0001;
[t, y] = rk4_solution(t0, tf, y0, h, l2);
fprintf('True solution at h = 0.0001 and t=2: y1(2) = %.6f, y2(2) = %.6f\n, y3(2) = %.6f, y4(2) = %.6f\n', y(1, end), y(2, end), y(3, end), y(4, end));


% Plot y1(t) and y2(t)
figure;
plot(t, y(1, :), 'DisplayName', 'y1(t)');
hold on;
plot(t, y(2, :), 'DisplayName', 'y2(t)');
plot(t, y(3, :), 'DisplayName', 'y3(t)');
plot(t, y(4, :), 'DisplayName', 'y4(t)');
xlabel('t');
ylabel('Approximations');
title('Approximations of y1(t), y2(t), y3(t), and y4(t) using h = 0.0001 and \theta_1, \theta_2 = 0.05');
legend;
grid on;
