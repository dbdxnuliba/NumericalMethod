% 超松弛法（分量形式） 求解方程组
clear;
% 输入值
A = [10, -1, -2; -1, 10, -2; -1, -1, 5];
b = [7.2; 8.3; 4.2];
tol = 1e-5;
N = 100;   % 最大迭代次数
omega = 1.74;  % 松弛因子,取值区间(0, 2)
x = [0; 0; 0];
x_backup = [0; 0; 0];   
y = [0; 0; 0];
%
A_ = A;
for i = 1 : length(A)
    A_(i,i) = 0;
end

for k = 0 : N
    for j = 1 : 3
        y(j) = (b(j) - A_(j,:) * x) / A(j,j);
        y(j) = (1 - omega) * x(j) + omega * y(j);
        x_backup(j) = x(j);   % 备份“老值”
        x(j) = y(j);     % “新值” 替换 “老值”
    end
    if (max(abs(x_backup - y)) < tol)
        fprintf('迭代次数: %d\n', k);
        fprintf('方程组的根: %10.8f\n', y);
        break;
    end
end
if k == N
    fprintf('迭代方法失败\n');
end