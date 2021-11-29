clc
clear all
global draw_x draw_con
% y = [1,0,0,0,0,1,1,0,1,0];
y = [1,0,1,1,0,0,0,0,1,1];
draw_x = zeros(25,5);
draw_con = zeros(25,1);
tic
fitness(y);
toc

figure(1)
hold on
yyaxis left
plot(1:size(draw_x,1), draw_x',...
        'LineWidth',1);
ylabel('result of minimize punish function in the k^{th} iteration');
ylim([4.5,8]);

yyaxis right
plot(1:size(draw_con,1), draw_con,...
        'LineWidth',1.5);
ylabel('Inf-norm of bound error');
ylim([0,0.05]);

legend('q_1','q_2','q_3','q_4','constrant loss','location','best');
xlabel('The number of iteration');
hold off

% figure(1)
% hold on
% yyaxis left
% plot(1:size(draw_x,1), draw_x',...
%         'LineWidth',1);
% ylabel('result of minimize punish function in the k^{th} iteration');
% ylim([3,8]);
% 
% yyaxis right
% plot(1:size(draw_con,1), draw_con,...
%         'LineWidth',1.5);
% ylabel('Inf-norm of bound error');
% ylim([0,0.05]);
% 
% legend('q_1','q_2','q_3','q_4','q_5','constrant loss','location','best');
% xlabel('The number of iteration');
% hold off
