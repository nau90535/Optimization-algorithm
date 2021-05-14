tStart = cputime;
pc = 0.8;   %crossover rate
pm = 0.05;  %mutation rate
popsize = 64;   %族群大小
counti = 0;     %計算幾代未出現更佳解
bestfit = [];   %紀錄每代best fitvalue
averfit = [];   %記錄每代average fitvalue
bestGene = ones(1,26);  %所有迭代中best gene
bestGeneFit = fitness(bestGene,1);  %所有迭代中best fitvalue
bestpop = 0;    %所有迭代中best fitvalue出自何代

%產生第一代, 迭代開始
pop = firstpop(popsize);

for i = 1:512      %最大迭代次數
    fitvalue = fitness(pop, popsize);
    [bestindividual, bestfit(i)] = best(pop, fitvalue);
    averfit(i) = average(fitvalue);
    counti = counti + 1;
    %紀錄最佳基因,適應值,出自何代,重製counti
    if bestfit(i) < bestGeneFit
        bestGeneFit = bestfit(i);
        bestGene = bestindividual;
        [x,y] = bintoDec(bestGene);
        bestpop = i;
        counti = 0;
    end
    
    if bestGeneFit < -1.9132    %最佳解是否足夠好,可以結束迭代
        break;
    end
    
    if counti > 128         %是否太久沒出現更佳解,可以結束迭代
        break;
    end
    
    %產生下一代
    selectpop = selection(pop, fitvalue);
    newpop = crossover(selectpop, pc);
    newpop = mutation(newpop, pm);
    pop = newpop;
end

nexttile
title('每代最佳fitness')
plot(bestfit);
xlabel('iteration') 
ylabel('best fitness') 
nexttile
title('每代平均fitness')
plot(averfit);
xlabel('iteration') 
ylabel('average fitness') 

tEnd = cputime - tStart;
fprintf('(%4.3f,%4.3f) find the best fitness %5.4f in %d generation !! And elapsed time is %f seconds.', x, y, bestGeneFit, bestpop,tEnd);

