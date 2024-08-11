

% Constants
k_plus = 0.005;
k_minus = 0.00001;

% Values of Y0
y0_values = [0.5, 1, 2, 4, 6, 8];

% Initial condition for X
xo = 4;

% Preallocate array to store steady-state values of Z
steady_state_Z = zeros(size(y0_values));

% Solve the ODEs for each value of Y0
for i = 1:length(y0_values)
    % Initial condition for Y
    yo = y0_values(i);
    initial_state = [xo; yo; 0]; % Initial concentration of Z is 0
    
    % Solve the ODEs
    [t, y] = ode45(@(t,y) reaction_equations(t, y, k_plus, k_minus), [0, 100], initial_state);
    
    % Steady-state value of Z is the final value in the solution
    steady_state_Z(i) = y(end, 3);
end

% Plot steady-state values of Z vs X
plot(y0_values, steady_state_Z, 'bo-', 'LineWidth', 2);
xlabel('Initial concentration of Y (Y0)');
ylabel('Steady-state concentration of Z');
title('Steady-state values of Z vs Initial concentration of Y (Y0)');
grid on;
% Define the ODE system
function dydt = reaction_equations(t, y, k_plus, k_minus)
    dydt = zeros(3,1);
    dydt(1) = -k_plus*y(1)*y(2) + k_minus*y(3);
    dydt(2) = -k_plus*y(1)*y(2) + k_minus*y(3);
    dydt(3) = k_plus*y(1)*y(2) - k_minus*y(3);
end