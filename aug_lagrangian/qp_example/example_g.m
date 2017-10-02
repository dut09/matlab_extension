function [ g, dg ] = example_g( x, C )
  g = 0.5 * x' * (C * x) - 10;
  dg = C * x;
end

