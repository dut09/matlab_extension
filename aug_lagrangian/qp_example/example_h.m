function [ h, dh ] = example_h( x, d )
  h = d' * x - 5;
  dh = d;
end

