function fitvalue = fitness(pop, popsize)
    %計算適應值
    %輸入pop(一代), 族群大小popsize, 回傳整代的適應度
    %fitvalue = fitness(pop, popsize)
    
    for i = 1 : popsize
        [decX(i), decY(i)] = bintoDec(pop(i, :));
    end
    
    fitvalue = sin(decX+decY) + (decX-decY).^2 - 1.5*decX + 2.5*decY+1;
    %decX^2 is matrix multiplication(矩陣相乘), 
    %decX.^2 is element-wise multiplication(各元素運算)
end