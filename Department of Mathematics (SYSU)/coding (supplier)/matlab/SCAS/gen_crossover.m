function newpop = gen_crossover(pop,pc)          
    [px,py] = size(pop);
    newpop = zeros(px,py);
    for i = 1:2:px-1                                             
            if(rand < pc)
                cpoint = floor(rand * py);
                newpop(i,:) = [pop(i,1:cpoint),pop(i+1,cpoint+1:py)];
                newpop(i+1,:) = [pop(i+1,1:cpoint),pop(i,cpoint+1:py)];
            else
                newpop(i,:) = pop(i,:);
                newpop(i+1,:) = pop(i+1,:);
            end
    end
end