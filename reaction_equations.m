% Define the ODE system
function dydt = reaction_equations(t, y, alpha, gamma)
 dydt = zeros(3,1);
dydt(1) = alpha*x*(1-x/k)-gamma*x;
end