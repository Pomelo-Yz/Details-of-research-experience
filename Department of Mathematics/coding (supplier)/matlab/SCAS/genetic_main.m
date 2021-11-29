clc
clear all
tic
n = 60;
pc = 0.6;
pm = 0.2;
t = 5;
rng default
pop0 = randi([0,1],n,10);
every_best = zeros(t,10 + 1);
% fitness([1,0,1,1,0,0,0,0,1,1])
% fitness([1,0,0,0,0,1,1,0,1,0])
fid=fopen('result60_6_2_5.txt','w');
for j = 1:t
    fpop0 = zeros(1,n);
    parfor i = 1:n
        fpop0(1,i) = -fitness(pop0(i,:));
    end
    [every_best(j, 10+1),ind] = max(fpop0);
    every_best(j,1:end-1) = pop0(ind,:);
    newpop = gen_selection(pop0,fpop0);
    newpop = gen_crossover(newpop,pc);
    newpop = gen_mutation(newpop,pm);
    pop0 = newpop;
    fprintf('everybest = %d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%f\n',every_best(j,:));
    disp(pop0);
    fprintf(fid,'everybest = %d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%f\n',every_best(j,:));
    fprintf(fid,'%d,%d,%d,%d,%d,%d,%d,%d,%d,%d\n',pop0');
end
fclose(fid);
toc
% pop1 = zeros(1022,)
% result = [];
% for k = 1:6
%     my_combines = nchoosek(1:10,k);
%     shape = size(my_combines);
%     num = shape(1);
%     for i = 1:num
%         pop0 = zeros(1,10);
%         pop0(my_combines(i,:)) = 1;
%         result = [result; pop0];
%     end
% end
% 
% fpop = zeros(size(result,1),1);
% 
% parfor k = 1:size(result,1)
%     fpop(k) = -fitness(result(k,:));
% end





