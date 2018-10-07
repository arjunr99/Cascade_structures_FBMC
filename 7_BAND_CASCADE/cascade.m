function H = cascade(v)
st_num = length(v)/7;

H = eye(7);
for l=1:st_num
    
    v1 = v(((l-1)*7 + 1) : l*7).';
    H = H * (eye(7) - ((v1*v1')/(v1'*v1))+ lt_poly({1},-7) * ((v1*v1')/(v1'*v1)));
end

end