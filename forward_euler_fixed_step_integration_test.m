% A function to test and plot euler_fixed_step_integration_test

function forward_euler_fixed_step_integration_test

rate_func_in = @rate_func01;
tspan = [0 1.5];
X0 = cos(tspan(1));
h_ref_1 = .4;
h_ref_2 = .2;
h_ref_3 = .1;

% % Forward Euler Method
% [t_list_1,X_list_1,h_avg, num_evals] = forward_euler_fixed_step_integration(rate_func_in,tspan,X0,h_ref_1);
% [t_list_2,X_list_2,h_avg, num_evals] = forward_euler_fixed_step_integration(rate_func_in,tspan,X0,h_ref_2);
% [t_list_3,X_list_3,h_avg, num_evals] = forward_euler_fixed_step_integration(rate_func_in,tspan,X0,h_ref_3);

% % Explicit Midpoint Method
% [t_list_1,X_list_1,h_avg, num_evals] = explicit_midpoint_fixed_step_integration(rate_func_in,tspan,X0,h_ref_1);
% [t_list_2,X_list_2,h_avg, num_evals] = explicit_midpoint_fixed_step_integration(rate_func_in,tspan,X0,h_ref_2);
% [t_list_3,X_list_3,h_avg, num_evals] = explicit_midpoint_fixed_step_integration(rate_func_in,tspan,X0,h_ref_3);

% % Backward Euler Method
% [t_list_1,X_list_1,h_avg, num_evals] = fixed_step_integration(rate_func_in,tspan,X0,h_ref_1);
% [t_list_2,X_list_2,h_avg, num_evals] = fixed_step_integration(rate_func_in,tspan,X0,h_ref_2);
% [t_list_3,X_list_3,h_avg, num_evals] = fixed_step_integration(rate_func_in,tspan,X0,h_ref_3);

% % Implicit Midpoint Method
% [t_list_1,X_list_1,h_avg, num_evals] = fixed_step_integration_midpoint_method(rate_func_in,tspan,X0,h_ref_1);
% [t_list_2,X_list_2,h_avg, num_evals] = fixed_step_integration_midpoint_method(rate_func_in,tspan,X0,h_ref_2);
% [t_list_3,X_list_3,h_avg, num_evals] = fixed_step_integration_midpoint_method(rate_func_in,tspan,X0,h_ref_3);






analyical_t_list = linspace(tspan(1),tspan(2),1000);
analyical_X_list = cos(analyical_t_list);


figure();
hold on;
plot(analyical_t_list,analyical_X_list,'DisplayName','Analytical Solution');


plot(t_list_1,X_list_1,'DisplayName','h_ref = .5');
plot(t_list_2,X_list_2,'DisplayName','h_ref = .2');
plot(t_list_3,X_list_3,'DisplayName','h_ref = .1');

title('Forward Euler Example Intergration Plot')
xlabel('Time(t)');
ylabel('X(t)');
set(gca,'FontSize',12,'Fontname','Cambria');
legend();





end



function dXdt = rate_func01(t,X)
dXdt = -5*X + 5*cos(t) - sin(t);
end
function X = solution01(t)
X = cos(t);
end


function dXdt = rate_func02(t,X)
dXdt = [0,-1;1,0]*X;
end
function X = solution02(t)
X = [cos(t);sin(t)];
end