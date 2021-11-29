function newpop = gen_selection(pop,fpop0) 
    totalfit = sum(fpop0);                  
    fpop0 = fpop0 / totalfit;                
    fpop0 = cumsum(fpop0);            
    [px,py] = size(pop);     
    newpop = zeros(px,py);
    ms = sort(rand(px,1));                 
    fitin=1;
    newin=1;
    while newin <= px                          
            if(ms(newin))<fpop0(fitin)
                newpop(newin,:)=pop(fitin,:);
                newin=newin+1;
            else
                fitin=fitin+1;
            end
    end
end