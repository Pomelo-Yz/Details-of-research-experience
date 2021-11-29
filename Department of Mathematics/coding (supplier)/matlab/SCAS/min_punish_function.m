function xnew = min_punish_function(x0, par, sigma0, eta, rho, gra_step_length,pu_iter_MIN, pu_iter_MAX, gra_iter_MAX)
% min_punish_function.m
% 非画图时请关闭本算法的画图选项（默认：关闭）
% 使用遗传算法时请关闭本代码的输出选项（默认：关闭）
% Written on 2021.07.03 by Rance Lee and his group members
    %****画图区
%     global draw_x draw_con
%     draw_x(1,:) = x0;
    %****画图区结束
    xnew = 0;
    for k = 1:pu_iter_MAX
        [xnew,grad] = gradient_descent(x0,par,eta,sigma0,gra_step_length,gra_iter_MAX);
        %****画图区
%         draw_x(k+1,:) = xnew;
%         draw_con(k) = max(max(par.Cmat * x0',0));
        %****画图区结束
        if(mod(k,10)==0)
		%****输出区
%             fprintf('--------------******************------------------\n')
%             con_text = ',%.10f';
%             con_text = repmat(con_text,1,size(par.Cmat,1));
%             fprintf(['pu_iter =%d, con = ',con_text(2:end),'\n'],k,max(par.Cmat * x0',0));
		%****输出区结束
        end
        if(max(max(par.Cmat * x0',0)) < eta && k > pu_iter_MIN)
		%****输出区
%             fprintf('--------------pu success！------------------\n')
%             con_text = ',%.10f';
%             con_text = repmat(con_text,1,size(par.Cmat,1));
%             fprintf(['pu_iter =%d, con = ',con_text(2:end),'\n'],k,max(par.Cmat * x0',0));
		%****输出区结束
            break
        end
        gra_step_length = gra_step_length / rho;
        sigma0 = sigma0 * rho;
        x0 = xnew;
        % eta = eta / 1.05;
    end
end