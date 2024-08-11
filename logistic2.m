% Define parameters
r = 3.1; % Given constant

% Define time steps
t = 0:1:50; % Time range for simulation

% Create a VideoWriter object to save the animation
writerObj = VideoWriter('population_animation_scatter_3.1.mp4', 'MPEG-4');
writerObj.FrameRate = 0.7;
open(writerObj);

% Loop to vary the initial population and create frames for the video
for P0 = 0:30
    % Initialize population vectors
    P_i = zeros(1, length(t)-1);
    P_i1 = zeros(1, length(t)-1);
    
    % Set initial population
    P_i(1) = P0;
    delta_P = r * P_i(1) * (1 - P_i(1)/10); % Compute change in population
    P_i1(1) = P_i(1) + delta_P;
    if P_i1(1) <= 0
        P_i1(1) = 0;
    end
    P_i(2)= P_i1(1);
    % Compute population over time using the difference equation
    for i = 2:length(t)-2
        delta_P = r * P_i(i) * (1 - P_i(i)/10); % Compute change in population
        P_i1(i) = P_i(i) + delta_P; % Compute P(i+1)
        
        if P_i1(i) <= 0
            P_i1(i) = 0;
        end
        P_i(i+1) = P_i1(i); % Update P(i) for next iteration
    end
    P_i1(length(t)-1)=P_i(length(t)-1) + r * P_i(length(t)-1) * (1 - P_i(length(t)-1)/10)
    % Plot P(i+1) against P(i)
    scatter(P_i, P_i1, 'LineWidth', 2);
    hold on;
    plot([0 10], [0 10], 'r--'); % Plot the line y=x
    hold off;
    xlim([0 10]);
    ylim([0 10]);
    title(sprintf('Population Scatter Plot (Initial Population: %d)', P0));
    xlabel('P(i)');
    ylabel('P(i+1)');
    grid on;

    % Capture the frame and add it to the video
    frame = getframe(gcf);
    writeVideo(writerObj, frame);
     % Pause to slow down the video (0.5 seconds)
    %pause(0.5);
end

% Close the VideoWriter object
close(writerObj);
