function [xnew, grad] = gradient_descent(x0,par,eta,sigma0,gra_step_length,gra_iter_MAX)
% gradient_descent.m
% Written on 2021.07.03 by Rance Lee and his group members
    xold = x0;
    for k = 1:gra_iter_MAX
        grad = punish_function_gradient(x0,par,sigma0);
        xnew = x0 - gra_step_length * grad;
%*****************输出曲开始
%         if(mod(k,50)==0)
%             fprintf('---\n')
%             x_text = ',%.10f';
%             x_text = repmat(x_text,1,length(x0));
%             fprintf(['gra_iter = %d, x0 = ',x_text(2:end) ,',sl = %.10f,obj(x)=%.10f\n'],k,x0,gra_step_length,punish_function(x0,par,sigma0));
%             fprintf(['grad = ',x_text(2:end),'\n'],grad);
%             con_text = ',%.10f';
%             con_text = repmat(con_text,1,size(par.Cmat,1));
%             fprintf(['con = ',con_text(2:end),'\n'],max(par.Cmat * x0',0));
%             fprintf('%.10f\n',norm(xnew - x0,inf));
%         end
%*****************输出区结束
%         if norm(xnew - x0,inf) < eta
%             fprintf('*************************************************\n')
%             x_text = ',%.10f';
%             x_text = repmat(x_text,1,length(x0));
%             fprintf(['gra_success! gra_iter = %d, x0 = ',x_text(2:end) ,',sl = %.10f,obj(x)=%.10f\n'],k,x0,gra_step_length,punish_function(x0,par,sigma0));
%             fprintf(['grad = ',x_text(2:end),'\n'],grad);
%             con_text = ',%.10f';
%             con_text = repmat(con_text,1,size(par.Cmat,1));
%             fprintf(['con = ',con_text(2:end),'\n'],max(par.Cmat * x0',0));
%             break
%         end
        % xnew = x0 - step_length * grad;
        xold = x0;
        x0 = xnew;
    end
end