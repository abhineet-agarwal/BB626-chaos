% Define parameters
r = 3.1; % Given constant

% Define time steps
t = 0:1:50; % Time range for simulation

% Create a VideoWriter object to save the animation
writerObj = VideoWriter('population_animation_3.1.mp4', 'MPEG-4');
writerObj.FrameRate = 1;
open(writerObj);

% Loop to vary the initial population and create frames for the video
for P0 = 0:50
    % Initialize population vector
    P = zeros(size(t));
    P(1) = P0; % Set initial population

    % Compute population over time using the difference equation
    for i = 2:length(t)
        delta_P = r * P(i-1) * (1 - P(i-1)/10); % Compute change in population
        P(i) = P(i-1) + delta_P;
         if P(i) <= 0
            P(i) = 0;
         end% Update population for next time step
    end

    % Plot population over time
    plot(t, P, 'LineWidth', 2);
    title(sprintf('Population Growth Over Time (Initial Population: %d)', P0));
    xlabel('Time');
    ylabel('Population');
    grid on;

    % Capture the frame and add it to the video
    frame = getframe(gcf);
    writeVideo(writerObj, frame);

    % Pause to slow down the video (0.5 seconds)
   % pause(0.5);
end

% Close the VideoWriter object
close(writerObj);
