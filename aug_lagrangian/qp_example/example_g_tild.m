function [ g_tild, dg_tild ] = example_g_tild( x, C, lambda_g, mu_g )
  [g, dg] = example_g(x, C);
  g_tild = max(g + lambda_g / mu_g, 0);
  dg_tild = dg;
  dg_tild(g_tild < 0) = 0;
end

