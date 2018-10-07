function H = cascade(v)
st_num = length(v)/3;

H = eye(3);
for l=1:st_num
    
    v1 = v(((l-1)*3 + 1) : l*3).';
    H = H * (eye(3) - ((v1*v1')/(v1'*v1))+ lt_poly({1},-3) * ((v1*v1')/(v1'*v1)));
end

end