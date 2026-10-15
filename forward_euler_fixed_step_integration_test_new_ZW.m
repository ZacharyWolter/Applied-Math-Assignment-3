% A function to test and plot euler_fixed_step_integration_test

function forward_euler_fixed_step_integration_test_new_ZW

    rate_func_in = @rate_func01;
    tspan = [0 1.5];
    X0 = cos(tspan(1));
    h_ref_1 = .4;
    h_ref_2 = .25;
    h_ref_3 = .1;
    
    
    
    flag = 5;
    
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
    elseif flag == 4   % Implicit Midpoint Method
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
        exportgraphics(myfig, 'Fixed-Step-Method.png', 'Resolution', 600);

    elseif flag == 4   % Implicit Midpoint Method
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
        
    % Stability
    h_refs = [0.38; .45];
    tspan = [0 20];
    X0 = 1;
    rate_func_in = @rate_func01;
    analytical_t_list = linspace(tspan(1),tspan(2),2000);   % typo fixed
    analytical_X_list = cos(analytical_t_list);

    for i = 1:length(h_refs)

        h_ref = h_refs(i);

        [t_list_1,X_list_1,~,~] = forward_euler_fixed_step_integration(rate_func_in,tspan,X0,h_ref);
        [t_list_2,X_list_2,~,~] = fixed_step_integration(rate_func_in,tspan,X0,h_ref);
        [t_list_3,X_list_3,~,~] = explicit_midpoint_fixed_step_integration(rate_func_in,tspan,X0,h_ref);
        [t_list_4,X_list_4,~,~] = fixed_step_integration_midpoint_method(rate_func_in,tspan,X0,h_ref);

        t_lists = {t_list_1,t_list_2,t_list_3,t_list_4};
        X_lists = {X_list_1,X_list_2,X_list_3,X_list_4};

        method_names = {'Forward Euler','Backward Euler','Explicit Midpoint','Implicit Midpoint'};

        figure('Color','w','Position',[100 50 1000 1300]);
        tl = tiledlayout(4,1,'TileSpacing','normal','Padding','compact');

        for i = 1:4
            ax = nexttile(tl); hold on;
            h1 = plot(analytical_t_list, analytical_X_list, 'k-', 'LineWidth', 3, 'DisplayName','Analytical Solution');
            h2 = plot(t_lists{i}, X_lists{i}, 'LineWidth', 2, 'DisplayName','Numerical Solution');

            set(ax, 'FontSize',14 , 'TickLabelInterpreter','latex');
            grid on;
            xlim(tspan);
            ylim([-1.1 1.1]);

            title(method_names{i}, 'Interpreter','latex', 'FontSize',16);
            xlabel('$t$', 'Interpreter','latex', 'FontSize',15);
            ylabel('$X(t)$', 'Interpreter','latex', 'FontSize',15);
            hold off;

            if i == 1
                axLeg = ax;
                hLeg  = [h1 h2];
            end
        end

        lgd = legend(axLeg, hLeg, 'Interpreter','latex', 'FontSize',13);
        lgd.Layout.Tile = 'east';

        title(tl, sprintf('Stability Comparison of Explicit and Implicit Methods ($h_{\\mathrm{ref}} = %g$)', h_ref), 'Interpreter','latex', 'FontSize',18);

        myfig = gcf();
        exportgraphics(myfig, sprintf('Stability_Comparison_%d.png', round(h_ref*100)), 'Resolution', 600);
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