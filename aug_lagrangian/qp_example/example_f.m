function [ f, df ] = example_f( x, A, b )
  f = 0.5 * x' * (A * x) + b' * x;
  df = A * x + b;
end

