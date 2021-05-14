function newpop = mutation(newpop, pm)
    %突變函式
    %輸入交配後的newpop,突變率pm, 輸出newpop
    %newpop = mutation(newpop, pm)
    
    [rowP, columnP] = size(newpop);
    %mpoint是突變點, mpoint:mpoint+2會突變
    for i = 1:rowP
        if(rand < pm)
            mpoint = ceil(rand*(columnP-2));
            newpop(i,mpoint:mpoint+2) = not(newpop(i,mpoint:mpoint+2));
        end
    end
    
end