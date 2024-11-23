%initial conditions setup
t0 = 1;
tf = 2;
y0 = [0.05; 0; 0.05; 0];

% Single step size for solution
h = 0.0001;
n = ceil((tf - t0) / h);
l2_values = [0.1; 0.3; 0.5; 0.7];

% Initialize arrays to store final values of y1, y2, y3, and y4 at t = 2 for each l2
y1_final = zeros(length(l2_values), n + 1);
y2_final = zeros(length(l2_values), n + 1);
y3_final = zeros(length(l2_values), n + 1);
y4_final = zeros(length(l2_values), n + 1);

% Loop over each l2 value

[t, y_l1] = rk4_solution(t0, tf, y0, h, l2_values(1));  % Solve the system for this l2
[t, y_l2] = rk4_solution(t0, tf, y0, h, l2_values(2));
[t, y_l3] = rk4_solution(t0, tf, y0, h, l2_values(3));
[t, y_l4] = rk4_solution(t0, tf, y0, h, l2_values(4));

%plot y1(t) for different l2
figure;
plot(t, y_l1(1,:), 'DisplayName', 'l1 = 0.1');
hold on;
plot(t, y_l2(1,:), 'DisplayName', 'l2 = 0.3');
plot(t, y_l3(1,:), 'DisplayName', 'l3 = 0.5');
plot(t, y_l4(1,:), 'DisplayName', 'l4 = 0.7');
xlabel('t');
ylabel('y1 Approximations');
title('approximations of y1 for different l2');
legend;
grid on;

%plot y2(t) for different l2
figure;
plot(t, y_l1(2,:), 'DisplayName', 'l1 = 0.1');
hold on;
plot(t, y_l2(2,:), 'DisplayName', 'l2 = 0.3');
plot(t, y_l3(2,:), 'DisplayName', 'l3 = 0.5');
plot(t, y_l4(2,:), 'DisplayName', 'l4 = 0.7');
xlabel('t');
ylabel('y2 Approximations');
title('approximations of y2 for different l2');
legend;
grid on;

%plot y3(t) for different l2
figure;
plot(t, y_l1(3,:), 'DisplayName', 'l1 = 0.1');
hold on;
plot(t, y_l2(3,:), 'DisplayName', 'l2 = 0.3');
plot(t, y_l3(3,:), 'DisplayName', 'l3 = 0.5');
plot(t, y_l4(3,:), 'DisplayName', 'l4 = 0.7');
xlabel('t');
ylabel('y3 Approximations');
title('approximations of y3 for different l2');
legend;
grid on;

%plot y4(t) for different l2
figure;
plot(t, y_l1(4,:), 'DisplayName', 'l1 = 0.1');
hold on;
plot(t, y_l2(4,:), 'DisplayName', 'l2 = 0.3');
plot(t, y_l3(4,:), 'DisplayName', 'l3 = 0.5');
plot(t, y_l4(4,:), 'DisplayName', 'l4 = 0.7');
xlabel('t');
ylabel('y4 Approximations');
title('approximations of y4 for different l2');
legend;
grid on;
