function [L, dL] = example_L(x, a, b, lambda, mu)
  [f, df] = example_f(x);
  [g_tild, dg_tild] = example_g_tild(x, a, b, lambda, mu);
  L = f + 0.5 * mu * dot(g_tild, g_tild);
  dL = df + mu * dg_tild' * g_tild;
end