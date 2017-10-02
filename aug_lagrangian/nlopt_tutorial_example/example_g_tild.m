function [ g_tild, dg_tild ] = example_g_tild( x, a, b, lambda, mu )
  [g, dg] = example_g(x, a, b);
  g_tild = max(g + lambda / mu, 0);
  dg_tild = dg;
  dg_tild(g_tild < 0, :) = 0;
end

