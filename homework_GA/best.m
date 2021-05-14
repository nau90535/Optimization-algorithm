function [bestindividual,bestfit] = best(pop,fitvalue)
    %選出最優個體函式
    %[bestindividual,bestfit] = best(pop,fitvalue)
    % 輸出變數:bestindividual(最佳個體二進位),bestfit(其適應值)

    [rowP,colP] = size(pop);
    bestindividual = pop(1,:);
    bestfit = fitvalue(1);
    for i = 2:rowP
        if fitvalue(i) < bestfit
            bestindividual = pop(i,:);
            bestfit = fitvalue(i);
        end
    end
end