function [f, df] = example_f(x)
  x2 = x(2);
  f = sqrt(x2);
  df = [0; 0.5 / sqrt(x2)];
end