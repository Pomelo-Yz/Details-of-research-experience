function newpop = gen_mutation(pop,pm)
    [px,py] = size(pop);
    newpop = pop;
    for i=1:px
        if(rand<pm)
            mpoint = ceil(rand * py);     
            newpop(i, mpoint) = 1 - newpop(i, mpoint);
        end
    end
end