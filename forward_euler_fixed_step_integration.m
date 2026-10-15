%Runs numerical integration using forward Euler approximation
%INPUTS:
%rate_func_in: the function used to compute dXdt. rate_func_in will
% have the form: dXdt = rate_func_in(t,X) (t is before X)
%tspan: a two element vector [t_start,t_end] that denotes the integration endpoints
%X0: the vector describing the initial conditions, X(t_start)
%h_ref: the desired value of the average step size (not the actual value)
%OUTPUTS:
%t_list: the vector of times, [t_start;t_1;t_2;...;.t_end] that X is approximated at
%X_list: the vector of X, [X0';X1';X2';...;(X_end)'] at each time step
%h_avg: the average step size
%num_evals: total number of calls made to rate_func_in during the integration
function [t_list,X_list,h_avg, num_evals] = forward_euler_fixed_step_integration(rate_func_in,tspan,X0,h_ref)

N = ceil((tspan(2) - tspan(1))/h_ref);
h = (tspan(2) - tspan(1))/N;

t_list = linspace(tspan(1),tspan(2),N);
X_list = zeros(1, N);
X_list(1) = X0;

num_evals = 0;

    for i = 1:N-1
    [X,evals] = forward_euler_step(rate_func_in,t_list(i),X_list(i),h);
    X_list(i + 1) = X;
    num_evals =+ evals;
    end

h_avg = h;
end




%This function computes the value of X at the next time step
%using the Forward Euler approximation
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
function [XB,num_evals] = forward_euler_step(rate_func_in,t,XA,h)
XB = XA + h*rate_func_in(t,XA);
num_evals = 1;
end



