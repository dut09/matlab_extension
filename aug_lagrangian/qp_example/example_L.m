function [ L, dL ] = example_L( x, A, b, C, d, lambda_g, mu_g, lambda_h, mu_h )
  [f, df] = example_f(x, A, b);
  [h, dh] = example_h(x, d);
  [g_tild, dg_tild] = example_g_tild(x, C, lambda_g, mu_g);
  L = f + mu_g / 2 * g_tild^2 - lambda_g^2 / 2 / mu_g - lambda_h * h + 0.5 / mu_h * h^2;
  dL = df + mu_g * dg_tild * g_tild - lambda_h * dh + dh / mu_h * h; 
end

