A = [0.18 0.05; 0.05 0.08];
b = [0.21 0.4]';
C = [0.18 0.12; 0.12 0.13];
d = [-0.47 0.24]';
cvx_begin
  variables x(2)
  minimize 0.5 * quad_form(x, A) + dot(b, x)
  subject to
    0.5 * quad_form(x, C) <= 10
    d' * x == 5
cvx_end
% Analytical solution:
% x = [-7.7623 5.6321].
% f = 5.1285.

% Augmented Lagrangian.
% min 0.5 * x' * A * x + b * x.
% s.t. 0.5 * x' * C * x <= 10.
%      d * x = 5.
x = zeros(2, 1);
lambda_g = 0;
lambda_h = 0;
mu_g = 10;
mu_h = 10;
i = 0;
max_iter = 1000;
while i < max_iter
  disp('i=');
  disp(i);
  i = i + 1;
  % Optimize x.
  [L, dL] = example_L(x, A, b, C, d, lambda_g, mu_g, lambda_h, mu_h);
  disp('x=');
  disp(x');
  disp('L=');
  disp(L);
  disp('f=');
  f = example_f(x, A, b);
  disp(f);
  step_size = 1.0;
  while true
    new_x = x - step_size * dL;
    [new_L, ~] = example_L(new_x, A, b, C, d, lambda_g, mu_g, lambda_h, mu_h);
    if new_L < L
      break;
    end
    step_size = step_size / 2.0;
  end
  disp('step size=');
  disp(step_size);
  if step_size * norm(dL) < 1e-6
    break;
  end
  x = x - step_size * dL;
  [new_L, ~] = example_L(x, A, b, C, d, lambda_g, mu_g, lambda_h, mu_h);
  disp('new L=');
  disp(new_L);
  % Update lambda.
  [g_tild, ~] = example_g_tild(x, C, lambda_g, mu_g);
  lambda_g = mu_g * g_tild;
  [h, ~] = example_h(x, d);
  lambda_h = lambda_h - h / mu_h;
end