% A function to test and plot euler_fixed_step_integration_test

function forward_euler_fixed_step_integration_test

    rate_func_in = @rate_func01;
    tspan = [0 1.5];
    X0 = cos(tspan(1));
    h_ref_1 = .4;
    h_ref_2 = .25;
    h_ref_3 = .1;
    
    
    
    flag = 4;
    
    if flag == 1       % Forward Euler Method
        [t_list_1,X_list_1,h_avg, num_evals] = forward_euler_fixed_step_integration(rate_func_in,tspan,X0,h_ref_1);
        [t_list_2,X_list_2,h_avg, num_evals] = forward_euler_fixed_step_integration(rate_func_in,tspan,X0,h_ref_2);
        [t_list_3,X_list_3,h_avg, num_evals] = forward_euler_fixed_step_integration(rate_func_in,tspan,X0,h_ref_3);
    elseif flag == 2   % Explicit Midpoint Method
        [t_list_1,X_list_1,h_avg, num_evals] = explicit_midpoint_fixed_step_integration(rate_func_in,tspan,X0,h_ref_1);
        [t_list_2,X_list_2,h_avg, num_evals] = explicit_midpoint_fixed_step_integration(rate_func_in,tspan,X0,h_ref_2);
        [t_list_3,X_list_3,h_avg, num_evals] = explicit_midpoint_fixed_step_integration(rate_func_in,tspan,X0,h_ref_3);
    elseif flag == 3   % Fixed-Step Integration Method
        [t_list_1,X_list_1,h_avg, num_evals] = fixed_step_integration(rate_func_in,tspan,X0,h_ref_1);
        [t_list_2,X_list_2,h_avg, num_evals] = fixed_step_integration(rate_func_in,tspan,X0,h_ref_2);
        [t_list_3,X_list_3,h_avg, num_evals] = fixed_step_integration(rate_func_in,tspan,X0,h_ref_3);
    else               % Implicit Midpoint Method
        [t_list_1,X_list_1,h_avg, num_evals] = fixed_step_integration_midpoint_method(rate_func_in,tspan,X0,h_ref_1);
        [t_list_2,X_list_2,h_avg, num_evals] = fixed_step_integration_midpoint_method(rate_func_in,tspan,X0,h_ref_2);
        [t_list_3,X_list_3,h_avg, num_evals] = fixed_step_integration_midpoint_method(rate_func_in,tspan,X0,h_ref_3);
    end
    
    
    
    analyical_t_list = linspace(tspan(1), tspan(2), 1000);
    analyical_X_list = cos(analyical_t_list);

    figure();
    hold on;

    label_1 = sprintf('$h_{\\mathrm{ref}} = %g$', h_ref_1);
    label_2 = sprintf('$h_{\\mathrm{ref}} = %g$', h_ref_2);
    label_3 = sprintf('$h_{\\mathrm{ref}} = %g$', h_ref_3);
    
    if flag == 1   % Forward Euler Method
        plot(analyical_t_list, analyical_X_list, 'k-', 'LineWidth', 1.8, 'DisplayName', 'Analytical Solution');
        plot(t_list_1, X_list_1, 'o-', 'LineWidth', 1.2, 'DisplayName', label_1);
        plot(t_list_2, X_list_2, 's-', 'LineWidth', 1.2, 'DisplayName', label_2);
        plot(t_list_3, X_list_3, '^-', 'LineWidth', 1.2, 'DisplayName', label_3);
        title('Forward Euler Method: Numerical Integration', 'Interpreter', 'latex');
    
        xlabel('$t$', 'Interpreter', 'latex');
        ylabel('$X(t)$', 'Interpreter', 'latex');
    
        set(gca, 'FontSize', 12, 'FontName', 'Cambria');
        legend('Interpreter', 'latex', 'Location', 'best');
        grid on;
        box on;

        xlim([(t_list_1(1) - .1) (t_list_1(end) + .1)])
        ylim([0 (X_list_1(1) + .1)])
    
        myfig = gcf();
        exportgraphics(myfig, 'Forward-Euler-Method.png', 'Resolution', 600);

    elseif flag == 2   % Explicit Midpoint Method
        plot(analyical_t_list, analyical_X_list, 'k-', 'LineWidth', 1.8, 'DisplayName', 'Analytical Solution');
        plot(t_list_1, X_list_1, 'o-', 'LineWidth', 1.2, 'DisplayName', label_1);
        plot(t_list_2, X_list_2, 's-', 'LineWidth', 1.2, 'DisplayName', label_2);
        plot(t_list_3, X_list_3, '^-','LineWidth', 1.2, 'DisplayName', label_3);
     
        title('Explicit Midpoint Method: Numerical Integration', 'Interpreter', 'latex');
        xlabel('$t$', 'Interpreter', 'latex');
        ylabel('$X(t)$', 'Interpreter', 'latex');
    
        set(gca, 'FontSize', 12, 'FontName', 'Cambria');
        legend('Interpreter', 'latex', 'Location', 'best');
        grid on;
        box on;
        xlim([(t_list_1(1) - .1) (t_list_1(end) + .1)])
        ylim([0 (X_list_1(1) + .1)])
    
        myfig = gcf();
        exportgraphics(myfig, 'Explicit-Midpoint-Method.png', 'Resolution', 600);

    elseif flag == 3   % Fixed-Step Integration Method
        plot(analyical_t_list, analyical_X_list, 'k-', 'LineWidth', 1.8, 'DisplayName', 'Analytical Solution');
        plot(t_list_1, X_list_1, 'o-', 'LineWidth', 1.2, 'DisplayName', label_1);
        plot(t_list_2, X_list_2, 's-', 'LineWidth', 1.2, 'DisplayName', label_2);
        plot(t_list_3, X_list_3, '^-', 'LineWidth', 1.2, 'DisplayName', label_3);

        title('Fixed-Step Method: Numerical Integration', 'Interpreter', 'latex');
        xlabel('$t$', 'Interpreter', 'latex');
        ylabel('$X(t)$', 'Interpreter', 'latex');
    
        set(gca, 'FontSize', 12, 'FontName', 'Cambria');
        legend('Interpreter', 'latex', 'Location', 'best');
        grid on;
        box on;
        xlim([(t_list_1(1) - .1) (t_list_1(end) + .1)])
        ylim([0 (X_list_1(1) + .1)])

        myfig = gcf();
        exportgraphics(myfig, 'Fixed-Step-Method.png', 'Resolution', 600);\

    else   % Implicit Midpoint Method
        plot(analyical_t_list, analyical_X_list, 'k-', 'LineWidth', 1.8, 'DisplayName', 'Analytical Solution');
        plot(t_list_1, X_list_1, 'o-', 'LineWidth', 1.2, 'DisplayName', label_1);
        plot(t_list_2, X_list_2, 's-', 'LineWidth', 1.2, 'DisplayName', label_2);
        plot(t_list_3, X_list_3, '^-', 'LineWidth', 1.2, 'DisplayName', label_3);
    
        title('Implicit Midpoint Method: Numerical Integration', 'Interpreter', 'latex');
        xlabel('$t$', 'Interpreter', 'latex');
        ylabel('$X(t)$', 'Interpreter', 'latex');
    
        set(gca, 'FontSize', 12, 'FontName', 'Cambria');
        legend('Interpreter', 'latex', 'Location', 'best');
        grid on;
        box on;
        xlim([(t_list_1(1) - .1) (t_list_1(end) + .1)])
        ylim([0 (X_list_1(1) + .1)])

        myfig = gcf();
        exportgraphics(myfig, 'Implicit-Midpoint-Method.png', 'Resolution', 600);

    end
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