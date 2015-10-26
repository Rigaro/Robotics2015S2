function q = veclin(q0, qf, n)

%linspace but for a vector

for i = 1:length(q0)
  q(:, i) = linspace(q0(i), qf(i), n);
end
