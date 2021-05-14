function [decX, decY] = bintoDec(gene)
    %       26個bin數值轉換成 -1.5 <= x <= 4, -3 <= y <= 3 (四捨五入到小數點後3位)
    %       呼叫一次function處理一條gene
    %       [decX, decY] = bintoDec(gene)
    
    randomX = 0;
    randomY = 0;
    
    %參數gene為matrix[1 0 1 ~ 1 1]形式, 無法用bin2dec做
    for i = 1:13
        randomX = randomX + gene(i) * 2^(13 - i);
    end
    
    for i = 14:26
        randomY = randomY + gene(i) * 2^(26 - i);
    end

    decX = round(-1.5 + randomX * 5500 / 8191 /1000, 3);
    decY = round(-3 + randomY * 6000 / 8191 /1000, 3);
    
    %pop(2,:) pop的 row 2
    %sum(A) 每一column 元素總和 得1 row vector
    %sum(A,2) 每一row 元素總和 得1 column vector
end