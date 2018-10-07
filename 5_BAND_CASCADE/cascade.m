function H = cascade(v)
st_num = length(v)/5;

H = eye(5);
for l=1:st_num
    
    v1 = v(((l-1)*5 + 1) : l*5).';
    H = H * (eye(5) - ((v1*v1')/(v1'*v1))+ lt_poly({1},-5) * ((v1*v1')/(v1'*v1)));
end

end