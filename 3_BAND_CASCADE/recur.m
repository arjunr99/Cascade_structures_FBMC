function y=recur(n_level,filt)
[lp,hp] = wfilters(filt);
wave_len = length(lp);

if(n_level>0)
    y = zeros(((2^n_level)-1)*wave_len-(2^(n_level-1))+1,2^n_level);
    y1 = recur(n_level-1,filt);
    
    for l=1:2^(n_level-1)     
        temp = conv(upsample(y1(:,l),2),lp);
        y(:,2*l-1) = temp(1:((2^n_level)-1)*wave_len-(2^(n_level-1))+1);
        temp = conv(upsample(y1(:,l),2),hp);
        y(:,2*l) = temp(1:((2^n_level)-1)*wave_len-(2^(n_level-1))+1);
    end
    
else
    y=1;
end   
end