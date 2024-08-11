% Define parameters
r = 2.2; % Given constant
P0 =2;  % Initial population

% Define time steps
t = 0:1:50; % Time range for simulation

% Initialize population vector
P = zeros(size(t));
P(1) = P0; % Set initial population

% Compute population over time using the difference equation
for i = 2:length(t)
    delta_P = r * P(i-1) * (1 - P(i-1)/10); % Compute change in population
    P(i) = P(i-1) + delta_P;
    if P(i) <= 0
        P(i) = 0;
    end % Update population for next time step
end

% Plot population over time
plot(t, P, 'LineWidth', 2);
title('Population Growth Over Time');
xlabel('Time');
ylabel('Population');
grid on;
