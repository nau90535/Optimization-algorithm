function newpop = crossover(selectpop, pc)
    %交配函式, (1,2)交配,(3,4)交配...
    %輸入挑選出要交配的selectpop, 交配率pc, 輸出newpop
    %newpop = crossover(selectpop, pc)
    
    [rowP, columnP] = size(selectpop);
    %雙點法交配, 先複製, 若rand<pc再交配
    for i =1:2:rowP-1
        newpop(i,:) = selectpop(i,:);
        newpop(i+1,:) = selectpop(i+1,:);
        if rand < pc
            %ceil() 無條件進位 point1<point2
            point1 = ceil(rand*columnP);
            point2 = ceil(rand*columnP);
            if point1 > point2
                temp = point1;
                point1 = point2;
                point2 = temp;
            end            
            newpop(i,point1:point2) = selectpop(i+1,point1:point2);
            newpop(i+1,point1:point2) = selectpop(i,point1:point2);            
        end
    end
    
end