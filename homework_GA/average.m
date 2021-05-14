function averfit = average(fitvalue)
    %計算整代的平均適應值
    %averFit = average(fitvalue)
    
    total = 0;
    
    for i = 1:size(fitvalue,2)
        total = total + fitvalue(i);
    end
    
    averfit = total / size(fitvalue,2);
end