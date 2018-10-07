function y = bb(v)
l = length(v);
y = (eye(l) - ((v*v')/(v'*v))+ lt_poly({1},1) * ((v*v')/(v'*v)));
end