%Runs fixed step numerical integration
%INPUTS:
%rate_func_in: the function used to compute dXdt. rate_func_in will
% have the form: dXdt = rate_func_in(t,X) (t is before X)
%step_func: the function used to approximate X(t) at the next step
% [XB,num_evals] = step_func(rate_func_in,t,XA,h)
%tspan: a two element vector [t_start,t_end] that denotes the integration endpoints
%X0: the vector describing the initial conditions, X(t_start)
%h_ref: the desired value of the average step size (not the actual value)
%OUTPUTS:
%t_list: the vector of times, [t_start;t_1;t_2;...;.t_end] that X is approximated at
%X_list: the vector of X, [X0';X1';X2';...;(X_end)'] at each time step
%h_avg: the average step size
%num_evals: total number of calls made to rate_func_in during the integration
function [t_list,X_list,h_avg, num_evals] = fixed_step_integration(rate_func_in,tspan,X0,h_ref)

N = ceil((tspan(2) - tspan(1))/h_ref);
h = (tspan(2) - tspan(1))/N;

t_list = linspace(tspan(1),tspan(2),N);
X_list = zeros(1, N);
X_list(1) = X0;

num_evals = 0;

    for i = 1:N-1
    [X ,evals] = backward_euler_step(rate_func_in,t_list(i),X_list(i),h);
    X_list(i + 1) = X;
    num_evals =+ evals;
    end

h_avg = h;
end



%This function computes the value of X at the next time step
%using the Backward Euler approximation
%INPUTS:
%rate_func_in: the function used to compute dXdt. rate_func_in will
% have the form: dXdt = rate_func_in(t,X) (t is before X)
%t: the value of time at the current step
%XA: the value of X(t)
%h: the time increment for a single step i.e. delta_t = t_{n+1} - t_{n}
%OUTPUTS:
%XB: the approximate value for X(t+h) (the next step)
% formula depends on the integration method used
%num_evals: A count of the number of times that you called
% rate_func_in when computing the next step
function [XB,num_evals] = backward_euler_step(rate_func_in,t,XA,h)

G = @(X) XA + h*rate_func_in((t+h),X) - X;
dxtol = 1e-10;
ftol = 1e-14;
max_iter = 200;
dxmax = 1e7;
[XB,~] = multi_newton_solver(G,XA,dxtol,ftol,max_iter,dxmax);
num_evals = 1;
end





% Newton's solver from Assignment 2
function [x, exit_flag, num_evals] = multi_newton_solver(fun,x0,dxtol,ftol,max_iter,dxmax)
    x = x0(:);
    num_evals = 0;
    exit_flag = -1;

    for i = 1:max_iter
        fval = fun(x);
        num_evals = num_evals + 1;

        if norm(fval) < ftol
            exit_flag = 1;
            return
        end

        [J, n] = approximate_jacobian(fun, x, fval);
        num_evals = num_evals + n;

        dx = -J \ fval;        
        x = x + dx;

        if norm(dx) > dxmax
            exit_flag = 0;
            return
        end
        if norm(dx) < dxtol
            exit_flag = 2;
            return
        end
    end
    disp("Newton solver did not converge within tolerance")
end

function [J, num_evals] = approximate_jacobian(fun, x, fval)
    n = length(x);
    J = zeros(length(fval), n);
    num_evals = 0;
    for j = 1:n
        delta = sqrt(eps) * max(1, abs(x(j)));
        xp = x;
        xp(j) = xp(j) + delta;
        J(:,j) = (fun(xp) - fval) / delta;   
        num_evals = num_evals + 1;
    end
end