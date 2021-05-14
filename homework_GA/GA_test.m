%f(x, y) = sin(x+y) + (x-y)^2 − 1.5x + 2.5y + 1(min),  -1<=x<=4, -3<=y<=3,
%x,y小數後3位, f(x,y)小數後4位

%{
x = linspace(-2, 2, 25);		% 在 x 軸 [-2,2] 之間取 25 點  
y = linspace(-2, 2, 25);		% 在 y 軸 [-2,2] 之間取 25 點  
[xx,yy] = meshgrid(x, y);		% xx 和 yy 都是 25×25 的矩陣  
zz = xx.*exp(-xx.^2-yy.^2);		% zz 也是 25×2 的矩陣  
surf(xx, yy, zz);				% 畫出立體曲面圖  
colormap('default')				% 顏色改回預設值 
%}


x = linspace(-1.5, 4, 55);		
y = linspace(-3, 3, 60);		 
[xx,yy] = meshgrid(x, y);		
zz = sin(xx+yy)+(xx-yy).^2-1.5*(x)+2.5*(yy)+1;		
surf(xx, yy, zz);				 
colormap('default');

