function selectpop = selection(pop, fitvalue)
    %----------------------------------------------
    %一代族群中挑選要交配的基因(輪盤)
    %輸入一代pop, 適應值, 輸出挑選出的基因
    %selectpop = selection(pop, fitvalue)
    %----------------------------------------------
    
    [rowP, columnP] = size(pop);
    %原本fitvalue+2確保>0, 再取倒數(不知為啥得分2行寫)
    Fitvalue = fitvalue + 2;
    Fitvalue = 1./Fitvalue;
    %計算分母, 機率
    totalfit = sum(Fitvalue);
    pFit = Fitvalue / totalfit;
    %cumsum() is cumulative sum 統計裡的累計數量 1,2,3->1,3,6
    pFit = cumsum(pFit);
    
    %random popsize數量的次數(抽籤)
    lottery = rand(1,rowP);
    
    %pick 出要交配的gene, 一樣popsize個
    for i = 1:rowP
        for j = 1:rowP
            if lottery(i) < pFit(j)
                selectpop(i, :) = pop(j, :);
                break;
            end
        end
    end

    
end