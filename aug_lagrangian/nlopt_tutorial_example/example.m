clearvars; clc;
% min sqrt(x2)
% s.t. x2 >= 0, x2 >= (a1x1+b1)^3, x2 >= (a2x1+b2)^3
% a1 = 2 b1 = 0 a2 = -1 b2 = 1.

x = [0.5 0.5]';
lambda = [0 0 0]';
mu = 10;
max_iter = 10000;
i = 0;
a = [2, -1];
b = [0, 1];
while i < max_iter
  disp('iter=');
  disp(i);
  i = i + 1;
  % Optimize x.
  [L, dL] = example_L(x, a, b, lambda, mu);
  % Evaluation:
  disp('x=');
  disp(x');
  disp('f=');
  [f, ~] = example_f(x);
  disp(f);
  disp('L=');
  disp(L);
  disp('lambda=');
  disp(lambda');
  % Line search.
  step_size = 0.1;
  while true
    new_x = x - dL * step_size;
    if new_x(2) < 0
      step_size = step_size / 2.0;
      continue;
    end
    [new_L, ~] = example_L(new_x, a, b, lambda, mu);
    if new_L > L
      step_size = step_size / 2.0;
      continue;
    end
    break;
  end
  x = x - dL * step_size;
  if norm(dL) * step_size < 1e-6
    break;
  end
  % Update lambda.
  [g_tild, ~] = example_g_tild(x, a, b, lambda, mu);
  lambda = mu * g_tild;
end
